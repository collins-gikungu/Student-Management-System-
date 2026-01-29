table 50112 "Course Semester"
{
    Caption = 'Course Semester';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Course; Code[20])
        {
            Caption = 'Course';
            DataClassification = ToBeClassified;
            TableRelation = Course.Code; 
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
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(5; Priority; Integer)
        {
            Caption = 'Priority';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Course,Year,Semester)
        {
            Clustered = true;
        }
    }
}
