page 99927 "Prescription Lines"
{
    ApplicationArea = All;
    Caption = 'Prescription Lines';
    PageType = ListPart;
    SourceTable = "Prescriptions Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Consultation No"; Rec."Consultation No")
                {
                    ToolTip = 'Specifies the value of the Consultation No field.', Comment = '%';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field(Presciption; Rec.Presciption)
                {
                    ToolTip = 'Specifies the value of the Presciption field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
}
