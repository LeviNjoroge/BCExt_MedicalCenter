table 99919 "Diagnosis Table"
{
    Caption = 'Diagnosis Table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Diagnosis; Text[50])
        {
            Caption = 'Diagnosis';
            TableRelation = "Diagnosis Table";
        }
        field(3; Description; Text[100])
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
        fieldgroup(DropDown; Code, Diagnosis, Description) { }
    }
}
