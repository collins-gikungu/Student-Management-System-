page 50113 StudentChargeList
{
    ApplicationArea = All;
    Caption = 'StudentChargeList';
    PageType = List;
    SourceTable = StudentCharge;
    UsageCategory = Lists;
    
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
                field("Student No."; Rec."Student No.")
                {
                    ToolTip = 'Specifies the value of the Student No. field.', Comment = '%';
                }
                field(Course; Rec.Course)
                {
                    ToolTip = 'Specifies the value of the Course field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field(Activity; Rec.Activity)
                {
                    ToolTip = 'Specifies the value of the Activity field.', Comment = '%';
                }
                field("Admission Period"; Rec."Admission Period")
                {
                    ToolTip = 'Specifies the value of the Admission Period field.', Comment = '%';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ToolTip = 'Specifies the value of the Academic Year field.', Comment = '%';
                }
            }
        }
    }
}
