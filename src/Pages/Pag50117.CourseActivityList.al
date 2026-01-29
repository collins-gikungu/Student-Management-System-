page 50117 CourseActivityList
{
    ApplicationArea = All;
    Caption = 'CourseActivityList';
    PageType = List;
    SourceTable = CourseActivity;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Course "; Rec."Course ")
                {
                    ToolTip = 'Specifies the value of the Course field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field(Activity; Rec.Activity)
                {
                    ToolTip = 'Specifies the value of the Activity field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
            }
        }
    }
}
