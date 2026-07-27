page 99924 "Procedure Lines"
{
    ApplicationArea = All;
    Caption = 'Procedure Lines';
    PageType = ListPart;
    SourceTable = "Procedure Lines";
    CardPageId = "Procedure Line Single";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Line Number"; Rec."Line Number")
                {
                    ToolTip = 'Specifies the value of the Line Number field.', Comment = '%';
                }
                field("Visit Number"; Rec."Visit Number")
                {
                    ToolTip = 'Specifies the value of the Visit Number field.', Comment = '%';
                }
                field("Procedure"; Rec."Procedure")
                {
                    ToolTip = 'Specifies the value of the Procedure field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field("Performed by"; Rec."Performed by")
                {
                    ToolTip = 'Specifies the value of the Performed by field.', Comment = '%';
                }
            }
        }
    }
}
