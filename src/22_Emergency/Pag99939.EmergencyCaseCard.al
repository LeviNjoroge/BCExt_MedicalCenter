page 99939 "Emergency Case Card"
{
    ApplicationArea = All;
    Caption = 'Emergency Case Card';
    PageType = Card;
    SourceTable = "Emergency Cases Table";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Emergency Number"; Rec."Emergency Number")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Emergency Number field.', Comment = '%';
                }
                field("Visit Number"; Rec."Visit Number")
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Visit Number field.', Comment = '%';
                }
                field("Patient Number"; Rec."Patient Number")
                {
                    ToolTip = 'Specifies the value of the Patient Number field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Arrival Time field.', Comment = '%';
                }
                field("Chief Complaint"; Rec."Chief Complaint")
                {
                    ToolTip = 'Specifies the value of the Chief Complaint field.', Comment = '%';
                }
                field("Assigned Doctor"; Rec."Assigned Doctor")
                {
                    ToolTip = 'Specifies the value of the Assigned Doctor field.', Comment = '%';
                }
                field("Assigned Nurse"; Rec."Assigned Nurse")
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Assigned Nurse field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Outcome; Rec.Outcome)
                {
                    ShowMandatory = (Rec.Status = rec.Status::Stable);
                    ToolTip = 'Specifies the value of the Outcome field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field(Bill; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
            }
            group("Emergency Care Lines")
            {
                part(EMListPart; "Stabilisation Lines")
                {
                    SubPageLink = "Emergency Number" = field("Emergency Number");
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(Catl; "Stabilisation Catalogue") { }
            actionref(Load; Refresh) { }
        }
        area(Navigation)
        {
            action("Stabilisation Catalogue")
            {
                Image = List;
                trigger OnAction()
                begin
                    RunModal(Page::"Stabilisation Procds Catalogue");
                end;
            }
        }
        area(Processing)
        {
            action(Refresh)
            {
                trigger OnAction()
                begin
                    Update();
                end;
            }
            action("Complete Stabilisation")
            {
                Image = Completed;
                trigger OnAction()
                var
                    BillingHelper: Codeunit "Billing Helper";
                begin
                    Rec.Status := Rec.Status::Stable;
                    BillingHelper.BillEmergencyCare(Rec."Visit Number", Rec."Emergency Number", Rec.Amount);
                    Message('Success!');
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
