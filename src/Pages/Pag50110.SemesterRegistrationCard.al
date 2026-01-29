page 50110 "Semester Registration Card"
{
    ApplicationArea = All;
    Caption = 'Semester Registration Card';
    PageType = Card;
    SourceTable = "Semester Registration";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Student No."; Rec."Student No. ")
                {
                    ToolTip = 'Specifies the value of the Student No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Student Name"; Rec."Student Name ")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Course"; Rec."Course ")
                {
                    ToolTip = 'Specifies the value of the Course field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Year"; Rec."Year ")
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Semester"; Rec."Semester ")
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Registration Date"; Rec."Registration Date ")
                {
                    ToolTip = 'Specifies the value of the Registration Date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status ")
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Posted"; Rec."Posted ")
                {
                    ToolTip = 'Specifies the value of the Posted field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ToolTip = 'Specifies the value of the Posted By field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Date Posted"; Rec."Date Posted ")
                {
                    ToolTip = 'Specifies the value of the Date Posted field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Academic Year"; Rec."Academic  Year ")
                {
                    ToolTip = 'Specifies the value of the Academic Year field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Period"; Rec."Period ")
                {
                    ToolTip = 'Specifies the value of the Period field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
            
            group("Registration Lines")
            {
                part(RegistrationLines; "SemesterRegistrationLinePart")
                {
                    SubPageLink = "Document No." = field("No.");
                    UpdatePropagation = Both;
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            group(Workflow)
            {
                Caption = 'Workflow';
                
                action(SendApprovalRequest)
                {
                    ApplicationArea = All;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the semester registration.';
                    
                    trigger OnAction()
                    var
                        ApprovalsMgmtCustom: Codeunit "Approvals Mgmt. Custom";
                    begin
                       if ApprovalsMgmtCustom.CheckSemesterRegistrationApprovalsWorkflowEnabled(Rec) then
                       ApprovalsMgmtCustom.OnSendSemesterRegistrationForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel Approval Request';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Cancel the approval request.';
                    
                    trigger OnAction()
                    var
                        ApprovalsMgmtCustom: Codeunit "Approvals Mgmt. Custom";
                    begin
                        ApprovalsMgmtCustom.CancelSemesterRegistrationApprovalRequest(Rec);
                        CurrPage.Update();
                    end;
                }
            }
            action(PostRegistration)
            {
                Caption = 'Post Registration';
                Image = Post;
                ApplicationArea = All;
                trigger OnAction()
                var
                    RecRef: RecordRef;
                begin
                    if Rec."Posted " then
                        Error('Registration already posted.');

                    Rec."Posted " := true;
                    Rec."Posted By" := UserId();
                    Rec."Date Posted " := CreateDateTime(Today, 0T);
                    Rec.Modify(true);
                    Message('Semester registration %1 has been posted.', Rec."No.");
                end;
            }

            action(ReopenRegistration)
            {
                Caption = 'Reopen Registration';
                Image = Reopen;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if not Rec."Posted " then
                        Error('Registration is not posted yet.');

                    Rec."Posted " := false;
                    Rec."Posted By" := '';
                    Rec."Date Posted " := 0DT;
                    Rec.Modify(true);
                    Message('Semester registration %1 has been reopened.', Rec."No.");
                end;
            }
            action(SendNotification)
            {
             Caption = 'Send Notification';
             Image = Email;
             ApplicationArea = All;
             Promoted = true;
             PromotedCategory = Category4;
             PromotedIsBig = false;
             ToolTip = 'Send a notification to the student for this registration.';
    
              trigger OnAction()
              var
                 NotificationTxt: Text;
             begin
             if Rec."Student No. " = '' then
              Error('Student No. is missing. Cannot send notification.');

                 NotificationTxt := StrSubstNo(
                 'Notification sent to student %1 (%2) regarding their semester registration.',
                Rec."Student Name ", Rec."Student No. ");

                 Message(NotificationTxt); 
             end;
        }

            action(ShowStudentDetails)
            {
                ApplicationArea = All;
                Caption = 'Show Student Details';
                Image = Customer;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = false;
                ToolTip = 'View details of the student associated with this registration.';
                
                trigger OnAction()
                var
                    StudentCardPage: Page "Student Card";
                    StudentRec: Record Customer;
                begin
                    if not StudentRec.Get(Rec."Student No. ") then
                        Error('Student %1 not found.', Rec."Student No. ");
                    
                    StudentCardPage.SetTableView(StudentRec);
                    StudentCardPage.RunModal();
                end;
            }

            action(OpenStudentCard)
            {
            Caption = 'Open Student Card';
            Image = Navigate;
            ApplicationArea = All;
            ToolTip = 'Open the Student Card related to this registration.';
    
            trigger OnAction()
            var
             StudentRec: Record Customer; 
             PageId: Integer;
            begin
            if Rec."Student No. " = '' then
             Error('Student No. is missing. Cannot open student card.');

             StudentRec.SetRange("No.", Rec."Student No. ");
            if StudentRec.FindFirst() then begin
             PageId := Page::"Student Card"; 
             PAGE.Run(PageId, StudentRec);
              end else
            Error('Student not found.');
            end;
           }
            action(ShowCourseDetails)
            {
                ApplicationArea = All;
                Caption = 'Show Course Details';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = false;
                ToolTip = 'View details of the course associated with this registration.';
                
                trigger OnAction()
                var
                    CourseDetailsPage: Page "CourseList";
                    CourseRec: Record "Course";
                begin
                    if not CourseRec.Get(Rec."Course ") then
                        Error('Course %1 not found.', Rec."Course ");
                    
                    CourseDetailsPage.SetTableView(CourseRec);
                    CourseDetailsPage.RunModal();
                end;
            }
            group(Reports)
            {
               Caption = 'Reports';

              action(PrintSemesterRegistration)
              {
                ApplicationArea = All;
                Caption = 'Print Semester Registration';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ToolTip = 'Print this semester registration record.';

               trigger OnAction()
               var
                  SemesterRegReport: Report "Semester Reg Report"; // Use the actual name or ID of your report
               begin
                  SemesterRegReport.SetTableView(Rec); // Optional: Apply current record
                REPORT.RUNMODAL(Report::"Semester Reg Report", true, false, Rec);
              end;
         }
    }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Approve the semester registration.';
                    
                    trigger OnAction()
                    var
                        ApprovalsMgmtCustom: Codeunit "Approvals Mgmt. Custom";
                    begin
                        ApprovalsMgmtCustom.ApproveSemesterRegistration(Rec);
                        CurrPage.Update();
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Reject the semester registration.';
                    
                    trigger OnAction()
                    var
                        ApprovalsMgmtCustom: Codeunit "Approvals Mgmt. Custom";
                    begin
                        ApprovalsMgmtCustom.RejectSemesterRegistration(Rec);
                        CurrPage.Update();
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Delegate the approval to another user.';
                    
                    trigger OnAction()
                    var
                        ApprovalsMgmtCustom: Codeunit "Approvals Mgmt. Custom";
                    begin
                        ApprovalsMgmtCustom.DelegateSemesterRegistration(Rec);
                        CurrPage.Update();
                    end;
                }
            }
        }
    }
    
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        SetupRec: Record "Student Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Rec."No." = '' then begin
            if SetupRec.Get('STUDENTSETUP') then begin
                Rec."No. Series " := SetupRec."Registration Nos";
                Rec."No." := NoSeries.GetNextNo(Rec."No. Series ", WorkDate(), true);
            end else
                Error('Student Setup record not found.');
        end;
    end;
    
    trigger OnAfterGetCurrRecord()
    begin
        SetWorkflowActionsVisibility();
    end;
    
    local procedure SetWorkflowActionsVisibility()
    var
        ApprovalsMgmtCustom: Codeunit "Approvals Mgmt. Custom";
    begin
        IsSendApprovalRequestVisible := ApprovalsMgmtCustom.IsSemesterRegistrationApprovalsWorkflowEnabled(Rec) and (Rec."Status " = Rec."Status "::Open);
        IsCancelApprovalRequestVisible := Rec."Status " = Rec."Status "::"Pending";
        IsApproveVisible := Rec."Status " = Rec."Status "::"Pending";
        IsRejectVisible := Rec."Status " = Rec."Status "::"Pending";
        IsDelegateVisible := Rec."Status " = Rec."Status "::"Pending";
    end;
    
    var
        [InDataSet]
        IsSendApprovalRequestVisible: Boolean;
        [InDataSet]
        IsCancelApprovalRequestVisible: Boolean;
        [InDataSet]
        IsApproveVisible: Boolean;
        [InDataSet]
        IsRejectVisible: Boolean;
        [InDataSet]
        IsDelegateVisible: Boolean;
}