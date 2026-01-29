table 50114 CourseActivity
{
    Caption = 'CourseActivity';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Course "; Code[20])
        {
            Caption = 'Course ';
            DataClassification = ToBeClassified;
            TableRelation = "Course".Code;
        }
        field(2; Year; Code[20])
        {
            Caption = 'Year';
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year".Code;    
        }
        field(3; Semester; Code[20])
        {
            Caption = 'Semester';
            DataClassification = ToBeClassified;
            TableRelation = Semesters.Code;  
        }
        field(4; Activity; Code[20])
        {
            Caption = 'Activity';
            DataClassification = ToBeClassified;
            TableRelation = "Activity".Code;
        }
        field(5; Description; Text[30])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Course ", Year, Semester, Activity)
        {
            Clustered = true;
        }
    }
}
