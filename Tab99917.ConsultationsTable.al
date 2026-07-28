table 99917 "Consultations Table"
{
    Caption = 'Consultations Table';
    DataClassification = OrganizationIdentifiableInformation;
    
    fields
    {
        field(1; "Consultation Number"; Code[20])
        {
            Caption = 'Consultation Number';

        }
        field(2; "Visit Number"; Code[20])
        {
            Caption = 'Visit Number';
            TableRelation = "Visit Table";
        }
        field(3; "Patient Number"; Code[20])
        {
            Editable = false;
            Caption = 'Patient Number';
            FieldClass = FlowField;
            CalcFormula = lookup("Visit Table"."Patient Number" where("Visit Number" = field("Visit Number")));
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; "Time"; Time)
        {
            Caption = 'Time';
        }
        field(6; "Chief Complaint"; Text[100])
        {
            Caption = 'Chief Complaint';
        }
        field(7; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "In Progress", "Awaiting Results", "Completed", "Canceled";
        }
        field(8; Doctor; Code[20])
        {
            Caption = 'Doctor';
            TableRelation = "CoreHealth Staff".StaffNo where(Role = filter('CO' | 'MD'));
        }
    }
    keys
    {
        key(PK; "Consultation Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Consultation Number", "Visit Number", Doctor){}
    }

    trigger OnInsert()
    var
        SetUp: Record Setup;
        NoSeries: Codeunit "No. Series";
    begin
        SetUp.Get();
        Rec."Consultation Number" := NoSeries.GetNextNo(SetUp."Consultations No. Series");
        Rec.Date := Today;
        Rec.Time := Time;
    end;
}
