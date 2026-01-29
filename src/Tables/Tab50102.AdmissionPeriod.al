table 50102 "Admission Period"
{
    Caption = 'Admission Period';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Application Deadline"; Code[20])
        {
            Caption = 'Application Deadline';
            DataClassification = ToBeClassified;
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Academic Year"; Code[20])
        {
            Caption = 'Academic Year';
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year".Code;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
