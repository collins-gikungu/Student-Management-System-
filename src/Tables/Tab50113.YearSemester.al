table 50113 YearSemester
{
    Caption = 'YearSemester';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Year; Code[20])
        {
            Caption = 'Year';
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year".Code;    
        }
        field(2; Semester; Code[20])
        {
            Caption = 'Semester';
            DataClassification = ToBeClassified;
            TableRelation = Semesters.Code; 
        }
    }
    keys
    {
        key(PK; Year,Semester)
        {
            Clustered = true;
        }
    }
}
