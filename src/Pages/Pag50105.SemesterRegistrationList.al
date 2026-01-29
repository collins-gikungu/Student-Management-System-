page 50105 SemesterRegistrationList
{
    ApplicationArea = All;
    Caption = 'SemesterRegistrationList';
    PageType = List;
    SourceTable = "Semester Registration";
    UsageCategory = Lists;
    CardPageId = "Semester Registration Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Student No. "; Rec."Student No. ")
                {
                    ToolTip = 'Specifies the value of the Student No. field.', Comment = '%';
                }
                field("Student Name "; Rec."Student Name ")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
                field("Course "; Rec."Course ")
                {
                    ToolTip = 'Specifies the value of the Course field.', Comment = '%';
                }
                field("Year "; Rec."Year ")
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field("Semester "; Rec."Semester ")
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field("Registration Date "; Rec."Registration Date ")
                {
                    ToolTip = 'Specifies the value of the Registration Date field.', Comment = '%';
                }
                field("Status "; Rec."Status ")
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Posted "; Rec."Posted ")
                {
                    ToolTip = 'Specifies the value of the Posted field.', Comment = '%';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ToolTip = 'Specifies the value of the Posted By field.', Comment = '%';
                }
                field("Date Posted "; Rec."Date Posted ")
                {
                    ToolTip = 'Specifies the value of the Date Posted field.', Comment = '%';
                }
                field("Academic  Year "; Rec."Academic  Year ")
                {
                    ToolTip = 'Specifies the value of the Academic  Year field.', Comment = '%';
                }
                field("Period "; Rec."Period ")
                {
                    ToolTip = 'Specifies the value of the Period field.', Comment = '%';
                }
            }
        }
    }
}
    

