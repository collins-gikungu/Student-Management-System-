table 50110 StudentCharge
{
    Caption = 'StudentCharge';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Student No."; Code[20])
        {
            Caption = 'Student No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(3; Course; Code[20])
        {
            Caption = 'Course';
            DataClassification = ToBeClassified;
            TableRelation = Course.Code; 
        }
        field(4; Year; Code[20])
        {
            Caption = 'Year';
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year".Code;
        }
        field(5; Amount; Code[20])
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(6; Activity; Code[20])
        {
            Caption = 'Activity';
            DataClassification = ToBeClassified;
        }
        field(7; "Admission Period"; Code[20])
        {
            Caption = 'Admission Period';
            DataClassification = ToBeClassified;
            TableRelation = "Admission Period".Code;
        }
        field(8; "Academic Year"; Code[20])
        {
            Caption = 'Academic Year';
            DataClassification = ToBeClassified;
            TableRelation = AcademicYear.Code;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
