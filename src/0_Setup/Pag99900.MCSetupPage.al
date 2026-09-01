page 99900 "Medical Center Setup Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Setup;
    
    layout
    {
        area(Content)
        {
            group("No. Series")
            {
                field(PatientID; Rec.PatientID)
                {
                    ApplicationArea = All;
                }
                field("Assessments No Series"; Rec."Assessments No Series")
                {
                    ApplicationArea = All;
                }
                field(StaffID; Rec.StaffID)
                {
                    ApplicationArea = All;
                }
                field("Visit ID"; Rec."Visit ID")
                {
                    ApplicationArea = All;
                }
                field("Consultations No. Series"; Rec."Consultations No. Series")
                {
                    ApplicationArea = All;
                }
                field("Emergency Care No. Series"; Rec."Emergency Care No. Series")
                {
                    ApplicationArea = All;
                }
                
            }
            group("Fees and Costs")
            {
                field(ConsultationFee; Rec.ConsultationFee)
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}