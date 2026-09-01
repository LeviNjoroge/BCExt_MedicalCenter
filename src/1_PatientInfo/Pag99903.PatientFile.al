page 99903 "Patient File"
{
    ApplicationArea = All;
    Caption = 'Patient File';
    PageType = Card;
    SourceTable = "Patients Table";
    UsageCategory = Administration;
    CardPageId = "Patients Registration Card";
    InsertAllowed = false;
    QueryCategory = 'PatientFile';

    layout
    {
        area(Content)
        {
            group("Personal Info")
            {

                field("Application Number"; Rec."Patient Number")
                {
                    ToolTip = 'Specifies the value of the Application Number field.', Comment = '%';
                    Editable = false;
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
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                    Editable = false;
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
            }
            group("Additional Info")
            {
                group("Contact Information")
                {
                    field("Phone number"; Rec."Phone number")
                    {
                        ToolTip = 'Specifies the value of the Phone number field.', Comment = '%';
                    }
                    field(Email; Rec.Email)
                    {
                        ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                    }
                }
                group("Physical Address")
                {
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
                }
                group("Next of Kin")
                {
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
                }
                group("Insurance Info")
                {
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
            group("Allergies")
            {
                part(AllergiesPart; PatientsAllegiesListPart)
                {
                    SubPageLink = Patient = field("Patient Number");
                }
            }
            group("Assessments")
            {
                part("Assessment"; "Assessment ListPart")
                {
                    SubPageLink = Patient = field("Patient Number");
                }
            }
            group("Consultations")
            {
                // part("Consultation"; "Consultation ListPart") { 
                //     // SubPageLink = Patient = field("Patient Number");
                // }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(Visit; "Create Visit"){}
            actionref(Visits; "View Visits"){}
        }
        area(Navigation)
        {
            action("View Visits")   
            {
                Image = View;
                trigger OnAction()
                begin
                    Run(Page::"Visit List");
                end;
            }
        }
        area(Processing)
        {
            action("Create Visit")
            {
                Caption = 'Create New Visit';
                Image = New;
                trigger OnAction()
                var
                    ProcessesHelper: Codeunit "Processes Helper";
                    VisitTable: Record "Visit Table";
                begin
                    ProcessesHelper.CreateNewVisit(Rec."Patient Number");
                    VisitTable.SetRange("Patient Number", Rec."Patient Number");
                    VisitTable.FindLast();
                    Run(Page::"Visit Card", VisitTable);
                    // Run(Page::"Visit Card");
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.Age := Today.Year - Rec."Date of birth".Year;
    end;
}
