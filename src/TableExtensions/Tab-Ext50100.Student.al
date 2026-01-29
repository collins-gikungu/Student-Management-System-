tableextension 50100 Student extends Customer
{
    fields
    {
        field(50100; "First Name"; Text[30])
        {
            Caption = 'First Name';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                UpdateFullName;
            end;
        }
        field(50101; "Other Name"; Text[30])
        {
            Caption = 'Other Name';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                UpdateFullName;
            end;
        }
        field(50102; SurName; Text[30])
        {
            Caption = 'SurName';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                UpdateFullName;
            end;
        }
        field(50104; BirthDate; Date)
        {
            Caption = 'BirthDate';
            DataClassification = ToBeClassified;
            trigger OnValidate()
    var
        TodayDate: Date;
        MinimumValidDate: Date;
    begin
        TodayDate := Today;
        MinimumValidDate := CalcDate('-16Y', TodayDate); // 16 years ago from today

        if "BirthDate" >= TodayDate then
            Error('Birth Date cannot be today or a future date.');

        if "BirthDate" > MinimumValidDate then
            Error('Student must be at least 16 years old.');
    end;

        }
        field(50105; Course; Code[20])
        {
            Caption = 'Course';
            DataClassification = ToBeClassified;
            TableRelation = "Course".Code;
            ToolTip = 'The course that the student is enrolled in.';
        }
        field(50106; "Admission Period"; Code[20])
        {
            Caption = 'Admission Period';
            DataClassification = ToBeClassified;
            TableRelation = "Admission Period".Code;
        }
        field(50107; "Customer Type"; Enum "Customer Type")
        {
            Caption = 'Customer Type';
            DataClassification = ToBeClassified;
        }
        field(50108; Gender; Enum "Gender")
        {
            Caption = 'Gender';
            DataClassification = ToBeClassified;
        }
        field(50109; "KCSE Grade"; Code[20])
        {
            Caption = 'KCSE Grade';
            DataClassification = ToBeClassified;
            TableRelation = Grade.Code;
        }
        field(50110; "Id No."; Code[20])
        {
            Caption = 'Id No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
    var
        i: Integer;
    begin
        if StrLen("ID No.") > 8 then
            Error('ID Number cannot exceed 8 digits.');
        if StrLen("ID No.") < 8 then
            Error('ID Number must be at least 8 digits long.');
        // Check if the ID number contains only digits
        for i := 1 to StrLen("ID No.") do begin
            if not ("ID No."[i] in ['0'..'9']) then
                Error('ID Number must contain only numbers.');
        end;
    end;
        }
        field(50111; "Birth Certificate Number"; Code[20])
        {
            Caption = 'Birth Certificate Number';
            DataClassification = ToBeClassified;
        }
        field(50112; "Admission No."; Code[20])
        {
            Caption = 'Admission No.';
            DataClassification = ToBeClassified;
        }
        field(50113; "Mobile No."; Code[20])
{
    Caption = 'Mobile No.';
    DataClassification = ToBeClassified;
    trigger OnValidate()
    var
        RawNumber: Text[20];
        i: Integer;
    begin
        RawNumber := "Mobile No.";
        if (CopyStr(RawNumber, 1, 2) = '07') or (CopyStr(RawNumber, 1, 2) = '01') then begin
            RawNumber := '+254 ' + CopyStr(RawNumber, 2); 
        end;

        if not (CopyStr(RawNumber, 1, 5) = '+254 ') then
            Error('Mobile number must start with +254 followed by the digits.');

        // Check if the length after +254 is more than 9 digits
        if StrLen(RawNumber) > 14 then // +254 (5 chars) + space (1 char) + 9 digits = 15 chars total
            Error('Mobile number after +254 must not exceed 9 digits.');

        for i := 6 to StrLen(RawNumber) do begin
            if not (RawNumber[i] in ['0'..'9']) then
                Error('Mobile number must contain only digits after +254.');
        end;
        "Mobile No." := RawNumber;
    end;
}
    }
    local procedure UpdateFullName()
    begin
      Name := StrSubstNo('%1 %2 %3', "First Name", "Other Name", "Surname");
    end;
}
