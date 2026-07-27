page 99918 "Laboratory Test Types Card"
{
    ApplicationArea = All;
    Caption = 'Laboratory Test Types Card';
    PageType = Card;
    SourceTable = "Laboratory Tests";
    
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
                field("Sample Required"; Rec."Sample Required")
                {
                }
                field(Cost; Rec.Cost)
                {
                }
            }
        }
    }
}
