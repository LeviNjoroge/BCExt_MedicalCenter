profile CoreHealth
{
    Caption = 'CoreHealth';
    RoleCenter = "CoreHealth Role Center";
}

page 99934 "CoreHealth Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'CoreHealth';
    UsageCategory = Administration;
    
    layout
    {
        area(RoleCenter)
        {
            group("CoreHealth Overview")
            {
                Caption = 'CoreHealth Overview';
            }

            group("Billing and Clinical Setup")
            {
                Caption = 'Billing and Clinical Setup';
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(Registration)
            {
                Caption = 'Registration and Records';

                action(PatientsRegistrationCard)
                {
                    Caption = 'Patients Registration Card';
                    ApplicationArea = All;
                    RunObject = page "Patients Registration Card";
                }
                action(PatientsList)
                {
                    Caption = 'Patients List';
                    ApplicationArea = All;
                    RunObject = page "Patients List";
                }
                action(PatientFile)
                {
                    Caption = 'Patient File';
                    ApplicationArea = All;
                    RunObject = page "Patient File";
                }
                action(VisitCard)
                {
                    Caption = 'Visit Card';
                    ApplicationArea = All;
                    RunObject = page "Visit Card";
                }
                action(VisitList)
                {
                    Caption = 'Visit List';
                    ApplicationArea = All;
                    RunObject = page "Visit List";
                }
                action(AssessmentCard)
                {
                    Caption = 'Assessment Card';
                    ApplicationArea = All;
                    RunObject = page "Assessment Card";
                }
                action(CoreHealthStaffCard)
                {
                    Caption = 'CoreHealth Staff Card';
                    ApplicationArea = All;
                    RunObject = page "CoreHealth Staff Card";
                }
                action(CoreHealthStaffList)
                {
                    Caption = 'CoreHealth Staff List';
                    ApplicationArea = All;
                    RunObject = page "CoreHealth Staff List";
                }
                action(StaffRoleCard)
                {
                    Caption = 'Staff Role Card';
                    ApplicationArea = All;
                    RunObject = page "Staff Role Card";
                }
                action(StaffRoleList)
                {
                    Caption = 'Staff Role List';
                    ApplicationArea = All;
                    RunObject = page "Staff Role List";
                }
            }

            group(ClinicalOperations)
            {
                Caption = 'Clinical Operations';
                action(BillingLines)
                {
                    Caption = 'BillingLines';
                    ApplicationArea = All;
                    RunObject = page BillingLines;
                }
                action(ConsultationCard)
                {
                    Caption = 'Consultation Card';
                    ApplicationArea = All;
                    RunObject = page "Consultation Card";
                }
                action(LabLines)
                {
                    Caption = 'Lab Lines';
                    ApplicationArea = All;
                    RunObject = page "Lab Lines";
                }
                action(LabTestSingleCard)
                {
                    Caption = 'Lab Test Single Card';
                    ApplicationArea = All;
                    RunObject = page "Lab Test Single Card";
                }
                action(LaboratoryTestTypesList)
                {
                    Caption = 'Laboratory Test Types List';
                    ApplicationArea = All;
                    RunObject = page "Laboratory Test Types List";
                }
                action(LaboratoryTestTypesCard)
                {
                    Caption = 'Laboratory Test Types Card';
                    ApplicationArea = All;
                    RunObject = page "Laboratory Test Types Card";
                }
                action(ImagingLinesList)
                {
                    Caption = 'Imaging Lines';
                    ApplicationArea = All;
                    RunObject = page "Imaging Lines";
                }
                action(ImagingSingleCard)
                {
                    Caption = 'Imaging Single Card';
                    ApplicationArea = All;
                    RunObject = page "Imaging Single Card";
                }
                action(RadiologyImagingCatalogue)
                {
                    Caption = 'Radiology Imaging Catalogue';
                    ApplicationArea = All;
                    RunObject = page "Radiology Imaging Catalogue";
                }
                action(ProceduresList)
                {
                    Caption = 'Procedures List';
                    ApplicationArea = All;
                    RunObject = page "Procedures List";
                }
                action(ProcedureLines)
                {
                    Caption = 'Procedure Lines';
                    ApplicationArea = All;
                    RunObject = page "Procedure Lines";
                }
                action(ProcedureLineSingle)
                {
                    Caption = 'Procedure Line Single';
                    ApplicationArea = All;
                    RunObject = page "Procedure Line Single";
                }
                action(PresciptionCard)
                {
                    Caption = 'Presciption Card';
                    ApplicationArea = All;
                    RunObject = page "Presciption Card";
                }
                action(PrescriptionLines)
                {
                    Caption = 'Prescription Lines';
                    ApplicationArea = All;
                    RunObject = page "Prescription Lines";
                }
                action(MedicinesList)
                {
                    Caption = 'Medicines List';
                    ApplicationArea = All;
                    RunObject = page "Medicines List";
                }
                action(DiagnosisList)
                {
                    Caption = 'Diagnosis List';
                    ApplicationArea = All;
                    RunObject = page "Diagnosis List";
                }
                action(DiagnosisLines)
                {
                    Caption = 'Diagnosis Lines';
                    ApplicationArea = All;
                    RunObject = page "Diagnosis Lines";
                }
                action(PrescriptionHistoryList)
                {
                    Caption = 'Prescription History List';
                    ApplicationArea = All;
                    RunObject = page "Prescription History List";
                }
                action(BillingHistoryLists)
                {
                    Caption = 'Billing History Lists';
                    ApplicationArea = All;
                    RunObject = page "Billing History Lists";
                }
            }

            group(ClinicalSetup)
            {
                Caption = 'Clinical Setup';

                action(AllergiesList)
                {
                    Caption = 'Allergies List';
                    ApplicationArea = All;
                    RunObject = page "Allergies List";
                }
                action(AllergyCard)
                {
                    Caption = 'Allergy Card';
                    ApplicationArea = All;
                    RunObject = page "Allergy Card";
                }
                action(MedicalCenterSetup)
                {
                    Caption = 'Medical Center Setup Page';
                    ApplicationArea = All;
                    RunObject = page "Medical Center Setup Page";
                }
            }
        }
    }
}
