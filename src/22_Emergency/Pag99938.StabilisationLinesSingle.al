page 99938 "Stabilisation Lines Single"
{
    ApplicationArea = All;
    Caption = 'Stabilisation Lines Single';
    PageType = Card;
    SourceTable = "Stabilisation Lines";
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
                    ToolTip = 'Specifies the value of the Emergency Number field.', Comment = '%';
                }
                field("Line Number"; Rec."Line Number")
                {
                    ToolTip = 'Specifies the value of the Line Number field.', Comment = '%';
                }
                field("Stabilisation code"; Rec."Stabilisation code")
                {
                    ToolTip = 'Specifies the value of the Stabilisation code field.', Comment = '%';
                }
                field("Unit cost"; Rec."Unit cost")
                {
                    ToolTip = 'Specifies the value of the Unit cost field.', Comment = '%';
                }
                field(Units; Rec.Units)
                {
                    ToolTip = 'Specifies the value of the Units field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
            }
        }
    }
}
