page 99919 "Lab Test Single Card"
{
    ApplicationArea = All;
    Caption = 'Lab Test Single Card';
    PageType = Card;
    SourceTable = "Laboratory test line table";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Lab line ID"; Rec."Lab line ID")
                {
                    ToolTip = 'Specifies the value of the Lab line ID field.', Comment = '%';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Lab Request")
            {                
                field("Visit no"; Rec."Visit no")
                {
                    ToolTip = 'Specifies the value of the Visit no field.', Comment = '%';
                    Editable = false;
                    Visible = false;
                }
                field("Lab Test"; Rec."Lab Test")
                {
                    ToolTip = 'Specifies the value of the Lab Test field.', Comment = '%';
                    Editable = false;
                }
                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Specifies the value of the Cost field.', Comment = '%';
                    Editable = false;
                }
            }
            group("Lab results")
            {
                field("Lab staff"; Rec."Performed by")
                {
                    ToolTip = 'Specifies the value of the Performed by field.', Comment = '%';
                    ShowMandatory = true;
                }
                field(Results; Rec.Results)
                {
                    ToolTip = 'Specifies the value of the Results field.', Comment = '%';
                    ShowMandatory = Rec.Status = Rec.Status::Requested;
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                    // notes MUST be included if the lab test is canceled
                    ShowMandatory = Rec.Status = Rec.Status::Canceled;
                }
            }
        }
    }
    actions
    {
        area(Promoted)
        {
            actionref(Submit; "Submit Results"){}
            actionref(Cancel; "Cancel Test"){}
        }
        area(Processing)
        {
            action("Submit results")
            {
                Image = Completed;
                trigger OnAction()
                var
                    BillingHelper: Codeunit "Billing Helper";
                begin
                    // bill the complete lab test, mark status as complete
                    Rec.Status := Rec.Status::Complete;
                    BillingHelper.BillLabTest(Rec."Visit no", Rec."Lab Test");
                    Message('Success!');
                end;
            }
            action("Cancel Test")
            {
                image = CancelLine;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Canceled;
                end;
            }
        }
    }
}
