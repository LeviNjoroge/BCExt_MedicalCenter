enum 99909 "Payment Status"
{
    Extensible = true;
    
    value(0; "Not Billed")
    {
        Caption = 'Not Billed';
    }
    value(1; Billed)
    {
        Caption = 'Billed';
    }
    value(2; "Partially Paid")
    {
        Caption = 'Partially Paid';
    }
    value(3; Paid)
    {
        Caption = 'Paid';
    }
    value(4; Waivered)
    {
        Caption = 'Waivered';
    }
}
