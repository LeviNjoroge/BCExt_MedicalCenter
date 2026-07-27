table 99910 "Billing Lines"
{
    Caption = 'Billing Lines';
    DataClassification = AccountData;
    
    fields
    {
        field(1; Visit; Code[20])
        {
            Caption = 'Visit';
        }
        field(2; Type; Enum "Billing Types")
        {
            DataClassification = ToBeClassified;
        }
        field(3; Amount; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Notes; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Visit, Type)
        {
            Clustered = true;
        }
    }
}
