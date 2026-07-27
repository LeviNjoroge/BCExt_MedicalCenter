codeunit 99900 "Patient Registration Helper"
{
    procedure PatientRegistration(ApplicationID: Integer)
    var
        PatientRegistration: Record "Patient Registration Table";
        Patient: Record "Patients Table";
    begin
        if PatientRegistration.Get(ApplicationID) then begin
            Patient.Init();
            Patient."Patient Number" := GenPatientNumber();
            Patient.DocumentType := PatientRegistration.DocumentType;
            Patient."Document Number" := PatientRegistration."Document Number";
            Patient."Full Name" := PatientRegistration."Full Name";
            Patient."Date of birth" := PatientRegistration."Date of birth";
            Patient.Gender := PatientRegistration.Gender;
            Patient."Marital Status" := PatientRegistration."Marital Status";
            Patient."Phone number" := PatientRegistration."Phone number";
            Patient.Email := PatientRegistration.Email;
            Patient.County := PatientRegistration.County;
            Patient."Sub-County" := PatientRegistration."Sub-County";
            Patient.Location := PatientRegistration.Location;
            Patient.Village := PatientRegistration.Village;
            Patient."Next of kin Full name" := PatientRegistration."Next of kin Full name";
            Patient.Relationship := PatientRegistration.Relationship;
            Patient."Next of kin Email" := PatientRegistration."Next of kin Email";
            Patient."Next of kin phone number" := PatientRegistration."Next of kin phone number";
            Patient."Blood Type":=PatientRegistration."Blood Type";
            Patient."Insurance Provider" := PatientRegistration."Insurance Provider";
            Patient."Insurance Number" := PatientRegistration."Insurance Number";
            Patient.Insert();
            SendNotifications.RegisteredPatient(Patient."Patient Number", Patient."Full Name", Patient.Email);
            Message('Registration successful!');
        end;
    end;

    local procedure GenPatientNumber(): Code[20]
    var
        Setup: Record Setup;
        NoSeries: Codeunit "No. Series";
    begin
        Setup.Get();
        exit(NoSeries.GetNextNo(Setup.PatientID));
    end;

    var
        SendNotifications: Codeunit "Send Notifications";
}