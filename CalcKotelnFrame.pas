unit CalcKotelnFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RzSpnEdt, RzEdit, StdCtrls, Mask, RzPanel, ImgList, RzButton,
  DBCtrls, RzDBCmbo, ExtCtrls, RzLabel, RzLine, RzRadGrp, RzDBSpin,
  RzDBEdit, Menus, PokPribForm, Str_Fun, DB, MemDS, DBAccess,
  MSAccess, RezCalcObektForm,WaitScreenForm, TB2Item, TBX, TB2Dock,
  TB2Toolbar, TBXSwitcher, RezCalcNasForm, SpisForm;
  
type
  TFmeCalcKoteln = class(TFrame)
    lblCaption: TRzLabel;
    RzPanel1: TRzPanel;
    RzLabel14: TRzLabel;
    lcbKoteln: TRzDBLookupComboBox;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    ImageList: TImageList;
    rgOt: TRzGroupBox;
    rgGv: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    neKdo: TRzDBNumericEdit;
    neSrt: TRzDBNumericEdit;
    RzLabel6: TRzLabel;
    neNormativ_ot: TRzDBNumericEdit;
    RzLabel7: TRzLabel;
    neKdg: TRzDBNumericEdit;
    RzLabel8: TRzLabel;
    RzLabel10: TRzLabel;
    neNgv: TRzDBNumericEdit;
    RzLabel11: TRzLabel;
    neNormativ_gv: TRzDBNumericEdit;
    rgParamCalc: TRzRadioGroup;
    grbGroop: TRzGroupBox;
    RzLabel15: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLine1: TRzLine;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    spQkot: TMSStoredProc;
    spVerifyTemper: TMSStoredProc;
    spSrTemp: TMSStoredProc;
    neKco: TRzDBNumericEdit;
    neKcg: TRzDBNumericEdit;
    nePok: TRzNumericEdit;
    nePs: TRzNumericEdit;
    nePokOt: TRzNumericEdit;
    nePokGv: TRzNumericEdit;
    neCalcGv: TRzNumericEdit;
    neCalcOt: TRzNumericEdit;
    deStart: TRzDBDateTimeEdit;
    deEnd: TRzDBDateTimeEdit;
    TBXDock1: TTBXDock;
    TBXToolbar1: TTBXToolbar;
    PokPrib: TTBXItem;
    CalcKot: TTBXSubmenuItem;
    CalcOt: TTBXItem;
    CalcGvs: TTBXItem;
    TBXSeparatorItem1: TTBXSeparatorItem;
    FullCalc: TTBXItem;
    RezCot: TTBXSubmenuItem;
    RezObk: TTBXItem;
    RezNas: TTBXItem;
    RzLabel9: TRzLabel;
    nePoteri: TRzDBNumericEdit;
    TBXItem1: TTBXItem;
    TBXItem2: TTBXItem;
    TBXItem3: TTBXItem;
    procedure lcbKotelnCloseUp(Sender: TObject);
    procedure CalcOtClick(Sender: TObject);
    procedure BtnPribClick(Sender: TObject);
    procedure deEndChange(Sender: TObject);
    procedure BtnRezCalcClick(Sender: TObject);
    procedure rgParamCalcClick(Sender: TObject);
    procedure FullCalcClick(Sender: TObject);
    procedure CalcGvsClick(Sender: TObject);
    procedure RezNasClick(Sender: TObject);
    procedure TBXItem1Click(Sender: TObject);
    procedure TBXItem2Click(Sender: TObject);
    procedure TBXItem3Click(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
  private
    F:TFrmPokPrib;
    FR:TFrmRezCalcObekt;
    W:TFrmWaitScreen;
    FN:TFrmRezCalcNas;
    FS:TFrmSpis;
    procedure Calculate(Index:integer);
    procedure VibKot;
  public
    procedure Init;
    function VerifyData:Boolean;   
  end;

implementation

uses DataModule, MainForm, DataPrint;

{$R *.dfm}

{ TFmeCalcKoteln }

procedure TFmeCalcKoteln.Init;
begin
  {�������������}
  with dm.qryKoteln do
  begin
    if Active then Close;
    try
      Open;
    except
      ShowMessage('�� ������� ������� ������� "���������"');
    end;
  end;
  lblCaption.Caption:='���������� �� �������� �� '+
  FormatDateTime('mmmm, yyyy "�."',StrToDate(FrmMain.WorkDate));
  FrmMain.Data1:=StrToDate(FrmMain.WorkDate);
  FrmMain.Data2:=EndOfMonth(StrToDate(FrmMain.WorkDate));
end;

procedure TFmeCalcKoteln.lcbKotelnCloseUp(Sender: TObject);
begin
  with dm.qryCalcKot do
  begin
    FilterSQL:='kodkot = '+IntToStr(lcbKoteln.KeyValue)+' and datan between '''+FrmMain.WorkDate+''' and '''+
    DateToStr(EndOfMonth(StrToDate(FrmMain.WorkDate)))+'''';
    try
      Open;
    except
      ShowMessage('�� ������� �������...');
    end;
    try
      Edit;
    except
      ShowMessage('����� �������������� ������...');
    end;  
  end;
  if lcbKoteln.KeyValue = 10 then    //����
  begin
    // ����������� � ��������� ���������
    with spQkot do
    begin
      StoredProcName:='sp_calc_sliv;1';
      ParamByName('kod').AsInteger:=lcbKoteln.KeyValue;
      ParamByName('data').AsDate:=StrToDate(FrmMain.WorkDate);
      try
        ExecProc;
        {���������� �� ���������}
        FR:=TFrmRezCalcObekt.Create(Application);
        try
          FrmMain.FilterData:='b.kodkot = '+IntToStr(lcbKoteln.KeyValue)+' and '+
          'a.datan between '''+DateToStr(FrmMain.Data1)+''' and '''+
          DateToStr(EndOfMonth(FrmMain.Data2))+'''';
          if FrmMain.Data1<StrToDate(FrmMain.WorkDate) then FrmMain.FlagEdit:=False
          else FrmMain.FlagEdit:=True;
          FR.ShowModal;
        finally
          FR.Free;
        end;
      except
        ShowMessage('������ ���������� ��������...');
      end;
    end;
  end;
end;

procedure TFmeCalcKoteln.CalcOtClick(Sender: TObject);
begin
  {������ ���������}
  if VerifyData then
  Calculate(1) else ShowMessage('������ ��� ������� ���������� ���������...');
end;

procedure TFmeCalcKoteln.BtnPribClick(Sender: TObject);
begin
  VibKot;
  {��������� �������� �� ���������}
  F:=TFrmPokPrib.Create(Application);
  try
    FrmMain.FilterData:='b.datan between '''+DateToStr(FrmMain.Data1)+''' and '''+
    DateToStr(EndOfMonth(FrmMain.Data2))+'''';
    if FrmMain.Data1<StrToDate(FrmMain.WorkDate) then FrmMain.FlagEdit:=False
    else FrmMain.FlagEdit:=True;
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TFmeCalcKoteln.deEndChange(Sender: TObject);
begin
  {��������� ����}
  if deEnd.Date<deStart.Date then
  begin
    ShowMessage('���� ��������� ������� �� ����� ���� ������ ���� ������ �������...');
    exit;
    deEnd.SetFocus;
  end
  else
  begin
    if Not VarIsNull(deStart.Date) then
    begin
      with spVerifyTemper do
      begin
        ParamByName('data1').AsDate:=deStart.Date;
        ParamByName('data2').AsDate:=deEnd.Date;
        try
          if deStart.Date<>StrToDate('30.12.1899') then
          ExecProc;
          if ParamByName('kol').AsInteger > 0 then
            ShowMessage(ParamByName('str').AsString+'�������...');
        except
          ShowMessage('�� ������� ��������� ������� �����������...');
        end;
      end;
      with spSrTemp do
      begin
        ParamByName('data1').AsDate:=deStart.Date;
        ParamByName('data2').AsDate:=deEnd.Date;
        try
          ExecProc;
          neKdo.Value:=ParamByName('c_day').AsInteger;
          neSrT.Value:=ParamByName('c_tmp').AsFloat;
        except
          ShowMessage('�� ������� �������� ������� �����������...');
        end;
      end;
    end
    else
    begin
      ShowMessage('������� ��������� ����...');
      exit;
      deStart.SetFocus;
    end;
  end;
end;

procedure TFmeCalcKoteln.BtnRezCalcClick(Sender: TObject);
begin
  VibKot;
  {���������� �� ���������}
  FR:=TFrmRezCalcObekt.Create(Application);
  try
    FrmMain.FilterData:='b.kodkot = '+IntToStr(lcbKoteln.KeyValue)+' and '+
    'a.datan between '''+DateToStr(FrmMain.Data1)+''' and '''+
    DateToStr(EndOfMonth(FrmMain.Data2))+'''';
    if FrmMain.Data1<StrToDate(FrmMain.WorkDate) then FrmMain.FlagEdit:=False
    else FrmMain.FlagEdit:=True;
    FR.ShowModal;
  finally
    FR.Free;
  end;
end;

procedure TFmeCalcKoteln.rgParamCalcClick(Sender: TObject);
begin
  case rgParamCalc.ItemIndex of
  0:begin
    grbGroop.Visible:=False;
    end;
  1:begin
    grbGroop.Visible:=True;
    end;
  end;
end;

procedure TFmeCalcKoteln.FullCalcClick(Sender: TObject);
begin
  Calculate(3);
end;

procedure TFmeCalcKoteln.CalcGvsClick(Sender: TObject);
begin
  {������ ���������}
  Calculate(2);
end;

procedure TFmeCalcKoteln.Calculate(Index: integer);
begin
  {������ ���������}
  W:=TFrmWaitScreen.Create(Application);
  W.Show;
  W.Update;
  // 1. ��������� ������ �� ���������
  with dm do
  begin
    qryCalcKotDATAN.Value:=StrToDate(FrmMain.WorkDate);
    qryCalcKotKODKOT.Value:=lcbKoteln.KeyValue;
    qryCalcKot.Post;
  end;
  // 2. ������
  if rgParamCalc.ItemIndex = 0 then
  begin
    with spQkot do
    begin
      StoredProcName:='sp_calc_kot;1';
      ParamByName('kod').AsInteger:=lcbKoteln.KeyValue;
      ParamByName('data').AsDate:=StrToDate(FrmMain.WorkDate);
      ParamByName('oper').AsInteger:=Index;
      try
        ExecProc;
        W.Free;
        ShowMessage('������ ����������...');
      except
        W.Free;
        ShowMessage('�� ������� ����������...');
      end;
    end;
  end;
end;

procedure TFmeCalcKoteln.RezNasClick(Sender: TObject);
begin
  VibKot;
  {���������� �� ���������}
  FN:=TFrmRezCalcNas.Create(Application);
  try
    FrmMain.FilterData:='b.kodkot = '+IntToStr(lcbKoteln.KeyValue)+' and '+
    'a.datan between '''+DateToStr(FrmMain.Data1)+''' and '''+
    DateToStr(EndOfMonth(FrmMain.Data2))+'''';
    if FrmMain.Data1<StrToDate(FrmMain.WorkDate) then FrmMain.FlagEdit:=False
    else FrmMain.FlagEdit:=True;
    FN.ShowModal;
  finally
    FN.Free;
  end;
end;

procedure TFmeCalcKoteln.TBXItem1Click(Sender: TObject);
begin
  FrmMain.pgcWork.ActivePage:=FrmMain.TabWelcome;
end;

procedure TFmeCalcKoteln.TBXItem2Click(Sender: TObject);
begin
  VibKot;
  {�������� �������}
  FS:=TFrmSpis.Create(Application);
  try
    FS.ShowModal;
  finally
    FS.Free;
  end;
  Init;   
end;

procedure TFmeCalcKoteln.TBXItem3Click(Sender: TObject);
begin
  VibKot;
  {�����}
  with dp.qryKot do
  begin
    FilterSQL:='a.kodkot = '+IntToStr(lcbKoteln.KeyValue)+
    ' and a.datan = '''+FrmMain.WorkDate+'''';
    Open;
  end;
  dp.Report.LoadFromFile(FrmMain.RPath+'����� �� �������.fr3');
  dp.Report.Variables['period']:=PeriodStr(StrToDate(FrmMain.WorkDate),Null);
  dp.Report.ShowReport;
end;

function TFmeCalcKoteln.VerifyData: Boolean;
begin
  if (neNormativ_ot.Value = 0) or (neKco.Value = 0) or (neKdo.Value = 0) then
  Result:=False else Result:=True;
end;

procedure TFmeCalcKoteln.FrameEnter(Sender: TObject);
begin
  Init;
end;

procedure TFmeCalcKoteln.VibKot;
begin
  if VarIsNull(lcbKoteln.KeyValue) then
  begin
    ShowMessage('������� �� ������, ������� ����� ���������� �� ���������...');
    lcbKoteln.KeyValue:=1;
    lcbKotelnCloseUp(nil);
  end;  
end;

end.
