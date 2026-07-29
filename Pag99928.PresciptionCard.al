page 99928 "Presciption Card"
{
    ApplicationArea = All;
    Caption = 'Presciption Card';
    PageType = Card;
    SourceTable = "Prescriptions Lines";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
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

    actions
    {
        area(Promoted)
        {
            actionref(Done; "Mark Collected"){}
            actionref(Not; "Cancel"){}
        }
        area(Processing)
        {
            action("Mark Collected")
            {
                Image = Completed;
                // mark collected, bill the patient
                trigger OnAction()
                var
                    BillHelper : Codeunit "Billing Helper";
                begin
                    BillHelper.BillMedicine(Rec.VisitNumber, Rec.Presciption);
                    Rec.Status := Rec.Status::Collected;
                    Message('Done!');
                end;
            }
            action("Cancel")
            {
                Image = Cancel;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Canceled;
                end;
            }
        }
    }
}
