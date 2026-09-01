table 99914 "Imaging Lines"
{
    Caption = 'Imaging Lines';
    DataClassification = OrganizationIdentifiableInformation;
    DataPerCompany = false;
    
    fields
    {
        field(1; "Line Number"; Integer)
        {
            Caption = 'Line Number';
            AutoIncrement = true;
            MinValue = 1;
            Editable = false;
        }
        field(2; "Visit number"; Code[20])
        {
            Caption = 'Visit number';
            TableRelation = "Visit Table";
            Editable = false;
        }
        field(3; "Requested Image"; Code[20])
        {
            Caption = 'Requested Image';
            TableRelation = "Radiology Imaging Catalogue";
        }
        field(4; ResultLink; Text[256])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
            ToolTip = 'If the file is not a pdf, upload it to some cloud storage(eg G.Drive) then drop the link here :)';
        }
        field(5; ResultFile; Media)
        {
            DataClassification = ToBeClassified;
            ToolTip = 'Should be a PDF File';
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Waiting", "Complete", "Canceled";
        }
        // field(7; "Requested by"; Code[20])
        // {
        //     Caption = 'Requested by';
        //     // TableRelation = "CoreHealth Staff".StaffNo where(Role = filter(''));
        // }
        field(8; "Performed by"; Code[20])
        {
            Caption = 'Performed by';
            TableRelation = "CoreHealth Staff".StaffNo where(Role = filter('RAD' | 'PRC'));
        }
    }
    keys
    {
        key(PK; "Line Number", "Visit number")
        {
            Clustered = true;
        }
    }
}
