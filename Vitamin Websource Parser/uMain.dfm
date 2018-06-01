object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Vitamin WebSource Parser v1.0'
  ClientHeight = 674
  ClientWidth = 1110
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    TabOrder = 0
    Height = 97
    Width = 1110
    object cxTxtEdit_Url: TcxTextEdit
      Left = 4
      Top = 10
      TabOrder = 0
      Text = 'cxTxtEdit_Url'
      Width = 549
    end
    object cxButton1: TcxButton
      Left = 556
      Top = 8
      Width = 75
      Height = 25
      Caption = 'gotoUrl'
      TabOrder = 1
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 633
      Top = 8
      Width = 93
      Height = 25
      Caption = 'Source View'
      TabOrder = 2
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 726
      Top = 8
      Width = 75
      Height = 25
      Caption = #51452#49548' '#52628#52636
      TabOrder = 3
      OnClick = cxButton3Click
    end
    object cxButton4: TcxButton
      Left = 801
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Data '#52628#52636
      TabOrder = 4
      OnClick = cxButton4Click
    end
    object Button1: TButton
      Left = 882
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 5
      OnClick = Button1Click
    end
    object cxButton5: TcxButton
      Left = 3
      Top = 36
      Width = 158
      Height = 25
      Caption = #50640#50612#54252#53448' '#44277#54637' '#51452#49548' '#52628#52636
      TabOrder = 6
      OnClick = cxButton5Click
    end
    object cxButton6: TcxButton
      Left = 422
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Url Test'
      TabOrder = 7
      OnClick = cxButton6Click
    end
    object cxButton7: TcxButton
      Left = 319
      Top = 36
      Width = 97
      Height = 25
      Caption = #45936#51060#53552' '#52628#52636
      TabOrder = 8
      OnClick = cxButton7Click
    end
    object cxButton8: TcxButton
      Left = 160
      Top = 36
      Width = 153
      Height = 25
      Caption = #50640#50612#54252#53448' '#54637#44277' '#51452#49548' '#52628#52636
      TabOrder = 9
      OnClick = cxButton8Click
    end
    object cxButton9: TcxButton
      Left = 503
      Top = 36
      Width = 128
      Height = 25
      Caption = #47196#44536#51064' '#53580#49828#53944
      TabOrder = 10
      OnClick = cxButton9Click
    end
    object cxButton10: TcxButton
      Left = 4
      Top = 66
      Width = 117
      Height = 25
      Caption = 'submit test'
      TabOrder = 11
      OnClick = cxButton10Click
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 609
    Top = 97
    Width = 5
    Height = 577
    ExplicitTop = 73
    ExplicitHeight = 601
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 97
    Align = alLeft
    TabOrder = 2
    ExplicitTop = 73
    ExplicitHeight = 601
    Height = 577
    Width = 609
    object WebBrowser1: TWebBrowser
      Left = 2
      Top = 17
      Width = 605
      Height = 558
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitHeight = 582
      ControlData = {
        4C000000873E0000AC3900000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E12620A000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 614
    Top = 97
    Align = alClient
    TabOrder = 3
    ExplicitTop = 73
    ExplicitHeight = 601
    Height = 577
    Width = 496
    object cxGroupBox4: TcxGroupBox
      Left = 2
      Top = 347
      Align = alBottom
      Caption = 'Html Source'
      TabOrder = 0
      ExplicitTop = 371
      Height = 228
      Width = 492
      object SynEdit1: TSynEdit
        Left = 2
        Top = 17
        Width = 488
        Height = 209
        Align = alClient
        ActiveLineColor = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Highlighter = SynHTMLSyn1
        Lines.Strings = (
          'SynEdit1')
        FontSmoothing = fsmNone
      end
    end
    object AdvStringGrid1: TAdvStringGrid
      Left = 2
      Top = 17
      Width = 492
      Height = 184
      Cursor = crDefault
      Align = alTop
      ColCount = 7
      DrawingStyle = gdsClassic
      RowCount = 1
      FixedRows = 0
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      HoverRowCells = [hcNormal, hcSelected]
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDown.TextChecked = 'Checked'
      FilterDropDown.TextUnChecked = 'Unchecked'
      FilterDropDownClear = '(All)'
      FilterEdit.TypeNames.Strings = (
        'Starts with'
        'Ends with'
        'Contains'
        'Not contains'
        'Equal'
        'Not equal'
        'Larger than'
        'Smaller than'
        'Clear')
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      HoverButtons.Buttons = <>
      HoverButtons.Position = hbLeftFromColumnLeft
      HTMLSettings.ImageFolder = 'images'
      HTMLSettings.ImageBaseName = 'img'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SortSettings.DefaultFormat = ssAutomatic
      Version = '8.1.3.0'
      ColWidths = (
        64
        64
        64
        64
        64
        64
        64)
      RowHeights = (
        22)
    end
    object cxSplitter2: TcxSplitter
      Left = 2
      Top = 342
      Width = 492
      Height = 5
      AlignSplitter = salBottom
      ExplicitTop = 366
    end
    object cxSplitter3: TcxSplitter
      Left = 2
      Top = 201
      Width = 492
      Height = 5
      AlignSplitter = salTop
    end
    object SynEdit2: TSynEdit
      Left = 2
      Top = 206
      Width = 492
      Height = 136
      Align = alClient
      ActiveLineColor = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 4
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.ShowLineNumbers = True
      Lines.Strings = (
        'SynEdit2')
      FontSmoothing = fsmNone
      ExplicitHeight = 160
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Fire' +
      'fox/12.0'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 88
    Top = 120
  end
  object SynHTMLSyn1: TSynHTMLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 641
    Top = 484
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 104
    Top = 225
  end
end
