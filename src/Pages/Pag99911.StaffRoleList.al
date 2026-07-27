page 99911 "Staff Role List"
{
    ApplicationArea = All;
    Caption = 'Staff Role List';
    PageType = List;
    SourceTable = "Staff Role";
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
            }
        }
    }
}
