table 99911 "Laboratory test line table"
{
    Caption = 'Laboratory test line table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Visit no"; Code[20])
        {
            Caption = 'Visit no';
            TableRelation = "Visit Table";
            Editable = false;
        }
        field(2; "Lab line ID"; Integer)
        {
            Caption = 'Lab line ID';
            AutoIncrement = true;
            MinValue = 1;
            Editable = false;

        }
        field(3; "Lab Test"; Code[20])
        {
            Caption = 'Lab Test';
            TableRelation = "Laboratory Tests";
        }
        field(4; Results; Text[100])
        {
            Caption = 'Results';
        }
        field(5; Cost; Integer)
        {
            Caption = 'Cost';
            FieldClass = FlowField;
            CalcFormula = lookup("Laboratory Tests".Cost where(Code = field("Lab Test")));
        }
        field(6; "Performed by"; Code[20])
        {
            Caption = 'Performed by';
            TableRelation = "CoreHealth Staff".StaffNo where(Role = filter('LAB'));
        }
        field(7; Notes; Text[100])
        {
            Caption = 'Notes';
        }
        field(8; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Requested", "Complete", "Canceled";
        }
    }
    keys
    {
        key(PK; "Lab line ID", "Visit no")
        {
            Clustered = true;

        }
    }
}
