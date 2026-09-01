table 99903 Allergies
{
    Caption = 'Allergies';
    DataClassification = ToBeClassified;
    LookupPageId = "Allergies List";
    
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
        field(3; "Allergy category"; Enum "Allergy Categories")
        {
            Caption = 'Allergy category';
        }
        field(4; Notes; Text[256])
        {
            Caption = 'Notes';
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
        fieldgroup(DropDown; Code, Description, "Allergy category"){}
    }
}
