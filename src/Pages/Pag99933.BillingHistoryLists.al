page 99933 "Billing History Lists"
{
    ApplicationArea = All;
    Caption = 'Billing History Lists';
    PageType = List;
    SourceTable = "Billing Lines";
    UsageCategory = History;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Visit; Rec.Visit)
                {
                    ToolTip = 'Specifies the value of the Visit field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
            }
        }
    }
}
