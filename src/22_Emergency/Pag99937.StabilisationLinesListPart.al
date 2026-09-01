page 99937 "Stabilisation Lines"
{
    ApplicationArea = All;
    Caption = 'Stabilisation Lines';
    PageType = ListPart;
    SourceTable = "Stabilisation Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Emergency Number"; Rec."Emergency Number")
                {
                    Editable = false;

                    ToolTip = 'Specifies the value of the Emergency Number field.', Comment = '%';
                }
                field("Line Number"; Rec."Line Number")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line Number field.', Comment = '%';
                }
                field("Stabilisation Prodecure"; Rec."Stabilisation code")
                {
                    ToolTip = 'Specifies the value of the Stabilisation code field.', Comment = '%';
                }
                field("Unit cost"; Rec."Unit cost")
                {
                    Editable = false;
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

    actions
    {
        area(Processing)
        {

        }
    }
}
