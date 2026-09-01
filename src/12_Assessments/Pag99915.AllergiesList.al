page 99915 "Allergies List"
{
    ApplicationArea = All;
    Caption = 'Allergies List';
    PageType = List;
    SourceTable = Allergies;
    UsageCategory = Lists;
    CardPageId = "Allergy Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
