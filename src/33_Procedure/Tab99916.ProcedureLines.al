table 99916 "Procedure Lines"
{
    Caption = 'Procedure Lines';
    DataClassification = ToBeClassified;
    LookupPageId = "Procedures List";
    
    fields
    {
        field(1; "Line Number"; Integer)
        {
            Caption = 'Line Number';
            AutoIncrement = true;
            MinValue = 1;
            Editable = false;
        }
        field(2; "Visit Number"; Code[20])
        {
            Caption = 'Visit Number';
            TableRelation = "Visit Table";
        }
        field(3; "Procedure"; Code[20])
        {
            Caption = 'Procedure';
            TableRelation = "Procedures Table";
        }
        field(4; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Waiting", "Completed", "Canceled";
        }
        field(5; Notes; Text[100])
        {
        }
        field(6; "Performed by"; Code[20])
        {
            Caption = 'Performed by';
            TableRelation = "CoreHealth Staff".StaffNo where(Role = filter('PRC' | 'CO' | 'TRG'));
        }
    }
    keys
    {
        key(PK; "Line Number")
        {
            Clustered = true;
        }
    }

    // fieldgroups{
    //     fieldgroup(DropDown; )
    // }
}
