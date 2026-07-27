page 99922 "Imaging Single Card"
{
    ApplicationArea = All;
    Caption = 'Imaging Single Card';
    PageType = Card;
    SourceTable = "Imaging Lines";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Line Number"; Rec."Line Number")
                {
                    ToolTip = 'Specifies the value of the Line Number field.', Comment = '%';
                }
                field("Visit number"; Rec."Visit number")
                {
                    ToolTip = 'Specifies the value of the Visit number field.', Comment = '%';
                }
                // field("Requested Image"; Rec."Requested Image")
                // {
                //     ToolTip = 'Specifies the value of the Requested Image field.', Comment = '%';
                // }
                field(ResultLink; Rec.ResultLink)
                {
                    ToolTip = 'Specifies the value of the ResultLink field.', Comment = '%';
                }
                field(ResultFile; Rec.ResultFile)
                {
                    ToolTip = 'Specifies the value of the ResultFile field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Requested by"; Rec."Requested by")
                {
                    ToolTip = 'Specifies the value of the Requested by field.', Comment = '%';
                }
                field("Performed by"; Rec."Performed by")
                {
                    ToolTip = 'Specifies the value of the Performed by field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Promoted)
        {

        }
        area(Processing)
        {
            action("Upload File")
            {
                Image = MoveUp;
                trigger OnAction()
                var
                    InStream: InStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('Select', '', 'Pdf Files (*.pdf)|*.pdf', FileName, InStream) then begin
                        Rec.ResultFile.ImportStream(InStream, FileName);
                        Message('%1 successfully uploaded!', FileName);
                    end else begin
                        Message('SOmething went wrong, please try again later!');
                    end;
                end;
            }
        }
    }
}
