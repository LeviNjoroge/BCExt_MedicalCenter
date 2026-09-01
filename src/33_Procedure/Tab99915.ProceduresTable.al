table 99915 "Procedures Table"
{
    Caption = 'Procedures Table';
    DataClassification = OrganizationIdentifiableInformation;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Procedure"; Text[50])
        {
            Caption = 'Procedure';
        }
        field(3; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(4; Cost; Integer)
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
        fieldgroup(DropDown; Code, "Procedure", Cost){}
    }
}
