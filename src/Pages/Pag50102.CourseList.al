page 50102 CourseList
{
    ApplicationArea = All;
    Caption = 'CourseList';
    PageType = List;
    SourceTable = Course;
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
                field("Minimum Grade"; Rec."Minimum Grade")
                {
                    ToolTip = 'Specifies the value of the Minimum Grade field.', Comment = '%';
                }
                field("No. of  Years"; Rec."No. of  Years")
                {
                    ToolTip = 'Specifies the value of the No. of  Years field.', Comment = '%';
                }
            }
        }
    }
}
