object FmePerexod: TFmePerexod
  Left = 0
  Top = 0
  Width = 636
  Height = 468
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  TabStop = True
  object RzLabel9: TRzLabel
    Left = 0
    Top = 0
    Width = 636
    Height = 30
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1085#1086#1074#1099#1081' '#1084#1077#1089#1103#1094
    Color = 16771797
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    BorderOuter = fsFlat
    BorderSides = [sdBottom]
    TextStyle = tsRaised
  end
  object pnlMain: TRzPanel
    Left = 0
    Top = 65
    Width = 636
    Height = 360
    Align = alClient
    BorderOuter = fsFlatRounded
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 0
    object dbgObekt: TDBGridEh
      Left = 2
      Top = 2
      Width = 632
      Height = 358
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dsUpNewMonth
      Flat = True
      FooterColor = 12713213
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      VTitleMargin = 5
      Columns = <
        item
          EditButtons = <>
          FieldName = 'nazv'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
          Width = 400
        end
        item
          EditButtons = <>
          FieldName = 'cnt_rec'
          Footers = <>
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'cnt_uprec'
          Footers = <>
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
          Width = 100
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 425
    Width = 636
    Height = 43
    Align = alBottom
    BorderOuter = fsFlatRounded
    TabOrder = 1
    object BtnOk: TRzBitBtn
      Left = 8
      Top = 9
      Width = 100
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1085#1086#1074#1099#1081' '#1084#1077#1089#1103#1094
      Caption = #1055#1077#1088#1077#1081#1090#1080
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 0
      OnClick = BtnOkClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000030E0000030E00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8091009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E85E5E5E5E5E5E
        5E5E5E09101009E8E8E881818181818181818181ACAC81E8E8E85ED7D7D7D7D7
        D7D7D70910101009E8E881E8E8E8E8E8E8E8E881ACACAC81E8E85ED7E3E3E3E3
        E3E3E3091010101009E881E8ACACACACACACAC81ACACACAC81E85ED7D7D7D7D7
        D7D7D70910101010100981E8E8E8E8E8E8E8E881ACACACACAC815ED7E3E3E3E3
        E3E3E3091010101009E881E8ACACACACACACAC81ACACACAC81E85ED7D7D7D7D7
        D7D7D70910101009E8E881E8E8E8E8E8E8E8E881ACACAC81E8E85ED7E3E3E3E3
        E3E3E309101009E8E8E881E8ACACACACACACAC81ACAC81E8E8E85ED7D7D7D7D7
        D7D7D7091009E8E8E8E881E8E8E8E8E8E8E8E881AC81E8E8E8E85ED7E3E3E3E3
        E3E3E309095EE8E8E8E881E8ACACACACACACAC818181E8E8E8E85ED7D7D7D7D7
        D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3E3E3
        E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7D7D7
        D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7D7D7D7D7
        D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85E5E5E5E5E5E
        5E5E5E5E5E5EE8E8E8E8818181818181818181818181E8E8E8E8}
      NumGlyphs = 2
    end
    object BtnCancel: TRzBitBtn
      Left = 112
      Top = 9
      Width = 100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      Caption = #1042#1099#1093#1086#1076
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 1
      OnClick = BtnCancelClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000730B0000730B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
        E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
        57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
        578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
        57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
        57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
        57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
        57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
        57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
        57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
        57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
        57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
        57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
        57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
        57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
        57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 30
    Width = 636
    Height = 35
    Align = alTop
    BorderOuter = fsFlatRounded
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 2
    object RzLabel1: TRzLabel
      Left = 16
      Top = 3
      Width = 122
      Height = 25
      Caption = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TextStyle = tsShadow
    end
    object cboStart: TRzComboBox
      Left = 140
      Top = 7
      Width = 221
      Height = 21
      Ctl3D = False
      FlatButtons = True
      FrameColor = 12164479
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object spPerexod: TMSStoredProc
    StoredProcName = 'sp_perexod;1'
    Connection = DM.Conect
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_perexod;1(:oper, :data)}')
    Left = 440
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'oper'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'data'
        ParamType = ptInput
      end>
  end
  object qryUpNewMonth: TMSQuery
    Connection = DM.Conect
    SQL.Strings = (
      'select * from t_upnewmonth')
    Left = 440
    Top = 176
  end
  object dsUpNewMonth: TDataSource
    DataSet = qryUpNewMonth
    Left = 472
    Top = 176
  end
end