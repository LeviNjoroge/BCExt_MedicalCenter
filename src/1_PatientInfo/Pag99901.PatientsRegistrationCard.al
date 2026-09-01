page 99901 "Patients Registration Card"
{
    ApplicationArea = All;
    Caption = 'Patients Registration Card';
    PageType = Card;
    SourceTable = "Patient Registration Table";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(Identification)
            {
                Caption = 'Identification';
                
                field("Application Number"; Rec."Application Number")
                {
                    ToolTip = 'Specifies the value of the Application Number field.', Comment = '%';
                }
                field(DocumentType; Rec.DocumentType)
                {
                    ToolTip = 'Specifies the value of the DocumentType field.', Comment = '%';
                }
                field("Document Number"; Rec."Document Number")
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Document Number field.', Comment = '%';
                }
            }
            group("Personal Info")
            {
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
                
            }
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
            group("Physical Address"){
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
            group("Next of Kin"){
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
                    Caption = 'Next of kin Email';
                }
            }
            group("Insurance Info")
            {
                field("Insurance Provider"; Rec."Insurance Provider")
                {
                    ApplicationArea = All;
                }
                group("")
                {
                    Visible = Rec."Insurance Provider" <> Rec."Insurance Provider"::"N/A";
                    field("Insurance Number"; Rec."Insurance Number")
                    {
                        ApplicationArea = All;
                    }
                }
                
                
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(submit; "Submit Appication"){}
            group(Patients)
            {
                actionref(Reg; PatientReg){}
                actionref(PatientList; PatientsList){}
            }
            group(Other)
            {
                group(Allergies)
                {
                    actionref(AlC; AllergyCard) { }
                    actionref(AlL; AllergiesList) { }
                }
                group("Staff Role")
                {
                    actionref(SRC; RoleCard) { }
                    actionref(SRL; RolesList) { }
                }
                actionref(Conf; Settings) { }
            }
        }
        area(Navigation)
        {
            action(PatientReg)
            {
                Caption = 'Patient Registration';
                Image = NewCustomer;
                trigger OnAction()
                var
                    PatientReg : Page "Patients Registration Card";
                begin
                    PatientReg.Run();
                end;
            }
            action(PatientsList)
            {
                Caption = 'Patients List';
                Image = CustomerList;
                trigger OnAction()
                begin
                    Run(Page::"Patients List");
                end;
            }
            action("Settings")
            {
                Image = Setup;
                trigger OnAction()
                begin
                    Run(Page::"Medical Center Setup Page");
                end;
            }
            action(AllergyCard)
            {
                Image = NewChartOfAccounts;
                trigger OnAction()
                begin
                    Run(Page::"Allergy Card");
                end;
            }
            action(AllergiesList)
            {
                Image = ChartOfAccounts;
                trigger OnAction()
                begin
                    Run(Page::"Allergies List");
                end;
            }
            action(RoleCard)
            {
                Image = Salutation;
                trigger OnAction()
                begin
                    Run(Page::"Staff Role Card");
                end;
            }
            action(RolesList)
            {
                Image = SalesPurchaseTeam;
                trigger OnAction()
                begin
                    Run(Page::"Staff Role List");
                end;
            }
        }
        area(Processing)
        {
            action("Submit Appication")
            {
                Image = Completed;
                trigger OnAction()
                var
                    PatientsRegHelper: Codeunit "Patient Registration Helper";
                begin
                    PatientsRegHelper.PatientRegistration(Rec."Application Number");
                    Run(Page::"Patients List");
                end;
            }
        }
    }
}
