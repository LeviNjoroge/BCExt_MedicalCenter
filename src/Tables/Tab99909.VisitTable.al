table 99909 "Visit Table"
{
    Caption = 'Visit Table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Visit Number"; Code[20])
        {
            Caption = 'Visit Number';
            Editable = false;
        }
        field(2; "Patient Number"; Code[20])
        {
            Caption = 'Patient Number';
            TableRelation = "Patients Table";
        }
        field(3; "Patient Name"; Text[60])
        {
            Caption = 'Patient Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Patients Table"."Full Name" where("Patient Number" = field("Patient Number")));
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; "Time"; Time)
        {
            Caption = 'Time';
        }
        field(6; Status; Enum "Visit Status")
        {
            Caption = 'Status';
        }
        field(7; "Payment Status"; Enum "Payment Status")
        {
            Caption = 'Payment Status';
        }
        field(8; Discharged; Boolean)
        {
            Caption = 'Discharged';
        }
        field(9; "Discharge Date"; Date)
        {
            Caption = 'Discharge Date';
        }
        field(10; Notes; Text[100])
        {
            Caption = 'Notes';
        }
        field(12; "Billed Amount"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Billing Lines".Amount where(Visit = field("Visit Number")));
        }
        field(11; "Amount Paid"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.Balance := Rec."Billed Amount" - Rec."Amount Paid";
            end;
        }
        field(13; "Balance"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Admitted?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Visit Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Visit Number", "Patient Number", "Patient Name") { }
    }

    trigger OnInsert()
    var
        SetUp: Record Setup;
        NoSeries: Codeunit "No. Series";
    begin
        SetUp.Get();
        "Visit Number" := NoSeries.GetNextNo(SetUp."Visit ID");
        Rec.Date := Today;
    end;
}
