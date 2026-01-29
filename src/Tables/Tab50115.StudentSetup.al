table 50115 "Student Setup"
{
    Caption = 'Student Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Registration Nos"; Code[20])
        {
            Caption = 'Registration Nos';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "Student Nos"; Code[20])
        {
            Caption = 'Student Nos';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
