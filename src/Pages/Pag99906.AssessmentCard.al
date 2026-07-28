page 99906 "Assessment Card"
{
    ApplicationArea = All;
    Caption = 'Assessment Card';
    PageType = Card;
    SourceTable = "Assessments Table";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field(AssessmentNo; Rec.AssessmentNo)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Visit; Rec.Visit)
                {
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field(Patient; Rec.Patient)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                
            }
            group("Vitals")
            {
                field("Blood Pressure (BP)"; Rec."Blood Pressure (BP)")
                {
                    ShowMandatory = true;
                }
                field("Pulse Rate"; Rec."Pulse Rate")
                {
                }
                field(Temperature; Rec.Temperature)
                {
                }
                field(Weight; Rec.Weight)
                {
                }
                field(Height; Rec.Height)
                {
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // begin
                    //     Rec.BMI := Rec.Weight / (Rec.Height * Rec.Height);
                    // end;
                }
                field(BMI; Rec.BMI)
                {
                    Editable = false;
                }
            }
            // field("Allergies?";hasAllergies)
            // {
            //     ShowMandatory = true;
            // }
            // group("Allergies")
            // {
            //     Visible = hasAllergies;
            part(AllergiesPart; PatientsAllegiesListPart)
                {
                    SubPageLink = Patient = field(Patient);
                }
            // }
            group("Nurse' Remarks")
            {
                field("Triage Categorisation"; Rec."Triage Categorisation")
                {
                    ShowMandatory = true;
                }
                field("Nurse Notes"; Rec."Nurse Notes")
                {
                }
                field("Assessed By"; Rec."Assessed By")
                {
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(Submit; "Submit Assessment"){}
        }
        area(Processing)
        {
            action("Submit Assessment")
            {
                Image = Completed;
                trigger OnAction()
                var
                    ProcessesHelper: Codeunit "Processes Helper";
                begin
                    if Rec."Triage Categorisation" = Rec."Triage Categorisation"::"Non-Urgent" then begin
                        ProcessesHelper.CompleteAssessment_AwaitConsultation(Rec.Visit);
                    end else if Rec."Triage Categorisation" = Rec."Triage Categorisation"::Expectant then begin
                        ProcessesHelper.CompleteAssessment_Awaiting(Rec.Visit);
                    end else begin
                        ProcessesHelper.CompleteAssessment_UnderStabilisation(Rec.Visit);
                    end;
                end;
            }
        }
    }

    // var
    //     hasAllergies: Boolean;

}
