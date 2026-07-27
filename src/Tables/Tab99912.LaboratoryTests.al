table 99912 "Laboratory Tests"
{
    Caption = 'Laboratory Tests';
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
        field(3; "Sample Required"; Text[100])
        {
            Caption = 'Sample Required';
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
        fieldgroup(DropDown; Code, Description, "Sample Required", Cost){}
    }
}
