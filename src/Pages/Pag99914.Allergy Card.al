page 99914 "Allergy Card"
{
    ApplicationArea = All;
    Caption = 'Allergy Card';
    PageType = Card;
    SourceTable = Allergies;
    
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
                field("Allergy category"; Rec."Allergy category")
                {
                }
                field(Notes; Rec.Notes)
                {
                }
            }
        }
    }
}
