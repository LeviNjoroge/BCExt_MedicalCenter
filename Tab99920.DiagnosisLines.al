table 99920 "Diagnosis Lines"
{
    Caption = 'Diagnosis Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Consultation No"; Code[20])
        {
            Caption = 'Consultation No';
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(3; "Diagnosis Code"; Code[20])
        {
            Caption = 'Diagnosis Code';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; Notes; Text[100])
        {
            Caption = 'Notes';
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
