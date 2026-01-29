page 50118 "Student Mgt. Setup"
{
    ApplicationArea = All;
    Caption = 'Student Management Setup';
    PageType = Card;
    SourceTable = "Student Setup";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Registration Nos"; Rec."Registration Nos")
                {
                    ToolTip = 'Specifies the value of the Student No. Series field.', Comment = '%';
                }
                field("Student Nos"; Rec."Student Nos")
                {
                    ToolTip = 'Specifies the value of the Student Nos field.', Comment = '%';
                }
              
            }
        }
    }
}
