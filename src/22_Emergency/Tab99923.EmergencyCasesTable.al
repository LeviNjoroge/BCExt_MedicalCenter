table 99923 "Emergency Cases Table"
{
    Caption = 'Emergency Cases Table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Emergency Number"; Code[20])
        {
            Caption = 'Emergency Number';
        }
        field(2; "Visit Number"; Code[20])
        {
            Caption = 'Visit Number';
            TableRelation = "Visit Table";
        }
        field(11; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Time"; Time)
        {
            Caption = 'Arrival Time';
        }
        field(4; "Chief Complaint"; Text[100])
        {
            Caption = 'Chief Complaint';
        }
        field(5; "Assigned Doctor"; Code[20])
        {
            Caption = 'Assigned Doctor';
            TableRelation = "CoreHealth Staff".Role where(Role = const('CO'));
        }
        field(6; "Assigned Nurse"; Code[20])
        {
            Caption = 'Assigned Nurse';
            TableRelation = "CoreHealth Staff".Role where(Role = const('ER'));
        }
        field(7; Status; Enum "Stabilisation Status")
        {
            Caption = 'Status';
        }
        field(8; Outcome; Enum "Stabilisation Outcome")
        {
            Caption = 'Outcome';
        }
        field(9; Notes; Text[100])
        {
            Caption = 'Notes';
        }
        field(10; Amount; Integer)
        {
            Caption = 'Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Stabilisation Lines".Amount where("Emergency Number" = field("Emergency Number")));
            // add this to billing line as emergency care and stabilisation.
        }
    }
    keys
    {
        key(PK; "Emergency Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Emergency Number","Visit Number", Status){}
    }

    trigger OnInsert()
    var
        SetUp: Record Setup;
        NoSeries: Codeunit "No. Series";
    begin
        SetUp.Get();
        Rec."Emergency Number" := NoSeries.GetNextNo(SetUp."Emergency Care No. Series");
        Rec.Date := Today;
        Rec.Time := Time;
    end;
}
