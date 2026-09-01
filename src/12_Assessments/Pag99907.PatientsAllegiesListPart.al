page 99907 PatientsAllegiesListPart
{
    ApplicationArea = All;
    Caption = 'Patients Allegies';
    PageType = ListPart;
    SourceTable = "Patient Allergies";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Patient; Rec.Patient)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Patient field.', Comment = '%';
                }
                field(Allergy; Rec.Allergy)
                {
                    ToolTip = 'Specifies the value of the Allergy field.', Comment = '%';
                }
                field(Severity; Rec.Severity)
                {
                    ToolTip = 'Specifies the value of the Severity field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field("Reported On"; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field("Modified On"; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
            }
        }
    }
}
