page 99932 "Prescription History List"
{
    ApplicationArea = All;
    Caption = 'Prescription History List';
    PageType = List;
    SourceTable = "Prescriptions Lines";
    UsageCategory = ReportsAndAnalysis;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Consultation No"; Rec."Consultation No")
                {
                }
                field("Line No"; Rec."Line No")
                {
                }
                field(Presciption; Rec.Presciption)
                {
                }
                field(Notes; Rec.Notes)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(VisitNumber; Rec.VisitNumber)
                {
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                }
            }
        }
    }
}
