enum 99908 "Visit Status"
{
    Extensible = true;

    value(0; Waiting)
    {
        Caption = 'Waiting';
    // Waiting – Patient is waiting to be seen.
}
    value(1; Assessed)
    {
        Caption = 'Assessed';
        // Assessed – Nurse has completed the assessment.
    }
    value(2; "In Consultation")
    {
        Caption = 'In Consultation';
        // In Consultation – Doctor is attending to the patient.
    }
    value(3; "Under Treatment")
    {
        Caption = 'Under Treatment';
        // Under Treatment – Procedures, pharmacy, lab, etc. are in progress.
    }
    value(4; "Awaiting Results")
    {
        Caption = 'Awaiting Results';
        // Awaiting Results – Waiting for lab or radiology results before continuing.
    }
    value(5; "Awaiting Payment")
    {
        Caption = 'Awaiting Payment';
        // Awaiting Payment – Clinical work is complete billing is pending.
    }
    value(6; Completed)
    {
        Caption = 'Completed';
        // Completed – Visit has been finalized and the patient has left.
    }
    value(7; Canceled)
    {
        Caption = 'Canceled';
        // Cancelled – Visit was cancelled before completion.
    }
}
