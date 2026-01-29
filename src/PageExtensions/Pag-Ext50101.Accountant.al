page 50119 "Student Accountant Role Center"
{
    PageType = RoleCenter;
    Caption = 'Student Accountant';

    layout
    {
        area(RoleCenter)
        {
            part(AccountantActivities; "Accountant Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(StudentActivities; "Student Activities")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Embedding)
        {
            action("Chart of Accounts")
            {
                RunObject = Page "Chart of Accounts";
            }
        }
        area(Creation)
        {
            action(StudentList)
            {
                RunObject = page "StudentList";
            }
            action(SemesterRegistrations)
            {
                RunObject = page "SemesterRegistrationList";
            }
        }
    }
}
profile StudentAccountant
{
    Caption = 'Student Accountant';
    RoleCenter = "Student Accountant Role Center";
    Description = 'Accountant with student management capabilities';
    Promoted = true;
}