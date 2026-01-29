page 50100 "Student Card"
{
    ApplicationArea = All;
    Caption = 'Student Card';
    PageType = Card;
    SourceTable = Customer;
    UsageCategory = Administration;
    SaveValues = true;

    
    layout
    {
        area(Content)
        {
            group(General)
            {
                
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                }
                
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field("Other Name"; Rec."Other Name")
                {
                    ToolTip = 'Specifies the value of the Other Name field.', Comment = '%';
                }
                field(SurName; Rec.SurName)
                {
                    ToolTip = 'Specifies the value of the SurName field.', Comment = '%';
                }
                field(FullName; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the FullName field.', Comment = '%';
                }
                field(BirthDate; Rec.BirthDate)
                {
                    ToolTip = 'Specifies the value of the BirthDate field.', Comment = '%';
                }
                field(Course; Rec.Course)
                {
                    ToolTip = 'Specifies the value of the Course field.', Comment = '%';
                }
                field("Admission Period"; Rec."Admission Period")
                {
                    ToolTip = 'Specifies the value of the Admission Period field.', Comment = '%';
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ToolTip = 'Specifies the value of the Customer Type field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("KCSE Grade"; Rec."KCSE Grade")
                {
                    ToolTip = 'Specifies the value of the KCSE Grade field.', Comment = '%';
                }
                field("Id No."; Rec."Id No.")
                {
                    ToolTip = 'Specifies the value of the Id No. field.', Comment = '%';
                }
                field("Birth Certificate Number"; Rec."Birth Certificate Number")
                {
                    ToolTip = 'Specifies the value of the Birth Certificate Number field.', Comment = '%';
                }
                field("Admission No."; Rec."Admission No.")
                {
                    ToolTip = 'Specifies the value of the Admission No. field.', Comment = '%';
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ToolTip = 'Specifies the value of the Mobile No. field.', Comment = '%';
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
var
    SetupRec: Record "Student Setup";
    NoSeries: Codeunit "No. Series";
begin
    if Rec."No." = '' then begin
        if SetupRec.Get('STUDENTSETUP') then begin
            Rec."No." := NoSeries.GetNextNo(SetupRec."Student Nos", WorkDate(), true);
        end else
            Error('Student Setup record not found. Please configure it first.');
    end;
end;
}
