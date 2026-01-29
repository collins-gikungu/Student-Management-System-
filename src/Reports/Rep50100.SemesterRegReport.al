report 50100 "Semester Reg Report"
{
    ApplicationArea = All;
    Caption = 'Semester Reg Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/Reports/Rep50100.SemesterRegReport.rdl';

    dataset
    {
        dataitem(SemesterRegistration; "Semester Registration")
        {
            column(No; "No.")
            {
            }
            column(StudentNo; "Student No. ")
            {
            }
            column(StudentName; "Student Name ")
            {
            }
            column(Course; "Course ")
            {
            }
            column(Year; "Year ")
            {
            }
            column(Semester; "Semester ")
            {
            }
            column(RegistrationDate; "Registration Date ")
            {
            }
            column(Status; "Status ")
            {
            }
            column(NoSeries; "No. Series ")
            {
            }
            column(Posted; "Posted ")
            {
            }
            column(PostedBy; "Posted By")
            {
            }
            column(DatePosted; "Date Posted ")
            {
            }
            column(AcademicYear; "Academic  Year ")
            {
            }
            column(Period; "Period ")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                     field("Status Filter"; "SemesterRegistration"."Status ") { ApplicationArea = All; }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
