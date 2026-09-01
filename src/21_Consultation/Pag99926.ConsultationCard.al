page 99926 "Consultation Card"
{
    ApplicationArea = All;
    Caption = 'Consultation Card';
    PageType = Card;
    SourceTable = "Consultations Table";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Consultation Number"; Rec."Consultation Number")
                {
                    ToolTip = 'Specifies the value of the Consultation Number field.', Comment = '%';
                    Editable = false;
                }
                field("Visit Number"; Rec."Visit Number")
                {
                    ToolTip = 'Specifies the value of the Visit Number field.', Comment = '%';
                }
                field("Patient Number"; Rec."Patient Number")
                {
                    ToolTip = 'Specifies the value of the Patient Number field.', Comment = '%';
                }
            }
            group("Consultation Info")
            {
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.', Comment = '%';
                }
                field("Chief Complaint"; Rec."Chief Complaint")
                {
                    ToolTip = 'Specifies the value of the Chief Complaint field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Doctor; Rec.Doctor)
                {
                    ToolTip = 'Specifies the value of the Doctor field.', Comment = '%';
                }
            }
            group("Laboratory")
            {
                part(Labs; "Lab Lines")
                {
                    SubPageLink = "Visit no" = field("Visit Number");
                }
            }
            group("Imaging")
            {
                part(ImagingPart; "Imaging Lines")
                {
                    SubPageLink = "Visit number" = field("Visit Number");
                }
            }
            group("Procedures")
            {
                part(Prcd; "Procedure Lines")
                {
                    SubPageLink = "Visit Number" = field("Visit Number");
                }
            }
            group("Diagnosis")
            {
                part(Diag; "Diagnosis Lines")
                {
                    SubPageLink = "Consultation No" = field("Consultation Number");
                }
            }
            group("Prescription")
            {
                part(Med; "Prescription Lines")
                {
                    SubPageLink = "Consultation No" = field("Consultation Number");
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            group(Home)
            {
                actionref("Pat"; "View Patient") { }
                actionref("Lab"; "Request Lab Test") { }
                actionref("Rad"; "Requested Imaging") { }
                actionref("Proc"; "Request Procedure") { }
                actionref("Admit"; "Admit Patient") { }
                actionref("Refer"; "Refer Patient") { }
                actionref("Complete"; "Complete Consultation") { }
            }
            actionref(Update; Refresh) { }
        }

        area(Processing)
        {
            action("View Patient")
            {
                Image = Customer;
                trigger OnAction()
                var
                    PatientTable : Record "Patients Table";
                begin
                    PatientTable.SetRange("Patient Number", Rec."Patient Number");
                    RunModal(Page::"Patient File", PatientTable);
                end;
            }
            action("Request Lab Test")
            {
                Image = Capacity;
                trigger OnAction()
                var
                    VisitTable: Record "Visit Table";
                begin
                    Rec.Status := Rec.Status::"Awaiting Results";
                    VisitTable.Get(Rec."Visit Number");
                    VisitTable.Status := VisitTable.Status::"Awaiting Results";
                    VisitTable.Modify(true);
                end;
            }
            action("Requested Imaging")
            {
                Image = Capacity;
                trigger OnAction()
                var
                    VisitTable: Record "Visit Table";
                begin
                    Rec.Status := Rec.Status::"Awaiting Results";
                    VisitTable.Get(Rec."Visit Number");
                    VisitTable.Status := VisitTable.Status::"Awaiting Results";
                    VisitTable.Modify(true);
                end;
            }
            action("Request Procedure")
            {
                Image = Capacity;
                trigger OnAction()
                var
                    VisitTable: Record "Visit Table";
                begin
                    Rec.Status := Rec.Status::"In Progress";
                    VisitTable.Get(Rec."Visit Number");
                    VisitTable.Status := VisitTable.Status::"Under Treatment";
                    VisitTable.Modify(true);
                end;
            }
            action("Admit Patient")
            {
                Image = AddToHome;
                // fill in the patient admissions card page
                trigger OnAction()
                begin

                end;
            }
            action("Refer Patient")
            {
                image = SuggestVendorBills;
                // Fill the patient referral page
                trigger OnAction()
                begin

                end;
            }
            action("Complete Consultation")
            {
                image = Completed;
                // mark patient's visit as "Awaiting Payment", consultation status as completed
                trigger OnAction()
                var
                    VisitTable : Record "Visit Table";
                begin
                    Rec.Status := Rec.Status::Completed;
                    VisitTable.Get(Rec."Visit Number");
                    VisitTable.Status := VisitTable.Status::"Awaiting Payment";
                    VisitTable.Modify(true);
                end;
            }
            action(Refresh)
            {
                Image = Refresh;
                trigger OnAction()
                begin
                    Update();
                end;
            }
        }

    }
}
