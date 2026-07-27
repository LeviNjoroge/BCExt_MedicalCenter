table 99902 "Patients Table"
{
    Caption = 'Patients Table';
    DataClassification = EndUserIdentifiableInformation;

    fields
    {
        field(1; "Patient Number"; Code[20])
        {
            Caption = 'Patient Number';
        }
        field(2; DocumentType; Enum "Document Type")
        {
            Caption = 'DocumentType';
        }
        field(3; "Document Number"; Text[20])
        {
            Caption = 'Document Number';
        }
        field(4; "Full Name"; Text[60])
        {
            Caption = 'Full Name';
        }
        field(5; "Date of birth"; Date)
        {
            Caption = 'Date of birth';
        }
        field(30; Age; Integer)
        {
            DataClassification = ToBeClassified;
            // trigger OnLookup()
            // begin
            //     Rec.Age := Today.Year - Rec."Date of birth".Year;
            // end;
        }
        field(6; Gender; Enum "Employee Gender")
        {
            Caption = 'Gender';
        }
        field(7; "Marital Status"; Enum "Marital Status")
        {
            Caption = 'Marital Status';
        }
        field(8; "Phone number"; Text[13])
        {
            Caption = 'Phone number';
            ExtendedDatatype = PhoneNo;
        }
        field(9; Email; Text[50])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(10; County; Text[30])
        {
            Caption = 'County';
        }
        field(11; "Sub-County"; Text[30])
        {
            Caption = 'Sub-County';
        }
        field(12; Location; Text[30])
        {
            Caption = 'Location';
        }
        field(13; Village; Text[30])
        {
            Caption = 'Village';
        }
        field(14; "Next of kin Full name"; Text[60])
        {
            Caption = 'Next of kin Full name';
        }
        field(15; Relationship; Enum "Relationship with Patient")
        {
            Caption = 'Relationship';
        }
        field(16; "Next of kin phone number"; Text[13])
        {
            Caption = 'Next of kin phone number';
            ExtendedDatatype = PhoneNo;
        }
        field(17; "Next of kin Email"; Text[50])
        {
            Caption = 'Next of kin phone number';
            ExtendedDatatype = EMail;
        }
        field(18; "Blood Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,"A+","A-","B+","B-","AB+","AB-","O+","O-";
        }
        field(19; "Insurance Provider"; Enum "Insurance Provider")
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Insurance Number"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Patient Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Patient Number", "Full Name","Document Number"){}
    }
}