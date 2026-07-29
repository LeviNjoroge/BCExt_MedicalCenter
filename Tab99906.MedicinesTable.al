table 99906 "Medicines Table"
{
    Caption = 'Medicines Table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Prescription; Code[10])
        {
            Caption = 'Prescription';
        }
        field(4; "Duration"; Integer)
        {
            Caption = 'Duration';
        }
        field(5; Cost; Integer)
        {
            Caption = 'Cost';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Description, Prescription, Cost){}
    }
}
