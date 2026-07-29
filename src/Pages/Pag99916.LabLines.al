page 99916 "Lab Lines"
{
    ApplicationArea = All;
    Caption = 'Lab Lines';
    PageType = ListPart;
    SourceTable = "Laboratory test line table";
    CardPageId = "Lab Test Single Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Visit no"; Rec."Visit no")
                {
                    Visible = false;
                }
                field("Lab line ID"; Rec."Lab line ID")
                {
                    Visible = false;
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
