codeunit 50100 "Workflow Event Handling Custom"
{
    var
        WorkflowEvent: Codeunit "Workflow Event Handling";
        WorkflowManagement: Codeunit "Workflow Management";
        SemesterRegistrationSendApprovalTxt: Label 'An approval request for Semester Registration is requested';
        SemesterRegistrationCancelApprovalTxt: Label 'An approval request for Semester Registration is cancelled';


    [EventSubscriber(ObjectType::Codeunit, codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        //SemesterRegistration
        WorkflowEvent.AddEventToLibrary(RunWorkflowOnSendSemesterRegistrationForApprovalCode, Database::"Semester Registration", SemesterRegistrationSendApprovalTxt, 0, FALSE);
        WorkflowEvent.AddEventToLibrary(RunWorkflowOnCancelSemesterRegistrationApprovalRequestCode, Database::"Semester Registration", SemesterRegistrationCancelApprovalTxt, 0, FALSE);
    end;

    //SemesterRegistration 
    procedure RunWorkflowOnSendSemesterRegistrationForApprovalCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnSendSemesterRegistrationForApproval'));
    end;

    procedure RunWorkflowOnCancelSemesterRegistrationApprovalRequestCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnCancelSemesterRegistrationApprovalRequest'));
    end;

    procedure RunWorkflowOnAfterReleaseSemesterRegistrationCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnAfterReleaseSemesterRegistration'));
    end;

    // The event 'OnSendSemesterRegistrationForApproval' does not exist in the target codeunit.
    // Please implement this logic elsewhere or subscribe to an existing event if needed.

    procedure RunWorkflowOnCancelSemesterRegistrationApprovalRequest(VAR SemesterRegistration: Record "Semester Registration")
    var
        SemesterRegistrationRec: Record "Semester Registration";
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelSemesterRegistrationApprovalRequestCode(), SemesterRegistration);
        SemesterRegistrationRec.Reset();
        SemesterRegistrationRec.SetRange("No.", SemesterRegistration."No.");
        if SemesterRegistrationRec.FindFirst() then begin
            SemesterRegistrationRec."Status " := SemesterRegistrationRec."Status "::Open;
            SemesterRegistrationRec.Modify();
        end;
    end;

}



