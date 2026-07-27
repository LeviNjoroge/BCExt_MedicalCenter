table 99901 "Patient Registration Table"
{
    Caption = 'Patient Registration Table';
    DataClassification = EndUserIdentifiableInformation;
    
    fields
    {
        field(1; "Application Number"; Integer)
        {
            Caption = 'Application Number';
            Editable = false;
            AutoIncrement = true;
            MinValue = 1;
        }
        field(2; DocumentType; Enum "Document Type")
        {
            Caption = 'DocumentType';
            NotBlank = true;
        }
        field(3; "Document Number"; Text[20])
        {
            Caption = 'Document Number';
            NotBlank = true;
            
        }
        field(4; "Full Name"; Text[60])
        {
            Caption = 'Full Name';
            NotBlank = true;
        }
        field(5; "Date of birth"; Date)
        {
            Caption = 'Date of birth';
            NotBlank = true;
        }
        field(6; Gender; Enum "Employee Gender")
        {
            Caption = 'Gender';
            NotBlank = true;
        }
        field(7; "Marital Status"; Enum "Marital Status")
        {
            Caption = 'Marital Status';
            NotBlank = true;
        }
        field(8; "Phone number"; Text[13])
        {
            Caption = 'Phone number';
            ExtendedDatatype = PhoneNo;
            NotBlank = true;
        }
        field(9; Email; Text[50])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
            NotBlank = true;
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
            NotBlank = true;
        }
        field(15; Relationship; Enum "Relationship with Patient")
        {
            Caption = 'Relationship';
            NotBlank = true;
        }
        field(16; "Next of kin phone number"; Text[13])
        {
            Caption = 'Next of kin phone number';
            ExtendedDatatype = PhoneNo;
            NotBlank = true;
        }
        field(17; "Next of kin Email"; Text[50])
        {
            Caption = 'Next of kin phone number';
            ExtendedDatatype = EMail;
            NotBlank = true;
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
        key(PK; "Application Number")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Setup: Record Setup;
        NoSeries: Codeunit "No. Series";
    begin
        if not Setup.Get() then begin
            Setup.Init();
            Setup.Insert();
        end else begin
            Setup.Get();
            NoSeries.GetNextNo(Setup.PatientID);
        end;
    end;
}