table 99908 "Staff Role"
{
    Caption = 'Staff Role';
    DataClassification = OrganizationIdentifiableInformation;
    LookupPageId = "Staff Role List";
    
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
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
        fieldgroup(DropDown; Code,Description){}
    }
}
