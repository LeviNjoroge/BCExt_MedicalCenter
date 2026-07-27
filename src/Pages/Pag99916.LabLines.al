page 99916 "Lab Lines"
{
    ApplicationArea = All;
    Caption = 'Lab Lines';
    PageType = ListPart;
    SourceTable = "Laboratory test line table";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Visit no"; Rec."Visit no")
                {
                }
                field("Lab line ID"; Rec."Lab line ID")
                {
                }
                field("Lab Test"; Rec."Lab Test")
                {
                }
                field(Results; Rec.Results)
                {
                }
                field(Cost; Rec.Cost)
                {
                }
                field("Performed by"; Rec."Performed by")
                {
                }
                field(Notes; Rec.Notes)
                {
                }
            }
        }
    }
}
