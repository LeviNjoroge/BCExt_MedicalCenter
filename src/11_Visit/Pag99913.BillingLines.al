page 99913 BillingLines
{
    ApplicationArea = All;
    Caption = 'BillingLines';
    PageType = ListPart;
    SourceTable = "Billing Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Visit; Rec.Visit)
                {
                    Visible = false;
                    Editable = false;
                }
                field("Type"; Rec."Type")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Notes; Rec.Notes)
                {
                }
            }
        }
    }
}
