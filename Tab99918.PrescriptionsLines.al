table 99918 "Prescriptions Lines"
{
    Caption = 'Prescriptions Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Consultation No"; Code[20])
        {
            Caption = 'Consultation No';
            TableRelation = "Consultations Table";
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(3; Presciption; Code[20])
        {
            Caption = 'Presciption';
            TableRelation = "Medicines Table";
        }
        field(4; Notes; Text[100])
        {
            Caption = 'Notes';
        }
        field( 5; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Awaiting Collection", "Collected", "Canceled";
        }
        field(6; VisitNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Consultations Table"."Visit Number" where("Consultation Number" = field("Consultation No"));
        }
    }
    keys
    {
        key(PK; "Consultation No")
        {
            Clustered = true;
        }
    }
}
