unit LookHistoryNormaForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, GridsEh, DBGridEhGrouping;

type
  TFrmLookHistoryNorma = class(TForm)
    dbgNas: TDBGridEh;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLookHistoryNorma: TFrmLookHistoryNorma;

implementation

uses DataModule;

{$R *.dfm}

procedure TFrmLookHistoryNorma.FormShow(Sender: TObject);
begin
  with dm do
  begin
    if Not qryHistNorma.Active then Close;
    try
      qryHistNorma.Open;
      Caption:='������� ��������� ���� ������� '+qryKotelnnazk.Value;
    except
      ShowMessage('�� ������� ������� ������� ���� ������� '+qryKotelnnazk.Value);
    end;
  end;
end;

end.
