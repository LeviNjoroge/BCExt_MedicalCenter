table 99922 "Stabilisation Lines"
{
    Caption = 'Stabilisation Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Emergency Number"; Code[20])
        {
            Caption = 'Emergency Number';
            TableRelation = "Emergency Cases Table";
        }
        field(2; "Line Number"; Integer)
        {
            Caption = 'Line Number';
            AutoIncrement = true;
            MinValue = 1;
        }
        field(3; "Stabilisation code"; Code[20])
        {
            Caption = 'Stabilisation code';
            TableRelation = "Stabilisation Procedures".Code;
        }
        field(4; "Unit cost"; Integer)
        {
            Caption = 'Unit cost';
            TableRelation = "Stabilisation Procedures"."Unit Cost" where(Code = field("Stabilisation code"));
        }
        field(5; Units; Integer)
        {
            Caption = 'Units';
            MinValue = 1;
            trigger OnValidate()
            var
                ProductAmount: Integer;
            begin
                ProductAmount := Rec."Unit cost" * Rec.Units;
                Validate(Amount, ProductAmount);
            end;
        }
        field(6; Amount; Integer)
        {
            Editable = false;
            Caption = 'Amount';
        }
        field(7; "Time"; Time)
        {
            Caption = 'Time';
        }
        // field(8; "Performed by"; Code[20])
        // {
        //     Caption = 'Performed by';
        //     TableRelation = "CoreHealth Staff".StaffNo;
        // }
        field(9; Notes; Text[100])
        {
            Caption = 'Notes';
        }
    }
    keys
    {
        key(PK; "Emergency Number", "Line Number")
        {
            Clustered = true;
        }
    }
}
