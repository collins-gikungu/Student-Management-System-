page 50114 CourseYearList
{
    ApplicationArea = All;
    Caption = 'CourseYearList';
    PageType = List;
    SourceTable = "Course Year";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Course; Rec.Course)
                {
                    ToolTip = 'Specifies the value of the Course field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
