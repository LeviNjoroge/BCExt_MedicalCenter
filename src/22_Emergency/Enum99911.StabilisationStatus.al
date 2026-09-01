enum 99911 "Stabilisation Status"
{
    Extensible = true;
    
    value(0; Waiting)
    {
        Caption = 'Waiting';
    }
    value(1; "Under Stabilisation")
    {
        Caption = 'Under Stabilisation';
    }
    value(2; Stable)
    {
        Caption = 'Stable';
    }
    value(3; Canceled)
    {
        Caption = 'Canceled';
    }
}
