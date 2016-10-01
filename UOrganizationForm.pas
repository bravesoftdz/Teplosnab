unit UOrganizationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, DBCtrls, RzDBCmbo, StdCtrls,
  RzCmboBx, Mask, RzEdit, RzLabel, DB, ActnList, RzForms, 
  RzCommon, RzDBLook, RzBtnEdt;

type
  TFrmUOrganization = class(TForm)
    pnlMain: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnCancel: TRzBitBtn;
    RzLabel1: TRzLabel;
    edtName: TRzEdit;
    RzLabel2: TRzLabel;
    edtAdres: TRzEdit;
    RzLabel3: TRzLabel;
    cboTipOrg: TRzComboBox;
    RzLabel9: TRzLabel;
    cboTipFinans: TRzComboBox;
    RzLabel4: TRzLabel;
    edtNameBank: TRzEdit;
    RzLabel6: TRzLabel;
    edtSchet: TRzEdit;
    RzLabel7: TRzLabel;
    edtUnn: TRzEdit;
    RzLabel8: TRzLabel;
    neNumberOfDog: TRzNumericEdit;
    RzLabel5: TRzLabel;
    deDateOfDog: TRzDateTimeEdit;
    neKodBank: TRzButtonEdit;
    dlgBank: TRzDBLookupDialog;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure neKodBankChange(Sender: TObject);
    procedure edtSchetExit(Sender: TObject);
    procedure edtUnnExit(Sender: TObject);
    procedure neKodBankButtonClick(Sender: TObject);
  private
    function VerifyData:Boolean;
    procedure ClearControl;    
  public
    { Public declarations }
  end;

var
  FrmUOrganization: TFrmUOrganization;

implementation

uses DataModule, MainForm, ADODB;

{$R *.dfm}

procedure TFrmUOrganization.FormShow(Sender: TObject);
begin
  // ��������� ������� "�����"
  with dm do begin
    with qryBank do begin
      if Not Active then
      try
        Open;
      except
        ShowMessage('�� ������� ������� ������� "�����". ��������� �������...');
        exit;
      end;
    end;
  end;
  if dm.qryOrg.State = dsInsert then
  begin
    Caption:='����� �����������';
    ClearControl;
    neKodBank.Text:='541';
  end;
  if dm.qryOrg.State = dsEdit then
  begin
    with dm do
    begin
      FrmMain.CurRec:=qryOrgkodorg.Value;
      Caption:='�����������: '+dm.qryOrgnazv.Value;
      edtName.Text:=qryOrgnazv.Value;
      edtAdres.Text:=qryOrgadres.Value;
      cboTipOrg.ItemIndex:=qryOrgtiporg.AsInteger;
      cboTipFinans.ItemIndex:=qryOrgtipbud.AsInteger;
      neKodBank.Text:=qryOrgkodbank.AsString;
      edtSchet.Text:=qryOrgrschet.Value;
      edtUnn.Text:=qryOrgunn.Value;
      neNumberOfDog.Value:=qryOrgndog.Value;
      deDateOfDog.Date:=qryOrgdatadog.Value;
    end;
  end;
end;

procedure TFrmUOrganization.BtnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TFrmUOrganization.BtnOkClick(Sender: TObject);
begin
  // ��������� ��������� �����
  if Not VerifyData then
  begin
    ShowMessage('�� ��������� ��� ����...');
    exit;
  end;
  try
    with dm do
    begin
      qryOrgnazv.Value:=edtName.Text;
      qryOrgadres.Value:=edtAdres.Text;
      qryOrgbank.Value:=edtNameBank.Text;
      qryOrgrschet.Value:=edtSchet.Text;
      qryOrgunn.Value:=edtUnn.Text;
      qryOrgtiporg.Value:=cboTipOrg.ItemIndex;
      qryOrgdatadog.Value:=deDateOfDog.Date;
      qryOrgndog.Value:=neNumberOfDog.Value;
      qryOrgtipbud.Value:=cboTipFinans.ItemIndex;
      qryOrgkodbank.Value:=StrToInt(neKodBank.Text);
      if Application.MessageBox('��������� ��������� ?',
      '��������������',mb_YesNo or mb_TaskModal or mb_IconQuestion)=idYes then
      begin
        qryOrg.Post;
        qryOrg.Refresh;
        if qryOrg.State = dsEdit then dm.qryOrg.Locate('kodorg',FrmMain.CurRec,[]);
      end;
    end;
  except
    ShowMessage('���������� ��������� ���������. ���������...');
  end;
  Close;
end;

function TFrmUOrganization.VerifyData:Boolean;
Var
  I:integer;
begin
  result:=False;
  for I := 0 To PnlMain.ControlCount-1 do
  begin
    if PnlMain.Controls[i] Is TRzEdit then
      if TRzEdit(PnlMain.Controls[i]).Text='' then
      begin
        result:=False;
        TRzEdit(PnlMain.Controls[i]).SetFocus;
        exit;
      end else result:=True;
    if PnlMain.Controls[i] Is TRzNumericEdit then
      if TRzNumericEdit(PnlMain.Controls[i]).Value=0 then
      begin
        result:=False;
        TRzNumericEdit(PnlMain.Controls[i]).SetFocus;
        exit;
      end else result:=True;
    if PnlMain.Controls[i] Is TRzComboBox then
      if TRzComboBox(PnlMain.Controls[i]).ItemIndex=-1 then
      begin
        result:=False;
        TRzComboBox(PnlMain.Controls[i]).SetFocus;
        exit;
      end else result:=True;
    if PnlMain.Controls[i] Is TRzDateTimeEdit then
      if TRzDateTimeEdit(PnlMain.Controls[i]).Text='' then
      begin
        result:=False;
        TRzDateTimeEdit(PnlMain.Controls[i]).SetFocus;
        exit;
      end else result:=True;
  end;
end;

procedure TFrmUOrganization.ClearControl;
Var
  I:integer;
begin
  for I := 0 To PnlMain.ControlCount-1 do
  begin
    if PnlMain.Controls[i] Is TRzEdit then
    TRzEdit(PnlMain.Controls[i]).Text:='';
    if PnlMain.Controls[i] Is TRzNumericEdit then
    TRzNumericEdit(PnlMain.Controls[i]).Value:=0;
    if PnlMain.Controls[i] Is TRzComboBox then
    TRzComboBox(PnlMain.Controls[i]).ItemIndex:=0;
    if PnlMain.Controls[i] Is TRzDateTimeEdit then
    TRzDateTimeEdit(PnlMain.Controls[i]).Text:='';
  end;
end;

procedure TFrmUOrganization.neKodBankChange(Sender: TObject);
begin
  if dm.qryBank.Locate('kod_bank',neKodBank.Text,[]) then
      edtNameBank.Text:=dm.qryBank['nazv_bank'];
end;

procedure TFrmUOrganization.edtSchetExit(Sender: TObject);
begin
  //*** ��������� ��������� ����
  if Length(Trim(edtSchet.Text))<>13 then
  begin
    ShowMessage('��������� ��������� ����. ���������� 13 ������...');
    edtSchet.SetFocus;
  end;
end;

procedure TFrmUOrganization.edtUnnExit(Sender: TObject);
begin
  //*** ��������� ���
  if Length(Trim(edtUnn.Text))<>9 then
  begin
    ShowMessage('��������� ���. ���������� 9 ������...');
    edtUnn.SetFocus;
  end;  
end;

procedure TFrmUOrganization.neKodBankButtonClick(Sender: TObject);
begin
  dlgBank.Execute;
end;

end.
