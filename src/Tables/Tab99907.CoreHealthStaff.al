table 99907 "CoreHealth Staff"
{
    Caption = 'CoreHealth Staff';
    DataClassification = EndUserIdentifiableInformation;
    LookupPageId = "CoreHealth Staff List";
    
    fields
    {
        field(1; StaffNo; Code[10])
        {
            Caption = 'StaffNo';
            Editable = false;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; Gender; Enum "Employee Gender")
        {
            Caption = 'Gender';
        }
        field(6; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(7; "Phone number"; Text[13])
        {
            Caption = 'Phone number';
            ExtendedDatatype = PhoneNo;
        }
        field(8; Email; Text[50])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(9; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(10; Role; Code[10])
        {
            Caption = 'Role';
            TableRelation = "Staff Role";
        }
        field(11; "Date Employed"; Date)
        {
            Caption = 'Date Employed';
        }
        field(12; Specialisation; Text[100])
        {
            Caption = 'Specialisation';
        }
    }
    keys
    {
        key(PK; StaffNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; StaffNo, "First Name", "Last Name", Role){}
    }

    trigger OnInsert()
    var
        SetUp: Record Setup;
        NoSeries: Codeunit "No. Series";
    begin
        SetUp.Get();
        Rec.StaffNo := NoSeries.GetNextNo(SetUp.StaffID);
    end;
}
