codeunit 50102 "Approvals Mgmt. Custom"
{
    var
        WorkFlowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling Custom";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
        PendingApprovalExistsErr: Label 'An approval request already exists.';
        NoPendingApprovalErr: Label 'No pending approval requests exist for this document.';
        ApprovalEntry: Record "Approval Entry";
        UserSetup: Record "User Setup";

    // Semester Registration Approval Workflow
    procedure CheckSemesterRegistrationApprovalsWorkflowEnabled(var SemesterRegistration: Record "Semester Registration"): Boolean
    begin
        if not IsSemesterRegistrationApprovalsWorkflowEnabled(SemesterRegistration) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;

    procedure IsSemesterRegistrationApprovalsWorkflowEnabled(var SemesterRegistration: Record "Semester Registration"): Boolean
    begin
        exit(WorkflowManagement.CanExecuteWorkflow(SemesterRegistration, WorkflowEventHandling.RunWorkflowOnSendSemesterRegistrationForApprovalCode()));
    end;

    procedure CancelSemesterRegistrationApprovalRequest(var SemesterRegistration: Record "Semester Registration")
    var
      ApprovalEntry: Record "Approval Entry";
      ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
      SemesterRegistration.TestField("Status ", SemesterRegistration."Status "::Pending);
    
      ApprovalEntry.Reset();
      ApprovalEntry.SetRange("Table ID", Database::"Semester Registration");
      ApprovalEntry.SetRange("Document No.", SemesterRegistration."No.");
      ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
    
    if ApprovalEntry.IsEmpty() then
        Error(NoPendingApprovalErr);
    
      // Delete all approval entries directly
      ApprovalEntry.DeleteAll();
    
      SemesterRegistration.Validate("Status ", SemesterRegistration."Status "::Open);
      SemesterRegistration.Modify(true);
    end;

     procedure ApproveSemesterRegistration(var SemesterRegistration: Record "Semester Registration")
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        SemesterRegistration.TestField("Status ", SemesterRegistration."Status "::"Pending");
        
        if not CheckPendingApprovalEntriesExist(SemesterRegistration."No.") then
            Error(NoPendingApprovalErr);
        
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Table ID", Database::"Semester Registration");
        ApprovalEntry.SetRange("Document No.", SemesterRegistration."No.");
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        if ApprovalEntry.FindFirst() then
            ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);
        
        SemesterRegistration.Validate("Status ", SemesterRegistration."Status "::Approved);
        SemesterRegistration.Modify(true);
    end;

    procedure RejectSemesterRegistration(var SemesterRegistration: Record "Semester Registration")
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        SemesterRegistration.TestField("Status ", SemesterRegistration."Status "::"Pending");
        
        if not CheckPendingApprovalEntriesExist(SemesterRegistration."No.") then
            Error(NoPendingApprovalErr);
        
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Table ID", Database::"Semester Registration");
        ApprovalEntry.SetRange("Document No.", SemesterRegistration."No.");
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        if ApprovalEntry.FindFirst() then
            ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);
        
        SemesterRegistration.Validate("Status ", SemesterRegistration."Status "::Inactive);
        SemesterRegistration.Modify(true);
    end;

    procedure DelegateSemesterRegistration(var SemesterRegistration: Record "Semester Registration")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalEntryToUpdate: Record "Approval Entry";
    begin
        SemesterRegistration.TestField("Status ", SemesterRegistration."Status "::"Pending");
        
        if not CheckPendingApprovalEntriesExist(SemesterRegistration."No.") then
            Error(NoPendingApprovalErr);
        
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Table ID", Database::"Semester Registration");
        ApprovalEntry.SetRange("Document No.", SemesterRegistration."No.");
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        
        if ApprovalEntry.FindFirst() then begin
            if UserSetup.Get(UserId) then begin
                if not UserSetup."Approval Administrator" then
                    Error('You do not have permission to delegate approvals.');
                
                // Create a new approval entry for the delegate
                ApprovalEntryToUpdate := ApprovalEntry;
                ApprovalEntryToUpdate.Validate("Approver ID", UserId);
                ApprovalEntryToUpdate.Modify(true);
            end;
        end;
    end;

     local procedure CheckPendingApprovalEntriesExist(DocumentNo: Code[20]): Boolean
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Table ID", Database::"Semester Registration");
        ApprovalEntry.SetRange("Document No.", DocumentNo);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        exit(not ApprovalEntry.IsEmpty());
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendSemesterRegistrationForApproval(var SemesterRegistration: Record "Semester Registration")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelSemesterRegistrationApprovalRequest(var SemesterRegistration: Record "Semester Registration")
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        SemesterRegistration: Record "Semester Registration";
    begin
        case RecRef.Number of
            Database::"Semester Registration":
                begin
                    RecRef.SetTable(SemesterRegistration);
                    SemesterRegistration.Validate("Status ", SemesterRegistration."Status "::"Pending");
                    SemesterRegistration.Modify(true);
                    Variant := SemesterRegistration;
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    local procedure RunWorkflowOnRejectDocument(var ApprovalEntry: Record "Approval Entry")
    var
        SemesterRegistration: Record "Semester Registration";
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectDocumentCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");

        case ApprovalEntry."Table ID" of
            Database::"Semester Registration":
                begin
                    SemesterRegistration.Reset();
                    SemesterRegistration.SetRange("No.", ApprovalEntry."Document No.");
                    if SemesterRegistration.FindFirst() then begin
                        SemesterRegistration.Validate("Status ", SemesterRegistration."Status "::Inactive);
                        SemesterRegistration.Modify(true);
                    end;
                end;
        end;
    end;

    procedure RunWorkflowOnRejectDocumentCode(): Code[128]
    begin
        exit(Uppercase('RunWorkflowOnAfterRejectDocument'));
    end;

    [EventSubscriber(ObjectType::Table, Database::"Semester Registration", 'OnAfterValidateEvent', 'Status ', false, false)]
    local procedure OnAfterValidateStatus(var Rec: Record "Semester Registration"; var xRec: Record "Semester Registration"; CurrFieldNo: Integer)
    begin
        if (xRec."Status " = xRec."Status "::Approved) and 
           (Rec."Status " <> xRec."Status ")
        then
            Error('Cannot change status from Approved.');
    end;
}