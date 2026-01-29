table 50104 "Semester Registration Line "
{
    Caption = 'Semester Registration Line ';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
            TableRelation = "Semester Registration"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Unit "; Code[20])
        {
            Caption = 'Unit ';
            DataClassification = ToBeClassified;
            TableRelation = "Units".Code;
        }
        field(4; "Description "; Text[100])
        {
            Caption = 'Description ';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
