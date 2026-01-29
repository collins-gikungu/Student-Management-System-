table 50107 Grade
{
    Caption = 'Grade';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[20])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Max Points"; Integer)
        {
            Caption = 'Max Points';
            DataClassification = ToBeClassified;
        }
        field(4; "Min Points"; Integer)
        {
            Caption = 'Min Points';
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
