codeunit 99903 "Processes Helper"
{
    procedure CreateNewVisit(Patient:Code[20])
    var
        PatientTable: Record "Patients Table";
        SendNotification: Codeunit "Send Notifications";
    begin
        if HasIncompleteVisit(Patient) then begin
            Message('Could not create visit!\The patient has an incomplete visit.');
        end else begin
            VisitTable.Init();
            VisitTable."Patient Number" := Patient;
            VisitTable.Time := Time;
            VisitTable.Status := "Visit Status"::Waiting;
            VisitTable.Insert(true);
            PatientTable.Get(Patient);
            // SendNotification.WelcomePatientForVisit(PatientTable."Full Name", PatientTable.Email, Time, VisitTable."Visit Number");
        end;
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
            VisitTable.Status := "Visit Status"::"Under Stabilisation";
            VisitTable.Modify();
            Message('Assessment recorded successfully!\Patient taken for emergency care and stabilisation');
        end;
    end;

    procedure CompleteAssessment_Awaiting(VisitNo: Code[20])
    begin
        if VisitTable.Get(VisitNo) then begin
            VisitTable.Status := "Visit Status"::Waiting;
            VisitTable.Modify();
            Message('Assessment recorded successfully!\Patient is in waiting.');
        end;
    end;

    procedure BillEmail(VisitNumber: Code[20])
    var
        SendNotififications: Codeunit "Send Notifications";
        VisitTable: Record "Visit Table"; // to get the patient id
        Patient: Record "Patients Table";   // to get the email address
    begin
        VisitTable.Get(VisitNumber);
        Patient.Get(VisitTable."Patient Number");
        SendNotififications.SendBillingEmail(Patient."Full Name", Patient.Email, VisitNumber);
        Message('Email sent successfully!');
    end;

    local procedure HasIncompleteVisit(PatientNumber: Code[20]): Boolean
    var
        myInt: Integer;
    begin
        VisitTable.SetRange("Patient Number", PatientNumber);
        VisitTable.SetFilter(Status, '<>%1&<>%2', VisitTable.Status::Canceled, VisitTable.Status::Completed);
        exit(not VisitTable.IsEmpty());
    end;

    var
        VisitTable: Record "Visit Table";
}