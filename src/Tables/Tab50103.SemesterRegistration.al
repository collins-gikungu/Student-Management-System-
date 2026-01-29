table 50103 "Semester Registration"
{
    Caption = 'Semester Registration';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            NotBlank = true;
            Editable = true;
        }
        field(2; "Student No. "; Code[20])
        {
            Caption = 'Student No. ';
            DataClassification = ToBeClassified;
            TableRelation = Customer where("No." = filter('STUD*')); 
            NotBlank = true;
            trigger OnValidate()
    var
        Cust: Record Customer;
    begin
        if Cust.Get("Student No. ") then begin
            "Student Name " := Cust.Name; 
            "Course " := Cust."Course";
            
        end;
    end;
        }
        field(3; "Student Name "; Text[100])
        {
            Caption = 'Student Name ';
            DataClassification = ToBeClassified;
        }
        field(4; "Course "; Code[20])
        {
            Caption = 'Course ';
            DataClassification = ToBeClassified;
            TableRelation = "Course".Code;
        }
        field(5; "Year "; Code[20])
        {
            Caption = 'Year ';
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year".Code;
        }
        field(6; "Semester "; Code[20])
        {
            Caption = 'Semester ';
            DataClassification = ToBeClassified;
            TableRelation = Semesters.Code;
        }
        field(7; "Registration Date "; Date)
        {
            Caption = 'Registration Date ';
            DataClassification = ToBeClassified;
        }
        field(8; "Status "; Enum "Status")
        {
            Caption = 'Status ';
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series "; Code[20])
        {
            Caption = 'No. Series ';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
            Editable = false;
        }
        field(10; "Posted "; Boolean)
        {
            Caption = 'Posted ';
            DataClassification = ToBeClassified;
        }
        field(11; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
            DataClassification = ToBeClassified;    
        }
        field(12; "Date Posted "; DateTime)
        {
            Caption = 'Date Posted ';
            DataClassification = ToBeClassified;
        }
        field(13; "Academic  Year "; Code[20])
        {
            Caption = 'Academic  Year ';
            DataClassification = ToBeClassified;
            TableRelation = "AcademicYear".Code;
        }
        field(14; "Period "; Code[20])
        {
            Caption = 'Period ';
            DataClassification = ToBeClassified; 
            TableRelation = "Admission Period";   
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
   trigger OnInsert()
    var
        SetupRec: Record "Student Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            if SetupRec.Get('STUDENTSETUP') then begin
                "No. Series " := SetupRec."Registration Nos";
                "No." := NoSeries.GetNextNo("No. Series ", WorkDate(), true);
            end else
                Error('Student Setup record not found. Please configure Student No. Series first.');
        end;
    end;



}
