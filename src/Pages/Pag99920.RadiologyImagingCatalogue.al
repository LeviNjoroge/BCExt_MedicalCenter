page 99920 "Radiology Imaging Catalogue"
{
    ApplicationArea = All;
    Caption = 'Radiology Imaging Catalogue';
    PageType = List;
    SourceTable = "Radiology Imaging Catalogue";
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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Category; Rec.Category)
                {
                    ToolTip = 'Specifies the value of the Category field.', Comment = '%';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.', Comment = '%';
                }
                field("Duration (mins)"; Rec."Duration (mins)")
                {
                    ToolTip = 'Specifies the value of the Duration (mins) field.', Comment = '%';
                }
            }
        }
    }
}
