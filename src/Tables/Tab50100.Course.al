table 50100 Course
{
    Caption = 'Course';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Minimum Grade"; Code[20])
        {
            Caption = 'Minimum Grade';
            DataClassification = ToBeClassified;
            TableRelation = Grade.Code;
    
        }
        field(4; "No. of  Years"; Integer)
        {
            Caption = 'No. of  Years';
            DataClassification = ToBeClassified;
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
