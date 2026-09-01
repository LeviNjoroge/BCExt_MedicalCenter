table 99900 Setup
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;PrimaryKey; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; PatientID; Code[20])
        {
            Caption = 'Patient ID No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3; StaffID; Code[20])
        {
            Caption = 'Staff ID No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4; "Visit ID"; Code[20])
        {
            Caption = 'Visit ID No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5; "Assessments No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6; "Consultations No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7; "Emergency Care No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

        field(10; ConsultationFee; Integer)
        {
            Caption = 'Consultation Fee';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}