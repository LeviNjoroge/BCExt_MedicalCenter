table 99913 "Radiology Imaging Catalogue"
{
    Caption = 'Radiology Imaging Catalogue';
    DataClassification = OrganizationIdentifiableInformation;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Category; Option)
        {
            Caption = 'Category';
            OptionMembers = "X-Ray", "Magnetic Resonance Imaging (MRI)", "ultrasound", "Computed Tomography (CT)";
        }
        field(4; Price; Integer)
        {
            Caption = 'Price';
        }
        field(5; "Duration (mins)"; Integer)
        {
            Caption = 'Duration (mins)';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
