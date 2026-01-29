codeunit 50103 "Workflow Responses"
{
    var
        SemesterRegistrationSetup: Record "Semester Registration";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

    //Semester Registration
    procedure SemesterRegistrationRelease(var SemesterRegistration: Record "Semester Registration")
    var
        SemesterRegistrationRec: Record "Semester Registration";
    begin
        SemesterRegistrationRec.Reset();
        SemesterRegistrationRec.SetRange("No.", SemesterRegistration."No.");
        if SemesterRegistrationRec.FindFirst() then begin
            SemesterRegistrationRec."Status " := SemesterRegistrationRec."Status "::Approved;
            SemesterRegistrationRec.Modify();
        end;
    end;

    procedure SemesterRegistrationReopen(var SemesterRegistration: Record "Semester Registration")
    var
        SemesterRegistrationRec: Record "Semester Registration";
    begin
        SemesterRegistrationRec.Reset();
        SemesterRegistrationRec.SetRange("No.", SemesterRegistration."No.");
        if SemesterRegistrationRec.FindFirst() then begin
            SemesterRegistrationRec."Status " := SemesterRegistrationRec."Status "::Open;
            SemesterRegistrationRec.Modify();
        end;
    end;


    [IntegrationEvent(true, false)]
    local procedure OnAfterReleaseWarehouseReceiptHeader(var PaymentRec: Record "Warehouse Receipt Header")
    begin
    end;
}



