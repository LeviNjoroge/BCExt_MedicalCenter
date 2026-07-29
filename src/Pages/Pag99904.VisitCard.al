page 99904 "Visit Card"
{
    ApplicationArea = All;
    Caption = 'Visit Card';
    PageType = Card;
    SourceTable = "Visit Table";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
                    Editable = false;
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
                field("Was Admitted?"; Rec."Admitted?")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if Rec."Admitted?"=false then begin
                            Rec.Validate(Rec.Discharged, false);
                        end;
                    end;
                }
                group("")
                {
                    Visible = Rec."Admitted?" = true;
                    field(Discharged; Rec.Discharged)
                    {
                        trigger OnValidate()
                        begin
                            if Rec.Discharged = true then begin
                                rec."Discharge Date" := Today;
                            end else begin
                                Clear(rec."Discharge Date");
                            end;
                        end;
                    }
                    field("Discharge Date"; Rec."Discharge Date")
                    {
                        Editable = false;
                    }
                }
                field(Notes; Rec.Notes)
                {
                }
                field("Billed Amount"; Rec."Billed Amount")
                {
                    ApplicationArea = All;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec."Amount Paid" > Rec."Billed Amount" then begin
                            Rec."Payment Status" := Rec."Payment Status"::"Partially Paid";
                        end else begin

                        end;
                    end;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                }
            }
            group(Billing)
            {
                part(BillingLines; BillingLines) {
                    SubPageLink = Visit = field("Visit Number");
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(Confirm; "Confirm Visit"){}
        }
        area(Processing)
        {
            action("Confirm visit")
            {
                Image = Completed;
                Caption = 'Send for assessment';
                trigger OnAction()
                var
                    BillingHelper: Codeunit "Billing Helper";
                begin
                    BillingHelper.BillConsultation(Rec."Visit Number");
                    
                    Run(Page::"Assessment Card");
                end;
            }
            action("Generate Bill")
            {
                trigger OnAction()
                begin
                    Rec."Payment Status" := Rec."Payment Status"::Billed;
                    Rec.Status := Rec.Status::"Awaiting Payment";
                end;
            }
            action("Clear Patient")
            {
                trigger OnAction()
                begin
                    if Rec.Balance > 0 then begin
                        Message('Patient should have NILL balance to be cleared!');
                    end else begin

                    end;
                end;
            }
        }
    }
}
