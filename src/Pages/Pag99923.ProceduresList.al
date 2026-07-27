page 99923 "Procedures List"
{
    ApplicationArea = All;
    Caption = 'Procedures List';
    PageType = List;
    SourceTable = "Procedures Table";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Procedure"; Rec."Procedure")
                {
                    ToolTip = 'Specifies the value of the Procedure field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Specifies the value of the Cost field.', Comment = '%';
                }
            }
        }
    }
}
