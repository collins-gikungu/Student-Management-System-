page 50116 YearSemesterList
{
    ApplicationArea = All;
    Caption = 'YearSemesterList';
    PageType = List;
    SourceTable = YearSemester;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
            }
        }
    }
}
