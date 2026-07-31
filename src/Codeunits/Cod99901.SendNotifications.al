codeunit 99901 "Send Notifications"
{
    procedure RegisteredPatient(PatientNumber: Code[20]; Name: Text; EmailAddress: Text)
    begin
        EmailMessage.Create(EmailAddress, 'Welcome to Corehealth - Your Patient Registration Details',
            StrSubstNo('Dear %1,<br>You have been successfully registered into the CoreHealth system.<br><b>Your unique Patient Registration Number is:<br><b>%2</b><br>We look forward to providing you with excellent care!<br>Sincerely,<br>The Corehealth Team.', Name, PatientNumber),
            true);
        Email.Send(EmailMessage);
    end;

    procedure WelcomePatientForVisit(PatientName: Text; EmailAddress: Text; VisitTime: Time; VisitNumber: Code[20])
    begin
        EmailMessage.Create(EmailAddress, 'Visit recorded!', StrSubstNo('Dear %1,<br>Your visit at %2 has been recorded.<br><b>Your Visit number is: %3</b><br>We look forward to providing you with excellent care!<br>Sincerely,<br>The Corehealth Team.', PatientName, VisitTime, VisitNumber), true);
        Email.Send(EmailMessage);
    end;

    procedure SendBillingEmail(Name: Text; EmailAddress: Text; VisitNumber: Code[20])
    var
        BillingLines: Record "Billing Lines";
        Body: Text;
        TotalAmount: Decimal;
    begin
        TotalAmount := 0;

        Body :=
            StrSubstNo(
                'Dear %1,<br/><br/>Thank you for visiting our medical centre. \Below is a summary of your bill.<br/><br/>',
            Name);

        // Begin table
        Body +=
            '<table style="border-collapse:collapse;width:100%;font-family:Arial,sans-serif;">' +
            '<tr style="background-color:#f2f2f2;">' +
                '<th style="border:1px solid #ccc;padding:8px;text-align:left;">Service</th>' +
                '<th style="border:1px solid #ccc;padding:8px;text-align:left;">Description</th>' +
                '<th style="border:1px solid #ccc;padding:8px;text-align:right;">Amount (KES)</th>' +
            '</tr>';

        BillingLines.SetRange(Visit, VisitNumber);

        if BillingLines.FindSet() then
            repeat
                Body += StrSubstNo(
                    '<tr>' +
                        '<td style="border:1px solid #ccc;padding:8px;">%1</td>' +
                        '<td style="border:1px solid #ccc;padding:8px;">%2</td>' +
                        '<td style="border:1px solid #ccc;padding:8px;text-align:right;">%3</td>' +
                    '</tr>',
                    BillingLines.Type,
                    BillingLines.Notes,
                    Format(BillingLines.Amount));

                TotalAmount += BillingLines.Amount;
            until BillingLines.Next() = 0;

        // Total row
        Body += StrSubstNo(
            '<tr style="font-weight:bold;background-color:#f9f9f9;">' +
                '<td colspan="2" style="border:1px solid #ccc;padding:8px;text-align:right;">Total Bill</td>' +
                '<td style="border:1px solid #ccc;padding:8px;text-align:right;">%1</td>' +
            '</tr>',
            Format(TotalAmount));
        Body += '</table>';
        Body += '<br/><br/>Kind regards,<br/><b>Corehealth Team</b>';
        EmailMessage.Create(EmailAddress, 'Billing Information', Body, true);
        Email.Send(EmailMessage);
    end;

    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
}