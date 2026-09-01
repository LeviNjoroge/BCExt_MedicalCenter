page 99935 "Stabilisation Procedures Lines"
{
    ApplicationArea = All;
    Caption = 'Stabilisation Procedures Lines';
    PageType = ListPart;
    SourceTable = "Stabilisation Procedures";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Unit Cost field.', Comment = '%';
                }
            }
        }
    }
}
