unit uProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Vcl.Menus, Vcl.ExtCtrls, cxTextEdit, Vcl.StdCtrls, cxButtons, cxProgressBar,
  cxMemo, cxRichEdit, cxLabel, cxGroupBox, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmProgress = class(TForm)
    Ntbook_Progress: TNotebook;
    cxGrpBox_Progress1: TcxGroupBox;
    cxLbl_Elapsed: TcxLabel;
    cxRichEd_ProgressLog: TcxRichEdit;
    cxPgBar_Progress: TcxProgressBar;
    cxGroupBox1: TcxGroupBox;
    cxbtn_close: TcxButton;
    cxTxtEd_ProgressTypeFlg: TcxTextEdit;
    Timer_Prgs: TTimer;
    Timer_frmClose: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Timer_frmCloseTimer(Sender: TObject);
    procedure Timer_PrgsTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxbtn_closeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    fv_dtStart : TDateTime;

  public
    { Public declarations }
    //****************************************************************************//
    //* 실행 과정을 보여 준다.
    //****************************************************************************//
    procedure ufProgress(pi_Flg : Integer; pi_Msg : String; pi_PrgsPercent : Integer; pi_Objlabel : TcxLabel; pi_ObjPrgs : TcxProgressBar; pi_ObjRichEdit : TcxRichEdit);
    function RPad(S: string; Ch: Char; Len: Integer): string;
    function LPad(S: string; Ch: Char; Len: Integer): string;
    //****************************************************************************//
    //* Query 경과 시간을 구한다.
    //****************************************************************************//
    function fGetQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;

  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

uses uDataParse;

//****************************************************************************//
//* Start : User Define Function, Procedure
//****************************************************************************//
//****************************************************************************//
//* 실행 과정을 보여 준다.
//****************************************************************************//
procedure TfrmProgress.ufProgress(pi_Flg : Integer; pi_Msg : String; pi_PrgsPercent : Integer; pi_Objlabel : TcxLabel; pi_ObjPrgs : TcxProgressBar; pi_ObjRichEdit : TcxRichEdit);
begin
   if pi_Flg = 0 then pi_Objlabel.Caption := pi_Msg;
   pi_ObjPrgs.Position := pi_PrgsPercent;
   pi_ObjRichEdit.Lines.BeginUpdate;
   try
      pi_ObjRichEdit.Lines.Add(pi_Msg);
   finally
      pi_ObjRichEdit.Lines.EndUpdate;
      Application.ProcessMessages;
   end;
end;

function TfrmProgress.RPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function TfrmProgress.LPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

//****************************************************************************//
//* Query 경과 시간을 구한다.
//****************************************************************************//
function TfrmProgress.fGetQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;
var
  {-- 소요시간 계산  --}
  lv_Hour, lv_Min, lv_Sec, lv_MSec : Word;
  lv_dtElp : TDateTime;
  lv_strtmp, lv_StartTime, lv_EndTime, lv_ElpTime : String;
begin
  lv_StartTime := TimeToStr( pi_StartTime );
  lv_EndTime := TimeToStr( pi_EndTime );

  lv_dtElp := pi_EndTime - pi_StartTime;
  DecodeTime( lv_dtElp, lv_Hour, lv_Min, lv_Sec, lv_MSec );

//  lv_ElpTime := LeftPad(IntToStr( lv_Hour * 60 + lv_Min ), '0', 2)  + ':'
  lv_ElpTime := LPad(IntToStr( lv_Hour), '0', 2)  + ':'
              + LPad(IntToStr( lv_Min ), '0', 2)  + ':'
              + LPad(IntToStr( lv_Sec ), '0', 2) + '.'
              + LPad(IntToStr( lv_MSec), '0', 2);

  Result := lv_ElpTime;
end;

//****************************************************************************//
//* End : User Define Function, Procedure
//****************************************************************************//

procedure TfrmProgress.cxbtn_closeClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmProgress.FormActivate(Sender: TObject);
begin
   {-- ElapsedTime을 구하기 위한 Start --}
   fv_dtStart := Now;

   Timer_Prgs.Enabled  := True;
   Timer_Prgs.Interval := 100;

   cxRichEd_ProgressLog.Clear;

   if Ntbook_Progress.PageIndex = 0 then
   begin
      case StrToInt(cxTxtEd_ProgressTypeFlg.Text) of
         0 :  // Data Parse
            begin
               Form2.HtmlParse(1, 0);
            end;
         1 :
            begin
               Form2.AddrLngLat;
            end;
         2 :
            begin
               Form2.GetAddrPost;
            end;
         3 :
            begin
               Form2.GetAirportInfo;
            end;
         4 :
            begin
               Form2.GetAirlineInfo;
            end;
      end;
   end;
end;

procedure TfrmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmProgress.FormDestroy(Sender: TObject);
begin
   frmProgress := nil;
end;

procedure TfrmProgress.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then cxbtn_closeClick(Sender);
end;

procedure TfrmProgress.Timer_frmCloseTimer(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmProgress.Timer_PrgsTimer(Sender: TObject);
begin
   cxLbl_Elapsed.Caption := 'Elapsed Time : ' + fGetQueryElapsedTime(0, fv_dtStart, Now);
end;

end.
