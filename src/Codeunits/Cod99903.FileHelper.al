codeunit 99903 FileHelper
{
    procedure CreateNewVisit(Patient:Code[20])
    
    begin
        VisitTable.Init();
        VisitTable."Patient Number" := Patient;
        VisitTable.Time := Time;
        VisitTable.Status := "Visit Status"::Waiting;
        VisitTable.Insert(true);
    end;

    procedure CompleteAssessment(VisitNo: Code[20])
    begin
        if VisitTable.Get(VisitNo) then begin
            VisitTable.Status := "Visit Status"::Assessed;
            VisitTable.Modify();
        end;
    end;

    var
        VisitTable: Record "Visit Table";
}