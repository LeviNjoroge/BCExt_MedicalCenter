page 99931 "Diagnosis Lines"
{
    ApplicationArea = All;
    Caption = 'Diagnosis Lines';
    PageType = ListPart;
    SourceTable = "Diagnosis Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Consultation No"; Rec."Consultation No")
                {
                    ToolTip = 'Specifies the value of the Consultation No field.', Comment = '%';
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                    Visible = false;
                }
                field("Diagnosis Code"; Rec."Diagnosis Code")
                {
                    ToolTip = 'Specifies the value of the Diagnosis Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
            }
        }
    }
}
