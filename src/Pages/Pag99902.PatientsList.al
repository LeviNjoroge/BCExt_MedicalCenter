page 99902 "Patients List"
{
    ApplicationArea = All;
    Caption = 'Patients List';
    PageType = List;
    SourceTable = "Patients Table";
    UsageCategory = Lists;
    CardPageId = "Patient File";
    InsertAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Patient Number"; Rec."Patient Number")
                {
                    ToolTip = 'Specifies the value of the Patient Number field.', Comment = '%';
                }
                field(DocumentType; Rec.DocumentType)
                {
                    ToolTip = 'Specifies the value of the DocumentType field.', Comment = '%';
                }
                field("Document Number"; Rec."Document Number")
                {
                    ToolTip = 'Specifies the value of the Document Number field.', Comment = '%';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ToolTip = 'Specifies the value of the Full Name field.', Comment = '%';
                }
                field("Date of birth"; Rec."Date of birth")
                {
                    ToolTip = 'Specifies the value of the Date of birth field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ToolTip = 'Specifies the value of the Marital Status field.', Comment = '%';
                }
                field("Blood Type"; Rec."Blood Type")
                {
                    ApplicationArea = All;
                }
                field("Phone number"; Rec."Phone number")
                {
                    ToolTip = 'Specifies the value of the Phone number field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the value of the County field.', Comment = '%';
                }
                field("Sub-County"; Rec."Sub-County")
                {
                    ToolTip = 'Specifies the value of the Sub-County field.', Comment = '%';
                }
                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field.', Comment = '%';
                }
                field(Village; Rec.Village)
                {
                    ToolTip = 'Specifies the value of the Village field.', Comment = '%';
                }
                field("Next of kin Full name"; Rec."Next of kin Full name")
                {
                    ToolTip = 'Specifies the value of the Next of kin Full name field.', Comment = '%';
                }
                field(Relationship; Rec.Relationship)
                {
                    ToolTip = 'Specifies the value of the Relationship field.', Comment = '%';
                }
                field("Next of kin phone number"; Rec."Next of kin phone number")
                {
                    ToolTip = 'Specifies the value of the Next of kin phone number field.', Comment = '%';
                }
                field("Next of kin Email"; Rec."Next of kin Email")
                {
                    ToolTip = 'Specifies the value of the Next of kin phone number field.', Comment = '%';
                }
                field("Insurance Provider"; Rec."Insurance Provider")
                {
                    ApplicationArea = All;
                }
                field("Insurance Number"; Rec."Insurance Number")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Promoted)
        {
            actionref(New; "Register New Patient"){}
        }
        area(Navigation)
        {
            action("Register New Patient")
            {
                Image = NewCustomer;
                trigger OnAction()
                begin
                    Run(Page::"Patients Registration Card");
                end;
            }
        }
    }
}
