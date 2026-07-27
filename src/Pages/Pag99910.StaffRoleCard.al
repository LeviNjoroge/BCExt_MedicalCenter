page 99910 "Staff Role Card"
{
    ApplicationArea = All;
    Caption = 'Staff Role Card';
    PageType = Card;
    SourceTable = "Staff Role";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Code"; Rec."Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }
}
