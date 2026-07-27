table 99905 "Assessments Table"
{
    Caption = 'Assessments Table';
    DataClassification = EndUserIdentifiableInformation;
    
    fields
    {
        field(1; AssessmentNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Visit; Code[20])
        {
            Caption = 'Visit';
            TableRelation = "Visit Table";
        }
        field(9; Patient; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Visit Table"."Patient Number" where("Visit Number" = field(Visit)));
        }
        field(3; "Blood Pressure (BP)"; Code[20])
        {
            Caption = 'Blood Pressure (BP)';
            ToolTip = 'Recorded as Systolic / Diastolic (mmHg)';
        }
        field(4; Weight; Integer)
        {
            Caption = 'Weight [kg]';
            ToolTip= 'Weight in KG';
        }
        field(5; Height; Integer)
        {
            Caption = 'Height [cm]';
            trigger OnValidate()
            begin
                Message('BMI!');
                Rec.BMI := Rec.Weight / (Rec.Height * Rec.Height);
            end;
        }
        field(6; BMI; Decimal)
        {
            Caption = 'BMI';
        }
        field(7; "Pulse Rate"; Integer)
        {
            Caption = 'Pulse / Heart Rate';
            ToolTip = 'Measured in Beats Per Minute (BPM).';
        }
        field(8; Temperature; Integer)
        {
            Caption = 'Body Temperature';
            ToolTip = 'Captured in degrees Celsius (°C).';
        }
        // field(9; "Known Allergies"; Text[200])
        // {
        //     Caption = 'Known Allergies';
        //     Tooltip = 'List all the allergies in a comma separated list';
        // }
        field(10; "Triage Categorisation"; Enum "Triage Categories")
        {
            Caption = 'Triage Categorisation';
        }
        field(11; "Nurse Notes"; Text[500])
        {
            Caption = 'Nurse Notes';
        }
        field(12; "Assessed by"; Code[20])
        {
            TableRelation = "CoreHealth Staff".StaffNo where(Role = filter('TRG'));
        }
    }
    keys
    {
        key(PK; AssessmentNo)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SetUp: Record Setup;
        NoSeries: Codeunit "No. Series";
    begin
        SetUp.Get();
        Rec.AssessmentNo := NoSeries.GetNextNo(SetUp."Assessments No Series");
    end;
}
