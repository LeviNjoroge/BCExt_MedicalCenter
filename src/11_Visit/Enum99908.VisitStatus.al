enum 99908 "Visit Status"
{
    Extensible = true;

    value(0; Waiting)
    {
        Caption = 'Waiting';
        // Waiting – Patient is waiting to be seen.
        // Trigger: Visit creation complete
    }
    value(1; "Awaiting Consultation")
    {
        Caption = 'Awaiting Consultation';
        // Awaiting Consultation – Nurse has completed the assessment.
        // Trigger: Assessment complete, triage is low; noy urgent
    }
    value(2; "Under Stabilisation")
    {
        // In emergency care
        // Trigger: Assessment complete, triage is high
    }
    value(3; "Under Treatment")
    {
        Caption = 'Under Treatment';
        // Under Treatment – Procedures are in progress, patient is admitted.
        // Trigger: CO (Consultation) - Send for procedure, Admit patient
        //          Emergency - 'Outcome::Admitted'
    }
    value(4; "Awaiting Results")
    {
        Caption = 'Awaiting Results';
        // Awaiting Results – Waiting for lab or radiology results before continuing.
        // Trigger: CO (Consultation) - Send for results: Imaging or lab
    }
    value(5; "Awaiting Payment")
    {
        Caption = 'Awaiting Payment';
        // Awaiting Payment – Clinical work is complete billing is pending.
        // Trigger: CO (Consultation) - "Complete treatment"
        //                            - "Refer patient"
    }
    value(6; Completed)
    {
        Caption = 'Completed';
        // Completed – Visit has been finalized and the patient has left.
        // Trigger: Accountant - Paid
    }
    value(7; Canceled)
    {
        Caption = 'Canceled';
        // Cancelled – Visit was cancelled before completion.
        // Trigger - Any point
    }
}
