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
            AutoIncrement = true;
            MinValue = 1;
            Editable = false;
        }
        field(3; "Diagnosis Code"; Code[20])
        {
            Caption = 'Diagnosis Code';
            TableRelation = "Diagnosis Table";
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Diagnosis Table".Description where(Code = field("Diagnosis Code")));
            Editable = false;
        }
        field(5; Notes; Text[100])
        {
            Caption = 'Notes';
        }
    }
    keys
    {
        key(PK; "Consultation No", "Line No")
        {
            Clustered = true;
        }
    }
}
