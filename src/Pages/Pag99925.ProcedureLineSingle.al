page 99925 "Procedure Line Single"
{
    ApplicationArea = All;
    Caption = 'Procedure Line Single';
    PageType = Card;
    SourceTable = "Procedure Lines";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Line Number"; Rec."Line Number")
                {
                }
                field("Visit Number"; Rec."Visit Number")
                {
                }
                field("Procedure"; Rec."Procedure")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Notes; Rec.Notes)
                {
                }
                field("Performed by"; Rec."Performed by")
                {
                }
            }
        }
    }
    // ON SUBMIT, Bill the patient
    actions
    {
        area(Promoted)
        {
            actionref(Complete; "Mark as complete"){}
            actionref(Stop; "Cancel"){}
        }
        area(Processing)
        {
            action("Mark as complete")
            {
                image = Completed;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Completed;
                    // bill the patient, update status on visit card
                end;
            }
            action("Cancel")
            {
                image = Cancel;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Canceled;
                    // update status on visit card
                end;
            }
        }
    }
}
