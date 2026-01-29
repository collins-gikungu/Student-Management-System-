page 50120 "Student Activities"
{
    PageType = RoleCenter;
    Caption = 'Student Activities';
    UsageCategory = Administration;
    ApplicationArea = All;
    
    layout
    {
        area(Content)
        {
            group(QuickActions)
            {
                field(StudentCount; StudentCount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Students';
                    ToolTip = 'Total number of students';
                    Editable = false;
                }
                field(ActiveRegistrations; ActiveRegistrations)
                {
                    ApplicationArea = All;
                    Caption = 'Active Registrations';
                    ToolTip = 'Number of active semester registrations';
                    Editable = false;
                }
            }
            group(Links)
            {
                field(LinkText; 'Click actions below to manage students')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(OpenStudentList)
            {
                ApplicationArea = All;
                Caption = 'Student List';
                Image = List;
                RunObject = page "StudentList";
            }
            action(OpenSemesterRegistrations)
            {
                ApplicationArea = All;
                Caption = 'Semester Registrations';
                Image = RegisteredDocs;
                RunObject = page "SemesterRegistrationList";
            }
            action(OpenStudentCharges)
            {
                ApplicationArea = All;
                Caption = 'Student Charges';
                Image = SalesInvoice;
                RunObject = page "StudentChargeList";
            }
            action(OpenStudentUnits)
            {
                ApplicationArea = All;
                Caption = 'Student Units';
                Image = Timesheet;
                RunObject = page "StudentUnitList";
            }
        }
    }
    var
        StudentCount: Integer;
        ActiveRegistrations: Integer;
}