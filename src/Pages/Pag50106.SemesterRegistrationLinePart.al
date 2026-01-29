page 50106 SemesterRegistrationLinePart
{
    ApplicationArea = All;
    Caption = 'SemesterRegistrationLinePart';
    PageType = ListPart;
    SourceTable = "Semester Registration Line ";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Unit "; Rec."Unit ")
                {
                    ToolTip = 'Specifies the value of the Unit field.', Comment = '%';
                }
                field("Description "; Rec."Description ")
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
