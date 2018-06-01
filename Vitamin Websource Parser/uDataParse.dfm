object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Vitamin Data Parse v1.0'
  ClientHeight = 491
  ClientWidth = 1046
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 271
    Height = 491
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object dxBevel1: TdxBevel
      Left = 0
      Top = 0
      Width = 271
      Height = 26
      Align = alTop
    end
    object AdvStrGrd_HtmlLst: TAdvStringGrid
      Left = 0
      Top = 26
      Width = 271
      Height = 465
      Cursor = crDefault
      Align = alClient
      ColCount = 2
      Ctl3D = True
      DrawingStyle = gdsClassic
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
      ParentCtl3D = False
      ScrollBars = ssBoth
      TabOrder = 0
      ActiveRowShow = True
      HoverRowCells = [hcNormal, hcSelected]
      OnDblClickCell = AdvStrGrd_HtmlLstDblClickCell
      ActiveCellShow = True
      ActiveCellFont.Charset = HANGEUL_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -12
      ActiveCellFont.Name = #44404#47548#52404
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = clMoneyGreen
      ColumnHeaders.Strings = (
        '#No'
        '')
      ColumnSize.Stretch = True
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
      DefaultAlignment = taCenter
      EnhTextSize = True
      EnhRowColMove = False
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
        'Clear')
      FixedColWidth = 60
      FixedRowHeight = 22
      FixedRowAlways = True
      FixedColAlways = True
      FixedFont.Charset = HANGEUL_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -12
      FixedFont.Name = #44404#47548#52404
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      HoverButtons.Buttons = <>
      HoverButtons.Position = hbLeftFromColumnLeft
      HTMLSettings.ImageFolder = 'images'
      HTMLSettings.ImageBaseName = 'img'
      Multilinecells = True
      Navigation.AdvanceOnEnter = True
      Navigation.AdvanceAuto = True
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
      ExplicitTop = 51
      ExplicitHeight = 711
      ColWidths = (
        60
        207)
      RowHeights = (
        22
        22)
    end
    object cxShellCmbBox_Html: TcxShellComboBox
      Tag = 10
      Left = 6
      Top = 4
      Properties.DropDownWidth = 300
      Properties.ShowFullPath = sfpAlways
      Properties.OnEditValueChanged = cxShellCmbBox_HtmlPropertiesEditValueChanged
      TabOrder = 1
      Width = 259
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 271
    Top = 0
    Width = 5
    Height = 491
    Control = Panel1
  end
  object Panel2: TPanel
    Left = 276
    Top = 0
    Width = 532
    Height = 491
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object dxBevel2: TdxBevel
      Left = 0
      Top = 0
      Width = 532
      Height = 28
      Align = alTop
      ExplicitWidth = 614
    end
    object SynEd_FullHtmlSource: TSynEdit
      Left = 0
      Top = 28
      Width = 532
      Height = 191
      Align = alTop
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
        'SynEd_FullHtmlSource')
      FontSmoothing = fsmNone
    end
    object cxSplitter2: TcxSplitter
      Left = 0
      Top = 219
      Width = 532
      Height = 5
      AlignSplitter = salTop
    end
    object SynEdit2: TSynEdit
      Left = 0
      Top = 224
      Width = 532
      Height = 192
      Align = alClient
      ActiveLineColor = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 2
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.ShowLineNumbers = True
      Lines.Strings = (
        'SynEdit2')
      FontSmoothing = fsmNone
    end
    object cxButton1: TcxButton
      Left = 2
      Top = 2
      Width = 75
      Height = 25
      Caption = 'HTML Parse'
      TabOrder = 3
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 78
      Top = 2
      Width = 115
      Height = 25
      Caption = #51452#49548' '#50948#46020#44221#46020
      TabOrder = 4
      OnClick = cxButton2Click
    end
    object Button1: TButton
      Left = 193
      Top = 2
      Width = 97
      Height = 25
      Caption = #51452#49548' '#44032#51256#50724#44592
      TabOrder = 5
      OnClick = Button1Click
    end
    object cxButton3: TcxButton
      Left = 292
      Top = 2
      Width = 149
      Height = 25
      Caption = 'airport '#51221#48372' '#44032#51256#50724#44592
      TabOrder = 6
      OnClick = cxButton3Click
    end
    object cxButton4: TcxButton
      Left = 441
      Top = 2
      Width = 144
      Height = 25
      Caption = 'airline '#51221#48372' '#44032#51256#50724#44592
      TabOrder = 7
      OnClick = cxButton4Click
    end
    object SynEdit1: TSynEdit
      Left = 0
      Top = 416
      Width = 532
      Height = 75
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 8
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Lines.Strings = (
        'SynEdit1')
      FontSmoothing = fsmNone
    end
  end
  object cxSplitter3: TcxSplitter
    Left = 808
    Top = 0
    Width = 8
    Height = 491
    AlignSplitter = salRight
  end
  object Panel3: TPanel
    Left = 816
    Top = 0
    Width = 230
    Height = 491
    Align = alRight
    Caption = 'Panel3'
    TabOrder = 4
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 42
      Width = 228
      Height = 448
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 300
      ExplicitHeight = 192
      ControlData = {
        4C000000911700004D2E00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 228
      Height = 41
      Align = alTop
      TabOrder = 1
      object cxTxtEdit_Url: TcxTextEdit
        Left = 19
        Top = 13
        TabOrder = 0
        Text = 'https://www.airportal.go.kr/common/login/login_popup.jsp'
        Width = 119
      end
      object cxButton5: TcxButton
        Left = 144
        Top = 10
        Width = 75
        Height = 25
        Caption = 'gotoUrl'
        TabOrder = 1
        OnClick = cxButton5Click
      end
    end
  end
  object opndig_Html: TOpenDialog
    Left = 160
    Top = 120
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 224
    Top = 217
  end
  object SynHTMLSyn1: TSynHTMLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 677
    Top = 104
  end
  object IdHTTP2: TIdHTTP
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
end
