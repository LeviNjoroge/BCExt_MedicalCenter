table 99904 "Patient Allergies"
{
    Caption = 'Patient Allergies';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Patient; Code[20])
        {
            Caption = 'Patient';
            TableRelation = "Patients Table";
        }
        field(2; Allergy; Code[10])
        {
            Caption = 'Allergy';
            TableRelation = Allergies;
        }
        field(3; Severity; Enum "Allergy Severity")
        {
            Caption = 'Severity';
        }
        field(4; Status; Enum "Allergy Status")
        {
            Caption = 'Status';
        }
        field(5; Notes; Text[256])
        {
            Caption = 'Notes';
        }
    }
    keys
    {
        key(PK; Patient,Allergy)
        {
            Clustered = true;
        }
    }
}
