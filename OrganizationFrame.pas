unit OrganizationFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzLabel, Grids, DBGridEh, RzButton,
  ImgList,UOrganizationForm, RzCmboBx, Menus, PoiskForm, DB, frxClass,
  frxDBSet, UObektFrom, DBCtrls, RzDBNav, MemDS, DBAccess, MSAccess,
  ChangeOrgForm, LookHistoryObektForm, ChangePeriodForm, GridsEh,
  DBGridEhGrouping;

type
  TFmeOrganization = class(TFrame)
    RzLabel9: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    Splitter1: TSplitter;
    RzPanel3: TRzPanel;
    ImageList1: TImageList;
    dbgOrg: TDBGridEh;
    dbgObekt: TDBGridEh;
    tbrOrg: TRzToolbar;
    tbrObekt: TRzToolbar;
    pmPrint: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    OrgSet: TfrxDBDataset;
    ObektSet: TfrxDBDataset;
    NavigateOrg: TRzDBNavigator;
    RzSpacer1: TRzSpacer;
    BtnFilterOrg: TRzToolButton;
    RzSpacer3: TRzSpacer;
    cboTipOrg: TRzComboBox;
    RzSpacer4: TRzSpacer;
    BtnDelFilterOrg: TRzToolButton;
    BtnFind: TRzToolButton;
    BtnPrint: TRzToolButton;
    NavigateObk: TRzDBNavigator;
    RzSpacer2: TRzSpacer;
    btnChangeOrg: TRzToolButton;
    N6: TMenuItem;
    N7: TMenuItem;
    LicevSet: TfrxDBDataset;
    RzSpacer5: TRzSpacer;
    BtnHistory: TRzToolButton;
    N8: TMenuItem;
    N9: TMenuItem;
    RzSpacer6: TRzSpacer;
    RzSpacer7: TRzSpacer;
    BtnFreeFilter: TRzToolButton;
    RzSpacer8: TRzSpacer;
    BtnFreeFilterObk: TRzToolButton;
    RzSpacer9: TRzSpacer;
    BtnDeleteOrg: TRzToolButton;
    RzSpacer10: TRzSpacer;
    BtnDeleteObk: TRzToolButton;
    RzSpacer11: TRzSpacer;
    Report: TfrxReport;
    RzToolButton1: TRzToolButton;
    qryObekt: TMSQuery;
    dsObekt: TDataSource;
    qryLicev: TMSQuery;
    dsLicev: TDataSource;
    qryOrg: TMSQuery;
    dsOrg: TDataSource;
    mN10: TMenuItem;
    procedure BtnEditOrgClick(Sender: TObject);
    procedure BtnFilterOrgClick(Sender: TObject);
    procedure cboTipOrgChange(Sender: TObject);
    procedure BtnDelFilterOrgClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtnEditObkClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure btnChangeOrgClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BtnHistoryClick(Sender: TObject);
    procedure BtnFreeFilterClick(Sender: TObject);
    procedure BtnFreeFilterObkClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnDeleteOrgClick(Sender: TObject);
    procedure BtnDeleteObkClick(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure NavigateOrgClick(Sender: TObject; Button: TRzNavigatorButton);
    procedure NavigateObkClick(Sender: TObject; Button: TRzNavigatorButton);
    procedure mN10Click(Sender: TObject);
  private
    F:TFrmUOrganization;
    FO:TFrmUObekt;
    FP:TFrmPoisk;
    FC:TFrmChangeOrg;
    LH:TFrmLookHistoryObekt;
    CP:TFrmChangePeriod;
    RPath:String;
    sql_flt:string;
  public
    procedure Init;
  end;

implementation

uses DataModule, MainForm;

{$R *.dfm}

{ TFmeOrganization }

procedure TFmeOrganization.Init;
begin
  RPath:=ExtractFilePath(Application.ExeName)+'Template\';
  with dm do begin
    if qryOrg.Active then qryOrg.Close;
    try
      qryOrg.Open;
    except
      ShowMessage('�� ������� ������� ������� "�����������"');
    end;
    if qryObekt.Active then qryObekt.Close;
    try
      qryObekt.Open;
    except
      ShowMessage('�� ������� ������� ������� "�������"');
    end;
  end;
end;        

procedure TFmeOrganization.BtnEditOrgClick(Sender: TObject);
begin
  // ����������� �����������
  dm.qryOrg.Edit;
  F := TFrmUOrganization.Create( Application );
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TFmeOrganization.BtnFilterOrgClick(Sender: TObject);
begin
  cboTipOrg.Enabled:=True;
end;

procedure TFmeOrganization.cboTipOrgChange(Sender: TObject);
begin
  with dm.qryOrg do
    FilterSQL:='tiporg='+IntToStr(cboTipOrg.ItemIndex);
end;

procedure TFmeOrganization.BtnDelFilterOrgClick(Sender: TObject);
begin
  with dm.qryOrg do
    FilterSQL:='';
  cboTipOrg.ItemIndex:=-1;
  cboTipOrg.Enabled:=False;
end;

procedure TFmeOrganization.BtnFindClick(Sender: TObject);
begin
  {����� �� ����������}
  FP := TFrmPoisk.Create( Application );
  try
    FP.ShowModal;
    case FP.rgPoisk.ItemIndex of
    0:if Not dm.qryOrg.Locate('kodorg',Trim(FP.edtPoisk.Text),[]) then
      ShowMessage('����������� � ����� '+Trim(FP.edtPoisk.Text)+
      ' �� �������...');
    1:if Not dm.qryOrg.Locate('nazv',Trim(FP.edtPoisk.Text),[loCaseInsensitive, loPartialKey]) then
      ShowMessage('����������� � ��������� '+Trim(FP.edtPoisk.Text)+
      ' �� �������...');
    end;
  finally
    FP.Free;
  end;
  dbgOrg.SetFocus;
end;

procedure TFmeOrganization.N1Click(Sender: TObject);
begin
  Report.LoadFromFile(RPath+'�����������.fr3');
  Report.ShowReport;
  DM.qryOrg.Close;
end;

procedure TFmeOrganization.N2Click(Sender: TObject);
begin
  Report.LoadFromFile(RPath+'�������.fr3');
  Report.ShowReport;
  DM.qryObekt.Close;
end;

procedure TFmeOrganization.BtnEditObkClick(Sender: TObject);
begin
  // ����������� ������
  dm.qryObekt.Edit;

  FO := TFrmUObekt.Create( Application );
  try
    FO.ShowModal;
  finally
    FO.Free;
  end;
end;

procedure TFmeOrganization.N4Click(Sender: TObject);
begin
  with qryObekt do
  begin
    if Active then Close;
    Filtered:=False;
    Filter:='podkl=0';
    Filtered:=True;
  end;
  Report.LoadFromFile(RPath+'������� (���������).fr3');
  Report.ShowReport;
  qryObekt.Close;
end;

procedure TFmeOrganization.N5Click(Sender: TObject);
begin
  with qryObekt do
  begin
    if Active then Close;
    Filtered:=False;
    Filter:='podklv=0';
    Filtered:=True;
  end;
  Report.LoadFromFile(RPath+'������� (�_����).fr3');
  Report.ShowReport;
  qryObekt.Close;
end;

procedure TFmeOrganization.N7Click(Sender: TObject);
begin
  // ������ �������� �����
  with qryObekt do
  begin
    if Active then Close;
    FilterSQL:='a.kodorg='+IntToStr(dm.qryOrgkodorg.Value);
    Open;
  end;
  CP:=TFrmChangePeriod.Create(Application);
  try
    CP.ShowModal;
    with qryLicev do
    begin
      Params.ParamValues['data1']:=FrmMain.Data1;
      Params.ParamValues['data2']:=FrmMain.Data2;
    end;
    Report.LoadFromFile(RPath+'�������.fr3');
    Report.Variables['data1']:=StrToDate(DateToStr(FrmMain.Data1));
    Report.Variables['data2']:=StrToDate(DateToStr(FrmMain.Data2));
    Report.ShowReport;
  finally
    CP.Free;
  end;  
end;

procedure TFmeOrganization.btnChangeOrgClick(Sender: TObject);
begin
  // *** �������� ������
  FC := TfrmChangeOrg.Create( Application );
  try
    FC.ShowModal;
  finally
    FC.Free;
  end;
end;

procedure TFmeOrganization.N9Click(Sender: TObject);
begin
  Report.LoadFromFile(RPath+'������ ���������.fr3');
  Report.ShowReport;
  qryObekt.Close;
end;

procedure TFmeOrganization.NavigateObkClick(Sender: TObject;
  Button: TRzNavigatorButton);
begin
  if (Button in [nbInsert,nbEdit]) then
  begin
    // ��������� ������
    FO := TFrmUObekt.Create( Application );
    try
      FO.ShowModal;
    finally
      FO.Free;
    end;
  end;
end;

procedure TFmeOrganization.NavigateOrgClick(Sender: TObject;
  Button: TRzNavigatorButton);
begin
if (Button in [nbInsert,nbEdit]) then
  begin
    // ��������� ������
    F := TFrmUOrganization.Create( Application );
    try
      F.ShowModal;
    finally
      F.Free;
    end;
  end;
end;

procedure TFmeOrganization.BtnHistoryClick(Sender: TObject);
begin
  // �������� �������
  LH := TFrmLookHistoryObekt.Create( Application );
  try
    LH.ShowModal;
  finally
    LH.Free;
  end;
end;

procedure TFmeOrganization.BtnFreeFilterClick(Sender: TObject);
begin
  // ������������ ������ �� �����������
  sql_flt:=InputBox('������� ������� �������:','������������ ������','');
  with dm.qryOrg do
  begin    
    try
      FilterSQL:=sql_flt;
    except
      ShowMessage('�������� ������� �������...');
    end;
  end;
end;

procedure TFmeOrganization.BtnFreeFilterObkClick(Sender: TObject);
begin
  // ������������ ������ �� �����������
  sql_flt:=InputBox('������� ������� �������:','������������ ������','');
  with dm.qryObk do
  begin    
    try
      Close;
      FilterSQL:=sql_flt;
      Open;
      if dm.qryOrg.Locate('kodorg',dm.qryObk['kodorg'],[]) then
        dm.qryObekt.Locate('kodobk',dm.qryObk['kodobk'],[])
      else
        ShowMessage('������ �� ���������� ������� �� ������...');
    except
      ShowMessage('�������� ������� �������...');
    end;
  end;
end;

procedure TFmeOrganization.BtnPrintClick(Sender: TObject);
begin
  qryObekt.FilterSQL:='a.kodorg='+dm.qryOrgkodorg.AsString;
  Report.LoadFromFile(RPath+'�������.fr3');
  Report.ShowReport;
  qryObekt.Close;
end;

procedure TFmeOrganization.BtnDeleteOrgClick(Sender: TObject);
Var
   s:string;
   p:PChar;
begin
  {�������� ������}
  // ��������� ����� �� ��������
  if FrmMain.UsrName = 'admin' then
  begin
    p:=StrAlloc(250*SizeOf(Char));
    s:='�� ������������� ������ ������� '+dm.qryOrg['nazv']+' ?'+#10#13+
       '������ � ������������ ����� ������� ��� ������� � ����������...';
    StrPCopy(p,s);
    if Application.MessageBox(p,
    '��������������',mb_YesNo or mb_TaskModal or mb_IconQuestion)=idYes then
    try
      dm.qryOrg.Delete;
      dm.qryOrg.Refresh;
    except
       ShowMessage('�� ������� ������� ������. ���������...');
    end;
  end
  else
    ShowMessage('� ������������ '+FrmMain.UsrName+' ����������� ����� �� �������� �������...');
end;

procedure TFmeOrganization.BtnDeleteObkClick(Sender: TObject);
Var
   s:string;
   p:PChar;
begin
  // ��������� ����� �� ��������
  if FrmMain.UsrName = 'admin' then
  begin
    p:=StrAlloc(250*SizeOf(Char));
    s:='�� ������������� ������ ������� '+dm.qryObekt['nazv']+' ?'+#10#13+
       '������ � �������� ����� ������� ��� ����������...';
    StrPCopy(p,s);
    if Application.MessageBox(p,
    '��������������',mb_YesNo or mb_TaskModal or mb_IconQuestion)=idYes then
    try
      dm.qryObekt.Delete;
      dm.qryObekt.Refresh;
    except
       ShowMessage('�� ������� �������. ���������...');
    end;
  end
  else
    ShowMessage('� ������������ '+FrmMain.UsrName+' ����������� ����� �� �������� �������...');
end;

procedure TFmeOrganization.RzToolButton1Click(Sender: TObject);
begin
  FrmMain.pgcWork.ActivePage:=FrmMain.TabWelcome;
end;

procedure TFmeOrganization.mN10Click(Sender: TObject);
begin
  with qryObekt do
  begin
    if Active then Close;
    Filtered:=False;
    Filter:='podklg=0';
    Filtered:=True;
  end;
  Report.LoadFromFile(RPath+'������� (�����).fr3');
  Report.ShowReport;
  qryObekt.Close;
end;

end.
