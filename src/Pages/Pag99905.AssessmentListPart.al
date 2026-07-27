page 99905 "Assessment ListPart"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Assessments Table";
    Editable = false;
    CardPageId = "Assessment Card";
    
    layout
    {
        area(Content)
        {
            repeater("")
            {
                field(AssessmentNo; Rec.AssessmentNo)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Visit; Rec.Visit)
                {
                    ApplicationArea = All;
                }
                field("Blood Pressure (BP)"; Rec."Blood Pressure (BP)")
                {
                    ApplicationArea = All;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                }
                field(Height; Rec.Height)
                {
                    ApplicationArea = All;
                    // Editable = Rec.Weight <> 0;
                    // trigger OnValidate()
                    // begin
                    //     if Rec.Weight.ToText() = '' then begin
                    //         Error('Weight field cannot be left blank!');
                    //     end else begin
                    //         Rec.BMI := Rec.Weight / (Rec.Height * Rec.Height);
                    //     end;
                    // end;
                }
                field(BMI; Rec.BMI)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Pulse Rate"; Rec."Pulse Rate")
                {
                    ApplicationArea = All;
                }
                field(Temperature; Rec.Temperature)
                {
                    ApplicationArea = All;
                }
                field("Triage Categorisation"; Rec."Triage Categorisation")
                {
                    ApplicationArea = All;
                }
                field("Nurse Notes"; Rec."Nurse Notes")
                {
                    ApplicationArea = All;
                }
                field("Assessed by"; Rec."Assessed by")
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