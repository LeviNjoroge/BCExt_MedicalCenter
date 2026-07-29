codeunit 99903 "Processes Helper"
{
    procedure CreateNewVisit(Patient:Code[20])
    var
        PatientTable: Record "Patients Table";
        SendNotification: Codeunit "Send Notifications";
    begin
        VisitTable.Init();
        VisitTable."Patient Number" := Patient;
        VisitTable.Time := Time;
        VisitTable.Status := "Visit Status"::Waiting;
        VisitTable.Insert(true);
        PatientTable.Get(Patient);
        SendNotification.WelcomePatientForVisit(PatientTable."Full Name", PatientTable.Email, Time, VisitTable."Visit Number");
    end;

    procedure CompleteAssessment_AwaitConsultation(VisitNo: Code[20])
    begin
        if VisitTable.Get(VisitNo) then begin
            VisitTable.Status := "Visit Status"::"Awaiting Consultation";
            VisitTable.Modify();
            Message('Assessment recorded successfully!\Patient is awaiting consultation');
        end;
    end;

    procedure CompleteAssessment_UnderStabilisation(VisitNo: Code[20])
    begin
        if VisitTable.Get(VisitNo) then begin
            VisitTable.Status := "Visit Status"::"Awaiting Consultation";
            VisitTable.Modify();
            Message('Assessment recorded successfully!\Patient taken for emergency care and stabilisation');
        end;
    end;

    procedure CompleteAssessment_Awaiting(VisitNo: Code[20])
    begin
        if VisitTable.Get(VisitNo) then begin
            VisitTable.Status := "Visit Status"::Waiting;
            VisitTable.Modify();
            Message('Assessment recorded successfully!\Patient is waiting for further direction');
        end;
    end;

    // procedure CompletedLabTest()

    var
        VisitTable: Record "Visit Table";
}