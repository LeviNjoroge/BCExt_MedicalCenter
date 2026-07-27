codeunit 99902 "Billing Helper"
{
    // This is to be used to calculate the total amount that a patient is to be billed,
    // and update the amount in the "Billed Amount" field in the visit table
    procedure CalculateBill(VisitNumber: Code[20])
    var
        myInt: Integer;
    begin
        
    end;

    procedure BillConsultation(VisitNumber: Code[20])
    var
        Bill: Record "Billing Lines";
        SetUp: Record Setup;
    begin
        SetUp.Get();
        if not Bill.Get(VisitNumber, Bill.Type::Consultation) then begin
            Bill.Init();
            Bill.Visit := VisitNumber;
            Bill.Type := Bill.Type::Consultation;
            Bill.Amount := SetUp.ConsultationFee;
            Bill.Insert(true);
        end else begin
            Message('Consultation fee has already been recorded for this visit!');
        end;
    end;

    procedure BillLabTest(VisitNumber: Code[20]; LabTestID: Code[20])
    var
        Bill: Record "Billing Lines";
        LabTestsTable : Record "Laboratory Tests";
    begin
        LabTestsTable.Get(LabTestID);
        if not Bill.Get(VisitNumber, Bill.Type::Laboratory) and (Bill.Notes <> LabTestID) then begin
            Bill.Init();
            Bill.Visit := VisitNumber;
            Bill.Type := Bill.Type::Laboratory;
            Bill.Amount := LabTestsTable.Cost;
            Bill.Notes := LabTestID;
            Bill.Insert(true);
        end else begin
            Message('Lab fee has already been recorded for this visit!');
        end;
    end;
}