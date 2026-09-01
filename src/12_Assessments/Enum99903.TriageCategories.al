enum 99903 "Triage Categories"
{
    Extensible = true;
    value(0; "")
    {
    }
    value(1; Emergent)
    {
        Caption = 'Immediate (Resuscitation/Emergent) - Red';
    }
    // value(3; Urgent)
    // {
    //     Caption = 'Delayed (Urgent) - Yellow';
    // }
    value(4; "Non-Urgent")
    {
        Caption = 'Minimal/Non-Urgent - Green';
    }
    value(5; Expectant)
    {
        // patient is in a condition that can not be solved at this time
        Caption = 'Expectant - Black';
    }
}
