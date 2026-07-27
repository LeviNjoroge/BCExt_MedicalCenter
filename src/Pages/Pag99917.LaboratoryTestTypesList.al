page 99917 "Laboratory Test Types List"
{
    ApplicationArea = All;
    Caption = 'Laboratory Test Types List';
    PageType = List;
    SourceTable = "Laboratory Tests";
    UsageCategory = Lists;
    
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
