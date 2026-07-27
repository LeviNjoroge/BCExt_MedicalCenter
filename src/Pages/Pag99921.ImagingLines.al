page 99921 "Imaging Lines"
{
    ApplicationArea = All;
    Caption = 'Imaging Lines';
    PageType = ListPart;
    SourceTable = "Imaging Lines";
    CardPageId = "Imaging Single Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Line Number"; Rec."Line Number")
                {
                }
                field("Visit number"; Rec."Visit number")
                {
                }
                field("Requested Image"; Rec."Requested Image")
                {
                }
                field(ResultLink; Rec.ResultLink)
                {
                }
                field(ResultFile; Rec.ResultFile)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Requested by"; Rec."Requested by")
                {
                }
                field("Performed by"; Rec."Performed by")
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Download Result File")
            {
                Image = Download;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    InS: Instream;
                    fileName: Text;
                begin
                    if Rec.ResultFile.HasValue then begin
                        FileName := StrSubstNo('%1-%2.pdf', Rec."Visit number", Rec."Requested Image");
                        TempBlob.CreateOutStream(OutS);
                        Rec.ResultFile.ExportStream(OutS);
                        TempBlob.CreateInStream(InS);
                        DownloadFromStream(InS, '', '', '', fileName);
                        Message('Success!');
                    end else begin
                        Message('Something went wrong!');
                    end;
                end;
            }
            action("View results")
            {
                Image = View;
                trigger OnAction()
                begin
                    Hyperlink(Rec.ResultLink);
                end;
            }
        }
    }
}
