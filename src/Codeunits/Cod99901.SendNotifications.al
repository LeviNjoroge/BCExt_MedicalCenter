codeunit 99901 "Send Notifications"
{
    procedure RegisteredPatient(PatientNumber: Code[20]; Name:Text; EmailAddress: Text)
    begin
        EmailMessage.Create(EmailAddress, 'Welcome to Corehealth - Your Patient Registration Details', 
            StrSubstNo('Dear %1,<br>You have been successfully registered into the CoreHealth system.<br><b>Your unique Patient Registration Number is:<h3>%2</h3></b>We look forward to providing you with excellent care:)<br>Sincerely,<br>The Corehealth Team.',Name, PatientNumber),
            true);
        Email.Send(EmailMessage);
    end;
    
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
}