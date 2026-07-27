page 99908 "CoreHealth Staff Card"
{
    ApplicationArea = All;
    Caption = 'CoreHealth Staff Card';
    PageType = Card;
    SourceTable = "CoreHealth Staff";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field(StaffNo; Rec.StaffNo)
                {
                    ToolTip = 'Specifies the value of the StaffNo field.', Comment = '%';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the value of the Middle Name field.', Comment = '%';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.', Comment = '%';
                }
                field("Phone number"; Rec."Phone number")
                {
                    ToolTip = 'Specifies the value of the Phone number field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field(Role; Rec.Role)
                {
                    ToolTip = 'Specifies the value of the Role field.', Comment = '%';
                }
                field("Date Employed"; Rec."Date Employed")
                {
                    ToolTip = 'Specifies the value of the Date Employed field.', Comment = '%';
                }
                field(Specialisation; Rec.Specialisation)
                {
                    ToolTip = 'Specifies the value of the Specialisation field.', Comment = '%';
                }
            }
        }
    }
}
