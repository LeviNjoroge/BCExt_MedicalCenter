page 99909 "CoreHealth Staff List"
{
    ApplicationArea = All;
    Caption = 'CoreHealth Staff List';
    PageType = List;
    SourceTable = "CoreHealth Staff";
    UsageCategory = Lists;
    CardPageId = "CoreHealth Staff Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(StaffNo; Rec.StaffNo)
                {
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Middle Name"; Rec."Middle Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("Phone number"; Rec."Phone number")
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(Role; Rec.Role)
                {
                }
                field("Date Employed"; Rec."Date Employed")
                {
                }
                field(Specialisation; Rec.Specialisation)
                {
                }
            }
        }
    }
}
