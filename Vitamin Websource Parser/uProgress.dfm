object frmProgress: TfrmProgress
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Progress Form'
  ClientHeight = 407
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object Ntbook_Progress: TNotebook
    Left = 0
    Top = 0
    Width = 439
    Height = 375
    Align = alClient
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object cxGrpBox_Progress1: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Caption = #45936#51060#53552#47484' '#51069#44256' '#51080#49845#45768#45796'. '#51104#49884#47564' '#44592#45796#47140' '#51452#49464#50836'.'
        TabOrder = 0
        Height = 375
        Width = 439
        object cxLbl_Elapsed: TcxLabel
          Left = 3
          Top = 23
          Caption = 'cxLbl_Elapsed'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = #44404#47548#52404
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxRichEd_ProgressLog: TcxRichEdit
          Left = 2
          Top = 75
          Align = alBottom
          Lines.Strings = (
            'cxRichEd_ProgressLog')
          TabOrder = 1
          Height = 298
          Width = 435
        end
        object cxPgBar_Progress: TcxProgressBar
          Left = 2
          Top = 51
          Align = alBottom
          AutoSize = False
          TabOrder = 2
          Height = 24
          Width = 435
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'DB Connection'
      ExplicitWidth = 403
      ExplicitHeight = 488
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 375
    Align = alBottom
    TabOrder = 1
    Height = 32
    Width = 439
    object cxbtn_close: TcxButton
      Left = 190
      Top = 4
      Width = 82
      Height = 25
      Cursor = crHandPoint
      Caption = 'Close(&X)'
      OptionsImage.Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303F8F80303030303030303030303030303030303FF03030303030303030303
        0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
        03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
        030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
        FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
        030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
        F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
        010101F8030303030303030303F8FF030303030303FFF8030303030303030303
        030101010101F80303030303030303030303F8FF0303030303F8030303030303
        0303030303F901010101F8030303030303030303030303F8FF030303F8030303
        0303030303030303F90101010101F8030303030303030303030303F803030303
        F8FF030303030303030303F9010101F8010101F803030303030303030303F803
        03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
        03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
        03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
        0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
        030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
        03030303030303030303030303030303030303030303030303F8F8F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
      OnClick = cxbtn_closeClick
    end
  end
  object cxTxtEd_ProgressTypeFlg: TcxTextEdit
    Left = 104
    Top = 264
    TabOrder = 2
    Text = 'cxTxtEd_ProgressTypeFlg'
    Visible = False
    Width = 201
  end
  object Timer_Prgs: TTimer
    OnTimer = Timer_PrgsTimer
    Left = 360
    Top = 96
  end
  object Timer_frmClose: TTimer
    Enabled = False
    OnTimer = Timer_frmCloseTimer
    Left = 288
    Top = 160
  end
end