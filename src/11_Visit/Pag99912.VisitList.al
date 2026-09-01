page 99912 "Visit List"
{
    ApplicationArea = All;
    Caption = 'Visits List';
    PageType = List;
    SourceTable = "Visit Table";
    UsageCategory = Lists;
    CardPageId = "Visit Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Visit Number"; Rec."Visit Number")
                {
                }
                field("Patient Number"; Rec."Patient Number")
                {
                }
                field("Patient Name"; Rec."Patient Name")
                {
                }
                field("Date"; Rec."Date")
                {
                }
                field("Time"; Rec."Time")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Payment Status"; Rec."Payment Status")
                {
                }
                field(Discharged; Rec.Discharged)
                {
                }
                field("Discharge Date"; Rec."Discharge Date")
                {
                }
                field(Notes; Rec.Notes)
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Billed Amount"; Rec."Billed Amount")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Admitted?"; Rec."Admitted?")
                {
                }
            }
        }
    }
}
