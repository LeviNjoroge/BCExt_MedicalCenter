page 99939 "Emergency Case Card"
{
    ApplicationArea = All;
    Caption = 'Emergency Case Card';
    PageType = Card;
    SourceTable = "Emergency Cases Table";
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
                field("Visit Number"; Rec."Visit Number")
                {
                    ToolTip = 'Specifies the value of the Visit Number field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Arrival Time field.', Comment = '%';
                }
                field("Chief Complaint"; Rec."Chief Complaint")
                {
                    ToolTip = 'Specifies the value of the Chief Complaint field.', Comment = '%';
                }
                field("Assigned Doctor"; Rec."Assigned Doctor")
                {
                    ToolTip = 'Specifies the value of the Assigned Doctor field.', Comment = '%';
                }
                field("Assigned Nurse"; Rec."Assigned Nurse")
                {
                    ToolTip = 'Specifies the value of the Assigned Nurse field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Outcome; Rec.Outcome)
                {
                    ToolTip = 'Specifies the value of the Outcome field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
            }
            group("Emergency Care Lines")
            {
                part(EMListPart; "Stabilisation Lines ListPart")
                {
                    SubPageLink = "Emergency Number" = field("Emergency Number");
                }
            }
        }
    }
}
