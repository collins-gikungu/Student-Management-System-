page 50109 GradeList
{
    ApplicationArea = All;
    Caption = 'GradeList';
    PageType = List;
    SourceTable = Grade;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Max Points"; Rec."Max Points")
                {
                    ToolTip = 'Specifies the value of the Max Points field.', Comment = '%';
                }
                field("Min Points"; Rec."Min Points")
                {
                    ToolTip = 'Specifies the value of the Min Points field.', Comment = '%';
                }
            }
        }
    }
}
