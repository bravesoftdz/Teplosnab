object FmeVerifyBase: TFmeVerifyBase
  Left = 0
  Top = 0
  Width = 839
  Height = 479
  TabOrder = 0
  TabStop = True
  object RzLabel9: TRzLabel
    Left = 0
    Top = 0
    Width = 839
    Height = 25
    Align = alTop
    Alignment = taCenter
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1094#1077#1083#1086#1089#1090#1085#1086#1089#1090#1080' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
    Color = 16771797
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    BorderOuter = fsFlat
    BorderSides = []
    TextStyle = tsRaised
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 62
    Width = 839
    Height = 368
    Align = alClient
    BorderInner = fsFlatRounded
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 0
    object dbgError: TDBGridEh
      Left = 2
      Top = 2
      Width = 835
      Height = 366
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = DM.dsError
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'nazv_err'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1086#1096#1080#1073#1082#1080
          Width = 350
        end
        item
          EditButtons = <>
          FieldName = 'tablename_err'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1072#1073#1083#1080#1094#1072
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'tip_err'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1086#1096#1080#1073#1082#1080
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'recomendation'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1080
          Width = 300
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 25
    Width = 839
    Height = 37
    Align = alTop
    BorderInner = fsFlatRounded
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 8
      Top = 12
      Width = 262
      Height = 13
      Caption = #1042#1099#1073#1086#1088' '#1086#1073#1098#1077#1082#1090#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cboObject: TRzComboBox
      Left = 272
      Top = 8
      Width = 257
      Height = 21
      Style = csDropDownList
      Ctl3D = False
      DropDownCount = 9
      FlatButtons = True
      FrameColor = 12164479
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
      Items.Strings = (
        #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        #1054#1073#1098#1077#1082#1090#1099
        #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1099#1077' '#1091#1095#1072#1089#1090#1082#1080
        #1055#1088#1080#1073#1086#1088#1099' '#1091#1095#1077#1090#1072
        #1044#1086#1084#1072
        #1050#1074#1072#1088#1090#1080#1088#1099
        #1058#1072#1088#1080#1092' ('#1090#1077#1087#1083#1086')'
        #1058#1072#1088#1080#1092' ('#1074#1086#1076#1072')'
        #1059#1083#1080#1094#1099)
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 430
    Width = 839
    Height = 49
    Align = alBottom
    BorderInner = fsFlatRounded
    BorderOuter = fsNone
    TabOrder = 2
    Transparent = True
    object BtnVerify: TRzBitBtn
      Left = 13
      Top = 8
      Width = 140
      Height = 33
      Caption = #1053#1072#1095#1072#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 0
      OnClick = BtnVerifyClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000E30E0000E30E00000001000000000000080808001818
        18002929210029292900424239004242420042424A004A424A0052424A004A4A
        4A004A524A0031395200525252005A6352005A5A5A005A635A0063635A006B63
        5A00525263005A5263005A5A6300635A63005A636300636363006B6363006B6B
        6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B7373007373
        73007B73730084737300737B73005A637B0073737B007B737B0084737B007B7B
        7B008C847B00848484008C848C00848C8C008C8C8C008C948C00949494009CA5
        94009C9C9C00A5A5A500394AAD00848CAD00ADADAD009494B500ADADB500ADB5
        B500B5B5B500526BBD00BDBDBD009CA5C600C6C6C6004A63CE00CECECE007384
        D600D6D6D600E7DED6007B94DE009CA5DE00DEDEDE000029E7004A6BE700738C
        EF0094A5EF00FF00FF006B8CFF009CB5FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004B4B4B4B4B4B
        4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B
        4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B2B301C170E0E0E171C2930332B4B4B4B
        4B4B4B4B4B4B2B1732210E17212E363A3C3C332E2B2B2B4B4B4B4B4B4B4B091C
        462B17172930333C40423E3C36323A4B4B4B4B4B4B4B091C462E17172130333A
        40423E3A36323A4B4B4B4B4B4B4B051C422B1717212E333A3E423E3A36323A4B
        4B4B4B4B4B4B091C462B17172930333A40423E3A33303A4B4B4B4B4B4B4B091C
        3E210E0C0E0E0E171C0218181818184B4B4B4B4B4B4B090E33210E0E212E333A
        3C0143434734184B4B4B4B4B4B4B051C422B1717212E333A400341474347184B
        4B4B4B4B4B4B0719432C1015282F333A40013743433F474B4B4B4B4B4B4B0520
        422C0F1B222E333A40050505040647494B4B4B4B4B4B051E462C1617292E333A
        40423E3A36323A4747454B4B4B4B08184023120E0C0E0E0E1C2B2E3032303A4B
        4A474B4B4B4B081833210D17212E333A3E1818181818184B4B4B4B4B4B4B0818
        432C1018212E33363E002E393525184B4B4B4B4B4B4B0818432C0F10212D323A
        3E014343473B184B4B4B4B4B4B4B0818432C14101D2D32363E0344474347184B
        4B4B4B4B4B4B08183321111A1D2D30363C013D434348474B4B4B4B4B4B4B051B
        3324130C171517171C030505050B474D4B4B4B4B4B4B0A1D382E303133363333
        363633322E293247474B4B4B4B4B4B4B2A27211F261D2121212129292B4B4B4B
        4C474B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B}
    end
    object BtnPrint: TRzBitBtn
      Left = 156
      Top = 8
      Width = 140
      Height = 33
      Caption = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 1
      OnClick = BtnPrintClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000730E0000730E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
        09090909090909E8E8E8E8E88181818181818181818181E8E8E8E85E89898989
        89898989895E5E09E8E8E8E2ACACACACACACACACACE2E281E8E85E5E5E5E5E5E
        5E5E5E5E5E5E095E09E8E2E2E2E2E2E2E2E2E2E2E2E281E281E85ED789898989
        8989898989895E0909E8E2E8ACACACACACACACACACACE28181E85ED789898989
        181289B490895E5E09E8E2E8ACACACACE281ACE281ACE2E281E85ED7D7D7D7D7
        D7D7D7D7D7D75E5E5E09E2E8E8E8E8E8E8E8E8E8E8E8E2E2E2815ED789898989
        8989898989895E5E5E09E2E8ACACACACACACACACACACE2E2E281E85E5E5E5E5E
        5E5E5E5E5E89895E5E09E8E2E2E2E2E2E2E2E2E2E2ACACE2E281E8E85ED7D7D7
        D7D7D7D7D75E89895E09E8E8E2E8E8E8E8E8E8E8E8E2ACACE281E8E8E85ED7E3
        E3E3E3E3D75E5E5E09E8E8E8E8E2E8ACACACACACE8E2E2E281E8E8E8E85ED7D7
        D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85ED7
        E3E3E3E3E3D75EE8E8E8E8E8E8E8E2E8ACACACACACE8E2E8E8E8E8E8E8E85ED7
        D7D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85E
        5E5E5E5E5E5E5E5EE8E8E8E8E8E8E8E2E2E2E2E2E2E2E2E2E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object BtnEditError: TRzBitBtn
      Left = 299
      Top = 8
      Width = 140
      Height = 33
      Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1086#1096#1080#1073#1082#1080
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 2
      OnClick = BtnEditErrorClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000F40E0000F40E00000001000000000000392918003131
        31004242420021214A004A424A0052424A004A4A4A004A524A00525252005A63
        52007363520018425A005A5A5A005A635A0063635A006B635A00846B5A000842
        6300525263005A5263005A5A6300635A63005A636300636363006B6363006B6B
        630021526B00635A6B0052636B0063636B006B6B6B006B736B00636B7300736B
        73006B737300737373007B73730084737300737B730029637B0073737B007B73
        7B0084737B007B7B7B0084847B008C847B00848484008C848C00848C8C008C8C
        8C008C948C009C948C00949494009CA594004A6B9C009C9C9C00A5A5A500ADAD
        AD00ADADB500B5B5B500E7CEB5003139BD00BDBDBD008CB5C600C6C6C600CECE
        CE0010A5D600D6D6D600E7DED60042A5DE00DEDEDE000010E700F7EFE700299C
        EF002973F70042E7F700FF00FF006BC6FF008CF7FF00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000004C4C4C4C4C4C
        4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C2E372317
        23393B3E382E2E4C4C4C4C4C06462E172B383E434039374C4C4C4C4C02432E17
        013B3B434039374C4C4C4C4C06462E1705271C434038344C4C4C4C4C0638230C
        234E4A11382E2E4C4C4C4C4C02432E17233E4B4A1A39374C4C4C4C4C02432F1D
        24383B4B4A1A374C4C4C4C4C02462F172B383B3E4B4A114C4C4C4C4C05382317
        23383B413B452D014C4C4C4C05442F18233839413E384F0A034C4C4C05442F0E
        1F3739413E3834494A034C4C0538231B1F3439413E38314C474C4C4C073A3135
        3838383938312B4C4C4C4C4C4C2D2921282323232B2E4C4C4C4C}
    end
    object RzBitBtn1: TRzBitBtn
      Left = 442
      Top = 8
      Width = 140
      Height = 33
      Caption = #1042#1099#1093#1086#1076
      Color = 15791348
      HighlightColor = 16026986
      HotTrack = True
      HotTrackColor = 3983359
      TabOrder = 3
      OnClick = RzBitBtn1Click
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
  object sp_Verify: TMSStoredProc
    StoredProcName = 'sp_verify_base;1'
    Connection = DM.Conect
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_verify_base;1(:id_object)}')
    Left = 64
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_object'
        ParamType = ptInput
      end>
  end
  object Report: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39015.459088495400000000
    ReportOptions.LastChange = 39015.493383020830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender:TfrxComponent);'
      'begin'
      '  if Trim(<DsError."tip_err">) = '#39#1053#1072#1088#1091#1096#1077#1085#1072' '#1089#1074#1103#1079#1100#39' then'
      '     Memo9.Font.Color:=clRed'
      '  else'
      '     Memo9.Font.Color:=clGreen;'
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender:TfrxComponent);'
      'begin'
      '  if <DsError."kod_obj"> = 0 then'
      '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080'"'#39';'
      '  if <DsError."kod_obj"> = 1 then'
      '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1054#1073#1098#1077#1082#1090#1099'"'#39';'
      '  if <DsError."kod_obj"> = 2 then'
      
        '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1099#1077' ' +
        #1091#1095#1072#1089#1090#1082#1080'"'#39';'
      '  if <DsError."kod_obj"> = 3 then'
      '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1055#1088#1080#1073#1086#1088#1099' '#1091#1095#1077#1090#1072'"'#39';'
      '  if <DsError."kod_obj"> = 4 then'
      '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1044#1086#1084#1072'"'#39';'
      '  if <DsError."kod_obj"> = 5 then'
      '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1050#1074#1072#1088#1090#1080#1088#1099'"'#39';'
      '  if <DsError."kod_obj"> = 6 then'
      '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1058#1072#1088#1080#1092' ('#1090#1077#1087#1083#1086')"'#39';'
      '  if <DsError."kod_obj"> = 7 then'
      '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1058#1072#1088#1080#1092' ('#1074#1086#1076#1072')"'#39';'
      '  if <DsError."kod_obj"> = 8 then'
      '     Memo2.Text:='#39#1054#1096#1080#1073#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1086#1073#1098#1077#1082#1090#1072' "'#1059#1083#1080#1094#1099'"'#39';'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 96
    Top = 184
    Datasets = <
      item
        DataSet = ErrorSet
        DataSetName = 'DsError'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo2: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13434879
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 34.015770000000000000
        ParentFont = False
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = ErrorSet
        DataSetName = 'DsError'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Width = 260.787570000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DataField = 'nazv_err'
          DataSet = ErrorSet
          DataSetName = 'DsError'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[DsError."nazv_err"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DataField = 'tablename_err'
          DataSet = ErrorSet
          DataSetName = 'DsError'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[DsError."tablename_err"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DataField = 'tip_err'
          DataSet = ErrorSet
          DataSetName = 'DsError'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[DsError."tip_err"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 491.338900000000000000
          Width = 222.992270000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DataField = 'recomendation'
          DataSet = ErrorSet
          DataSetName = 'DsError'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[DsError."recomendation"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 37.795300000000000000
        ParentFont = False
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.838742640000000000
          Width = 714.331170000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029' [Date]'
            #1056#1038#1057#8218#1056#176#1057#1026#1056#1029#1056#1105#1057#8224#1056#176' [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 30.236240000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 260.787570000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1105#1056#181' '#1056#1109#1057#8364#1056#1105#1056#177#1056#1108#1056#1105)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 264.567100000000000000
          Top = 3.779529999999994000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#176#1056#177#1056#187#1056#1105#1057#8224#1057#8249)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 377.953000000000000000
          Top = 3.779529999999994000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111' '#1056#1109#1057#8364#1056#1105#1056#177#1056#1108#1056#1105)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779529999999994000
          Width = 222.992270000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#181#1056#1108#1056#1109#1056#1112#1056#181#1056#1029#1056#1169#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
        end
      end
    end
  end
  object ErrorSet: TfrxDBDataset
    UserName = 'DsError'
    CloseDataSource = False
    DataSource = DM.dsError
    BCDToCurrency = False
    Left = 128
    Top = 184
  end
  object sp_CheckError: TMSStoredProc
    StoredProcName = 'sp_CheckError;1'
    Connection = DM.Conect
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_CheckError;1}')
    Left = 64
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
  end
end
