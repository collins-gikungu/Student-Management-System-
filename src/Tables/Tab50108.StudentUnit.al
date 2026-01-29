table 50108 StudentUnit
{
    Caption = 'StudentUnit';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Student No."; Code[20])
        {
            Caption = 'Student No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(2; Course; Code[20])
        {
            Caption = 'Course';
            DataClassification = ToBeClassified;
            TableRelation = Course.Code; 
        }
        field(3; Year; Code[20])
        {
            Caption = 'Year';
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year".Code;
        }
        field(4; Semester; Code[20])
        {
            Caption = 'Semester';
            DataClassification = ToBeClassified;
            TableRelation = Semesters.Code;
        }
        field(5; Unit; Code[20])
        {
            Caption = 'Unit';
            DataClassification = ToBeClassified;
            TableRelation = "Units".Code;
        }
        field(6; "Academic Year"; Code[20])
        {
            Caption = 'Academic Year';
            DataClassification = ToBeClassified;
            TableRelation = AcademicYear.Code;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Student No.",Course,Year,Semester,Unit)
        {
            Clustered = true;
        }
    }
}
