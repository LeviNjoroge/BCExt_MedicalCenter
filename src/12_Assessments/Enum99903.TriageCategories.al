enum 99903 "Triage Categories"
{
    Extensible = true;
    value(1; "Non-Urgent")
    {
        Caption = 'Minimal/Non-Urgent - Green';
    }
    value(2; Emergent)
    {
        Caption = 'Immediate (Resuscitation/Emergent) - Red';
    }
    // value(3; Urgent)
    // {
    //     Caption = 'Delayed (Urgent) - Yellow';
    // }

    value(4; Expectant)
    {
        // patient is in a condition that can not be solved at this time
        Caption = 'Expectant - Black';
    }
}
