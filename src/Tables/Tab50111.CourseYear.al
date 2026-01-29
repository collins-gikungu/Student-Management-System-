table 50111 "Course Year"
{
    Caption = 'Course Year';
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
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Course, Year)
        {
            Clustered = true;
        }
    }
}
