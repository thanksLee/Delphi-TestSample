unit uDataParse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Winapi.ShlObj,
  cxShellCommon, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, cxSplitter, cxDropDownEdit, cxTextEdit, cxMaskEdit,
  cxShellComboBox, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, dxBevel, Vcl.ExtCtrls,
  SynEditHighlighter, SynHighlighterHtml, SynEdit, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, System.JSON, AdvUtil, IdServerIOHandler, IdSSL, IdSSLOpenSSL,
  Vcl.OleCtrls, SHDocVw, ActiveX, MSHTML;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    dxBevel1: TdxBevel;
    AdvStrGrd_HtmlLst: TAdvStringGrid;
    cxShellCmbBox_Html: TcxShellComboBox;
    cxSplitter1: TcxSplitter;
    opndig_Html: TOpenDialog;
    IdHTTP1: TIdHTTP;
    Panel2: TPanel;
    dxBevel2: TdxBevel;
    SynEd_FullHtmlSource: TSynEdit;
    SynHTMLSyn1: TSynHTMLSyn;
    cxSplitter2: TcxSplitter;
    SynEdit2: TSynEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Button1: TButton;
    cxButton3: TcxButton;
    IdHTTP2: TIdHTTP;
    cxButton4: TcxButton;
    SynEdit1: TSynEdit;
    cxSplitter3: TcxSplitter;
    Panel3: TPanel;
    WebBrowser1: TWebBrowser;
    Panel4: TPanel;
    cxTxtEdit_Url: TcxTextEdit;
    cxButton5: TcxButton;
    procedure cxShellCmbBox_HtmlPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure AdvStrGrd_HtmlLstDblClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //****************************************************************************//
    //* StringGrid 에 Address File 정보를 Add한다.
    //****************************************************************************//
    procedure pSet_FileSearch(pi_Flg : Integer; pi_FilePath : String; pi_SGrid : TAdvStringGrid);
    //************************************************************************//
    //* File Read
    //************************************************************************//
    procedure upUTF8ReadFile(pi_Flg : Integer; pi_Param1 : String);
    procedure upAnsiReadFile(pi_Flg : Integer; pi_Param1 : String);
    procedure HtmlParse(pi_Flg, pi_idx : Integer);
    function GetURLAsString(aURL: string): string;
    function GetLngLat(pi_Address : String) : String;
    procedure AddrLngLat;
    procedure GetAddrPost;
    procedure GetAirportInfo;
    procedure GetAirlineInfo;
    function fGet_SubUrlInfo(pi_Flg : Integer; pi_Url : String) : TArray<String>;

  end;

var
  Form2: TForm2;

implementation
uses uProgress, uMain;
{$R *.dfm}

function TForm2.GetURLAsString(aURL: string): string;
var
  lHTTP: TIdHTTP;
  lStream: TStringStream;
  lv_tmpStr : String;
begin
  lHTTP := TIdHTTP.Create(nil);
  lStream := TStringStream.Create(Result, TEncoding.Default.UTF8);
  try
    lHTTP.ReadTimeout := 0;
    lHTTP.AllowCookies := True;
    lHTTP.ProxyParams.BasicAuthentication := False;
    lHTTP.ProxyParams.ProxyPort := 0;
    lHTTP.Request.ContentLength := -1;
    lHTTP.Request.ContentRangeEnd := 0;
    lHTTP.Request.ContentRangeStart := 0;
    lHTTP.Request.ContentType := 'application/json';
    lHTTP.Request.ContentEncoding := 'utf-8';
    lHTTP.Request.Accept := 'text/html, */*';
    lHTTP.Request.BasicAuthentication := False;
    lHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
    lHTTP.HTTPOptions := [hoForceEncodeParams];
    lv_tmpStr := lHTTP.URL.URLEncode(aURL);
    //lv_tmpStr := aURL;
    //lHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    lHTTP.Get(lv_tmpStr, lStream, []);
    lStream.Position := 0;
    Result := lStream.ReadString(lStream.Size);
    //Result := TEncoding.Default.GetString(lStream.Bytes,0,lStream.Size);
  finally
    FreeAndNil(lHTTP);
    FreeAndNil(lStream);
  end;
end;

function TForm2.GetLngLat(pi_Address : String) : String;
var
   lv_tmpStr, tmp : String;
   JSONObject: TJSONObject;  // uses 절에 System.JSON 추가
   a, b, c : TJSONValue;
   lv_sltTmp : TStringList;
   i : Integer;
   lv_reVal, lv_lat, lv_lng : String;
begin

   lv_tmpStr := pi_Address;
   lv_sltTmp := TStringList.Create;
   lv_lat := '0';
   lv_lng := '0';
   try
      try
         lv_sltTmp.Text := GetURLAsString('http://maps.googleapis.com/maps/api/geocode/json?sensor=false&language=ko&address=' + lv_tmpStr);
         JSONObject := TJSONObject.ParseJSONValue(Trim(lv_sltTmp.Text)) as TJSONObject;

         if Pos('OK', lv_sltTmp.Text) > 0 then
         begin
            for i := 0 to JSONObject.Count - 1 do
            begin
               tmp := JSONObject.Get(i).ToString;
               a := JSONObject.Get('results').JsonValue;
               b := TJSONObject(TJSONArray(a).Get(0)).Get('geometry').JsonValue;
               c := TJSONObject(b).Get('location').JsonValue;
               lv_lat := TJSONObject(c).Get('lat').JsonValue.Value;
               lv_lng := TJSONObject(c).Get('lng').JsonValue.Value;
               break;
            end;
         end;
      except
         on e : Exception do
         begin
            //showmessage(e.Message);
         end;
      end;
   finally
      lv_reVal := lv_lat + '^^^' + lv_lng;
      JSONObject.Free;
      lv_sltTmp.Free;
   end;
   Result := lv_reVal;
end;

procedure TForm2.AddrLngLat;
var
   lv_LoopCnt, lv_LineCount : Integer;
   lv_tmpStr  : String;
begin
   lv_LineCount := SynEd_FullHtmlSource.Lines.Count;
   SynEdit2.Lines.Clear;
   SynEdit2.Lines.BeginUpdate;
   try
      for lv_LoopCnt := 0 to SynEd_FullHtmlSource.Lines.Count - 1 do
      begin
         try
            lv_tmpStr := Trim(SynEd_FullHtmlSource.Lines.Strings[lv_LoopCnt]);
            if lv_tmpStr <> '' then
            begin
               SynEdit2.Lines.Add(lv_tmpStr + '^^^' + GetLngLat(lv_tmpStr));
            end else
            begin
               SynEdit2.Lines.Add(lv_tmpStr);
            end;
         except
            on e : Exception do
            begin

            end;
         end;
         with frmProgress do
         begin
            cxPgBar_Progress.Position := ((lv_LoopCnt-1) * 100) / lv_LineCount;
            //frmUploadMng.cxProgressBar_SaveFile.Position := (lv_iLoopCnt * 100) div lv_EndRow
            Application.ProcessMessages;
         end;
         Sleep(30);
      end;
   finally
      SynEdit2.Lines.EndUpdate;
      frmProgress.Timer_frmClose.Enabled := True;
      frmProgress.Timer_frmClose.Interval := 100;
   end;

end;

procedure TForm2.GetAddrPost;
var
   lv_LoopCnt, lv_LineCount : Integer;
   lv_tmpStr, lv_tmpAddr, lv_tmpPost : String;
   lv_stlTmp : TStringList;
begin
   lv_stlTmp := TStringList.Create;
   lv_stlTmp.StrictDelimiter := True;

   lv_LineCount := SynEd_FullHtmlSource.Lines.Count;
   SynEdit2.Lines.Clear;
   SynEdit2.Lines.BeginUpdate;
   try
      for lv_LoopCnt := 0 to SynEd_FullHtmlSource.Lines.Count - 1 do
      begin
         try
            lv_stlTmp.Clear;
            lv_tmpAddr := '';
            lv_tmpPost := '';

            lv_tmpStr := SynEd_FullHtmlSource.Lines.Strings[lv_LoopCnt];
            lv_stlTmp.Text := Form1.fGetHttpParamUrl(0,'https://search.naver.com/search.naver?query=', lv_tmpStr);
            if Pos('<div class="local_name nomore"> <h3>', lv_stlTmp.Text) > 0 then
            begin
               lv_tmpStr := Copy(lv_stlTmp.Text, Pos('<div class="local_name nomore"> <h3>', lv_stlTmp.Text) + 36, Length(lv_stlTmp.Text));
               lv_tmpAddr := Trim(Copy(lv_tmpStr, 1, Pos('</h3>', lv_tmpStr) - 1));
               lv_tmpPost := Copy(lv_tmpStr, Pos('(우)</span>', lv_tmpStr) + 10, Length(lv_tmpStr));
               if Pos('</p>', Copy(lv_tmpPost, 1, 15)) > 0 then
               begin
                  lv_tmpPost := Trim(Copy(lv_tmpPost, 1, Pos('</p>', lv_tmpPost) - 1));
               end else
               begin
                  lv_tmpPost := Trim(Copy(lv_tmpPost, 1, Pos('<span', lv_tmpPost) - 1));
               end;

            end else
            begin
               lv_tmpAddr := lv_tmpStr;
               lv_tmpPost := '';
            end;

            SynEdit2.Lines.Add(lv_tmpAddr + '^^^' + lv_tmpPost);

         except
            on E : Exception do
            begin

            end;
         end;
         with frmProgress do
         begin
            cxPgBar_Progress.Position := ((lv_LoopCnt-1) * 100) / lv_LineCount;
            //frmUploadMng.cxProgressBar_SaveFile.Position := (lv_iLoopCnt * 100) div lv_EndRow
            Application.ProcessMessages;
         end;
      end;
   finally
      FreeAndNil(lv_stlTmp);
      SynEdit2.Lines.EndUpdate;
      frmProgress.Timer_frmClose.Enabled := True;
      frmProgress.Timer_frmClose.Interval := 100;
   end;

end;

procedure TForm2.GetAirportInfo;
var
   lv_GridLoopCnt, lv_GridTotCnt, lv_LoopCnt : Integer;
   lv_tmpUrl, lv_tmpStr, lv_tmpKrNm, lv_tmpUsNm, lv_tmpLineStr : String;
   lv_bChk : Boolean;
begin
   lv_GridTotCnt := AdvStrGrd_HtmlLst.RowCount;

   SynEdit2.Lines.BeginUpdate;
   try
      for lv_GridLoopCnt := 1 to lv_GridTotCnt - 1 do
      begin
         lv_bChk := False;
         lv_tmpUrl := AdvStrGrd_HtmlLst.Cells[1, lv_GridLoopCnt];
         try
            SynEd_FullHtmlSource.Text := IdHTTP2.Get(lv_tmpUrl);

            for lv_LoopCnt := 0 to SynEd_FullHtmlSource.Lines.Count - 1 do
            begin
               lv_tmpStr := Trim(SynEd_FullHtmlSource.Lines.Strings[lv_LoopCnt]);

               if Pos('<td width="271" TITLE="', lv_tmpStr) > 0 then
               begin
                  lv_bChk := True;
               end else if Pos('<td height="44" colspan="7">', lv_tmpStr) > 0 then Break;

               if lv_bChk = True then
               begin
                  {-- 공항  추출 --}
                  if Pos('<td width="271" TITLE="', lv_tmpStr) > 0 then
                  begin
                     lv_tmpKrNm := Copy(lv_tmpStr, Pos('<td width="271" TITLE="', lv_tmpStr) + 23, Length(lv_tmpStr));
                     lv_tmpKrNm := Copy(lv_tmpKrNm, 1, Pos('"', lv_tmpKrNm) - 1);

                     lv_tmpUsNm := Copy(lv_tmpStr, Pos(');">', lv_tmpStr) + 4, Length(lv_tmpStr));
                     lv_tmpUsNm := Copy(lv_tmpUsNm, 1, Pos('</', lv_tmpUsNm) - 1);

                     lv_tmpLineStr := lv_tmpKrNm + '^' + lv_tmpUsNm;

                     Continue;
                  end;

                  {-- IATA, ICAO 추출 --}
                  if Pos('<td width="50" align="center">', lv_tmpStr) > 0 then
                  begin
                     lv_tmpKrNm := Copy(lv_tmpStr, Pos('<td width="50" align="center">', lv_tmpStr) + 30, Length(lv_tmpStr));
                     lv_tmpKrNm := Copy(lv_tmpKrNm, 1, Pos('</', lv_tmpKrNm) - 1);

                     lv_tmpLineStr := lv_tmpLineStr + '^' + lv_tmpKrNm;

                     Continue;
                  end;

                  {-- 국가 추출 --}
                  if Pos('<td width="111" align="left" TITLE="', lv_tmpStr) > 0 then
                  begin
                     lv_tmpKrNm := Copy(lv_tmpStr, Pos('<td width="111" align="left" TITLE="', lv_tmpStr) + 36, Length(lv_tmpStr));
                     lv_tmpKrNm := Copy(lv_tmpKrNm, 1, Pos('"', lv_tmpKrNm) - 1);

                     lv_tmpUsNm := Copy(lv_tmpStr, Pos('">', lv_tmpStr) + 2, Length(lv_tmpStr));
                     lv_tmpUsNm := Copy(lv_tmpUsNm, 1, Pos('<', lv_tmpUsNm) - 1);

                     lv_tmpLineStr := lv_tmpLineStr + '^' + lv_tmpKrNm + '^' + lv_tmpUsNm;

                     Continue;
                  end;

                  {-- 도시 추출 --}
                  if Pos('<td width="119" align="left" TITLE=', lv_tmpStr) > 0 then
                  begin
                     lv_tmpKrNm := Copy(lv_tmpStr, Pos('<td width="119" align="left" TITLE="', lv_tmpStr) + 36, Length(lv_tmpStr));
                     lv_tmpKrNm := Copy(lv_tmpKrNm, 1, Pos('"', lv_tmpKrNm) - 1);

                     lv_tmpUsNm := Copy(lv_tmpStr, Pos('">', lv_tmpStr) + 2, Length(lv_tmpStr));
                     lv_tmpUsNm := Copy(lv_tmpUsNm, 1, Pos('<', lv_tmpUsNm) - 1);

                     lv_tmpLineStr := lv_tmpLineStr + '^' + lv_tmpKrNm + '^' + lv_tmpUsNm;

                     SynEdit2.Lines.Add(lv_tmpLineStr);
                  end;
               end;
            end;

         except
            on E : Exception do
            begin

            end;
         end;

         with frmProgress do
         begin
            cxPgBar_Progress.Position := ((lv_GridLoopCnt+1) * 100) / lv_GridTotCnt;
            Application.ProcessMessages;
         end;
         Sleep(30);
      end;

   finally
      SynEdit2.Lines.EndUpdate;
      frmProgress.Timer_frmClose.Enabled := True;
      frmProgress.Timer_frmClose.Interval := 100;
   end;
end;

procedure TForm2.GetAirlineInfo;
var
   lv_GridLoopCnt, lv_GridTotCnt, lv_LoopCnt : Integer;
   lv_tmpUrl, lv_tmpStr, lv_tmpKrNm, lv_tmpUsNm, lv_tmpLineStr : String;
   lv_bChk : Boolean;
   lv_reArryVal : TArray<String>;
begin
   lv_GridTotCnt := AdvStrGrd_HtmlLst.RowCount;

   SynEdit2.Lines.BeginUpdate;
   try
      for lv_GridLoopCnt := 1 to lv_GridTotCnt - 1 do
      begin
         lv_bChk := False;
         lv_tmpUrl := AdvStrGrd_HtmlLst.Cells[1, lv_GridLoopCnt];
         try
            SynEd_FullHtmlSource.Text := IdHTTP2.Get(lv_tmpUrl);

            for lv_LoopCnt := 0 to SynEd_FullHtmlSource.Lines.Count - 1 do
            begin
               lv_tmpStr := Trim(SynEd_FullHtmlSource.Lines.Strings[lv_LoopCnt]);

               if Pos('/upload/directory/airline/icon/', lv_tmpStr) > 0 then
               begin
                  lv_bChk := True;
               end else if Pos('<td height="1" colspan="7" bgcolor="E5E6E6"></td>', lv_tmpStr) > 0 then Break;

               if lv_bChk = True then
               begin
                  {-- 실항공사 여부 --}
                  if Pos('/upload/directory/airline/icon/', lv_tmpStr) > 0 then
                  begin
                     if Pos('"/upload/directory/airline/icon/"', lv_tmpStr) > 0 then
                     begin
                        lv_tmpKrNm := '0';
                     end else
                     begin
                        lv_tmpKrNm := '1';
                     end;

                     lv_tmpLineStr := lv_tmpKrNm;

                     Continue;
                  end;

                  {-- 항공사명  추출 --}
                  if Pos('javascript:PopContent', lv_tmpStr) > 0 then
                  begin
                     lv_tmpKrNm := Copy(lv_tmpStr, Pos('javascript:PopContent(''', lv_tmpStr) + 23, Length(lv_tmpStr));
                     lv_tmpKrNm := Copy(lv_tmpKrNm, 1, Pos(''');>', lv_tmpKrNm) - 1);
                     //https://www.airportal.go.kr/common/login/login_popup.jsp

                     lv_reArryVal := fGet_SubUrlInfo(1, 'http://www.airportal.go.kr/knowledge/airlines/KgMain01P1.jsp?df_id=' + lv_tmpKrNm);

                     if lv_reArryVal[0] = 'SUCCESS' then
                     begin
                        lv_tmpUsNm := lv_reArryVal[1];  // 영문 항공사 명
                        lv_tmpKrNm := lv_reArryVal[2];  // 국문 항공사 명
                     end;

//                     lv_tmpUsNm := Copy(lv_tmpStr, Pos(');>', lv_tmpStr) + 3, Length(lv_tmpStr));
//                     lv_tmpUsNm := Copy(lv_tmpUsNm, 1, Pos('</', lv_tmpUsNm) - 1);

                     lv_tmpLineStr := lv_tmpLineStr + '^' + lv_tmpKrNm + '^' + lv_tmpUsNm + '^' + lv_reArryVal[3] + '^' + lv_reArryVal[4]+ '^' + lv_reArryVal[5];
                     Continue;
                  end;

                  {-- IATA 추출 --}
                  if Pos('<td width="50"  align="center"><a href=>', lv_tmpStr) > 0 then
                  begin
                     lv_tmpKrNm := Copy(lv_tmpStr, Pos('<td width="50"  align="center"><a href=>', lv_tmpStr) + 40, Length(lv_tmpStr));
                     lv_tmpKrNm := Copy(lv_tmpKrNm, 1, Pos('</', lv_tmpKrNm) - 1);

                     lv_tmpLineStr := lv_tmpLineStr + '^' + lv_tmpKrNm;

                     Continue;
                  end;

                  {-- ICAO 추출 --}
                  if Pos('<td width="50"  align="center"><a href=#>', lv_tmpStr) > 0 then
                  begin
                     lv_tmpKrNm := Copy(lv_tmpStr, Pos('<td width="50"  align="center"><a href=#>', lv_tmpStr) + 41, Length(lv_tmpStr));
                     lv_tmpKrNm := Copy(lv_tmpKrNm, 1, Pos('</', lv_tmpKrNm) - 1);

                     lv_tmpLineStr := lv_tmpLineStr + '^' + lv_tmpKrNm;

//                     Continue;

                     SynEdit2.Lines.Add(lv_tmpLineStr);
                  end;

                  {-- 국가 추출 --}
//                  if Pos('<td width="121" align="left"><a href=#>', lv_tmpStr) > 0 then
//                  begin
//                     lv_tmpKrNm := Copy(lv_tmpStr, Pos('<td width="121" align="left"><a href=#>', lv_tmpStr) + 39, Length(lv_tmpStr));
//                     lv_tmpKrNm := Copy(lv_tmpKrNm, 1, Pos('</', lv_tmpKrNm) - 1);
//
//                     lv_tmpLineStr := lv_tmpLineStr + '^' + lv_tmpKrNm;
//
//                     SynEdit2.Lines.Add(lv_tmpLineStr);
//                     break;
//                  end;
               end;
            end;

         except
            on E : Exception do
            begin

            end;
         end;

         with frmProgress do
         begin
            cxPgBar_Progress.Position := ((lv_GridLoopCnt+1) * 100) / lv_GridTotCnt;
            Application.ProcessMessages;
         end;
         Sleep(30);
      end;

   finally
      SynEdit2.Lines.EndUpdate;
      frmProgress.Timer_frmClose.Enabled := True;
      frmProgress.Timer_frmClose.Interval := 100;
   end;
end;

function TForm2.fGet_SubUrlInfo(pi_Flg : Integer; pi_Url : String) : TArray<String>;
var
   lv_LoopCnt : Integer;
   lv_tmpStr, lv_tmpSubStr, lv_tmpUs, lv_tmpKr : String;
   lv_reArrVal : TArray<String>;  // 0 : 은 성공 여부
   lv_bCheck : Boolean;
begin
   SetLength(lv_reArrVal, 6);
   lv_reArrVal[0] := 'SUCCESS';
   try
      WebBrowser1.Navigate(pi_Url);
      while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
      begin
         Sleep(5);
          Application.ProcessMessages;
      end;
      SynEdit1.Text := (WebBrowser1.Document as IHTMLDocument2).body.innerHTML; {-- Use 절에 ActiveX, MSHTML 추가}

      //SynEdit1.Text := Form1.GetHTML(WebBrowser1);

      lv_bCheck := False;
      for lv_LoopCnt := 0 to SynEdit1.Lines.Count - 1 do
      begin
         lv_tmpStr := Trim(SynEdit1.Lines.Strings[lv_LoopCnt]);
         {-- 항공사 명을 구하기 위함 --}
         if Pos('<TABLE cellSpacing=0 cellPadding=0 width=636 border=0>', lv_tmpStr) > 0 then
         begin
            lv_bCheck := True;
            Continue;
         end;

         lv_tmpUs := '';
         lv_tmpKr := '';
         if (lv_bCheck = True) and (Pos('<TD vAlign=top width=541>', lv_tmpStr) > 0) then
         begin
            lv_tmpUs := Copy(lv_tmpStr, Pos('<TD vAlign=top width=541>', lv_tmpStr) + 25, Length(lv_tmpStr));
            lv_tmpUs := Trim(Copy(lv_tmpUs, 1, Pos('<', lv_tmpUs) - 1));

            if Pos('<BR>', lv_tmpStr) > 0 then
            begin
               lv_tmpKr := Copy(lv_tmpStr, Pos('<BR>', lv_tmpStr) + 4, Length(lv_tmpStr));
               lv_tmpKr := Trim(Copy(lv_tmpKr, 1, Pos('<', lv_tmpKr) - 1));
            end;

            lv_reArrVal[1] := lv_tmpUs;
            lv_reArrVal[2] := lv_tmpKr;

            lv_bCheck := False;  {-- 초기화 --}
         end;

         {-- 운항 형태를 구하기 위함 --}
         if Pos('<TD width=50>- ICAO</TD>', lv_tmpStr) > 0 then
         begin
            lv_bCheck := True;
            Continue;
         end;

         lv_tmpUs := '';
         lv_tmpKr := '';
         if (lv_bCheck = True) and (Pos('<TD vAlign=top width=311>', lv_tmpStr) > 0) then
         begin
            lv_tmpUs := Copy(lv_tmpStr, Pos('<TD vAlign=top width=311>', lv_tmpStr) + 25, Length(lv_tmpStr));
            lv_tmpUs := Trim(Copy(lv_tmpUs, 1, Pos('<', lv_tmpUs) - 1));

            lv_reArrVal[3] := lv_tmpUs;

            lv_bCheck := False;  {-- 초기화 --}
         end;

         if Pos('<TD><STRONG>국가</STRONG></TD>', lv_tmpStr) > 0 then
         begin
            lv_bCheck := True;
            Continue;
         end;

         {-- 국가를 구하기 위함 --}
         lv_tmpUs := '';
         lv_tmpKr := '';
         if (lv_bCheck = True) and (Pos('<TD vAlign=top>&nbsp;</TD>', lv_tmpStr) > 0) then
         begin
            lv_tmpSubStr := Trim(SynEdit1.Lines.Strings[lv_LoopCnt+1]);

            if Pos('<BR>', lv_tmpSubStr) > 0 then
            begin
               lv_tmpUs := Copy(lv_tmpSubStr, Pos('>', lv_tmpSubStr) + 1, Length(lv_tmpSubStr));
               lv_tmpUs := Trim(Copy(lv_tmpUs, 1, Pos('<BR>', lv_tmpSubStr) - 1));

               lv_tmpKr := Copy(lv_tmpSubStr, Pos('<BR>', lv_tmpSubStr) + 4, Length(lv_tmpSubStr));
               lv_tmpKr := Trim(Copy(lv_tmpKr, 1, Pos('<', lv_tmpKr) - 1));
            end else
            begin
               lv_tmpSubStr := StringReplace(lv_tmpSubStr, '&nbsp;/&nbsp;', '<BR>', [rfReplaceAll]);
               lv_tmpUs := Copy(lv_tmpSubStr, Pos('>', lv_tmpSubStr) + 1, Length(lv_tmpSubStr));
               lv_tmpUs := Trim(Copy(lv_tmpUs, 1, Pos('<BR>', lv_tmpUs) - 1));

               lv_tmpKr := Copy(lv_tmpSubStr, Pos('<BR>', lv_tmpSubStr) + 4, Length(lv_tmpSubStr));
               lv_tmpKr := Trim(Copy(lv_tmpKr, 1, Pos('<', lv_tmpKr) - 1));
            end;

            lv_reArrVal[4] := lv_tmpUs;
            lv_reArrVal[5] := lv_tmpKr;

            lv_bCheck := False;  {-- 초기화 --}
         end;
      end;

   except
      on E : Exception do
      begin
         lv_reArrVal[0] := 'FAIL';
      end;
   end;
   Result := lv_reArrVal;
end;

//****************************************************************************//
//* StringGrid 에 Address File 정보를 Add한다.
//****************************************************************************//
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   SynEd_FullHtmlSource.Lines.Clear;
   SynEdit2.Lines.Clear;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
   Form2 := nil;
end;

procedure TForm2.pSet_FileSearch(pi_Flg : Integer; pi_FilePath : String; pi_SGrid : TAdvStringGrid);
var
  lv_Sr : TSearchRec;
  lv_SgrdRowCnt : Integer;
  lv_Flg : String;
begin
  pi_SGrid.Clear;
  pi_SGrid.Cells[0, 0] := '#No';
  pi_SGrid.Cells[1, 0] := 'Html File Name';

  lv_SgrdRowCnt := 1;
  if FindFirst(pi_FilePath + '\*.html', faAnyFile, lv_Sr) = 0 then
  begin
    repeat
      if (lv_Sr.Attr <> faDirectory) then
      begin
         AdvStrGrd_HtmlLst.Cells[0, lv_SgrdRowCnt] := IntToStr(lv_SgrdRowCnt);
         AdvStrGrd_HtmlLst.Cells[1, lv_SgrdRowCnt] := lv_Sr.Name;

         //SynEd_DBImpLog.Lines.Add(FloatToStr((lv_Sr.Size / 1024)));
         AdvStrGrd_HtmlLst.RowCount := lv_SgrdRowCnt + 1;
         Inc(lv_SgrdRowCnt);
      end;
    until FindNext(lv_Sr) <> 0;
    FindClose(lv_Sr);
  end;
  if (pi_SGrid.RowCount > 1) then pi_SGrid.FixedRows := 1;
end;

//************************************************************************//
//* File Read
//************************************************************************//
procedure TForm2.upUTF8ReadFile(pi_Flg : Integer; pi_Param1 : String);
var
   lv_fileStream : TFileStream;
   lv_TmpFile : TStreamReader;
   lv_TmpStr  : String;
   lv_LoopCnt, i, lv_ReadTotal : Integer;
   lv_sDate : TDateTime;
   lv_bExcept : Boolean;
begin
   lv_bExcept := False;

   SynEd_FullHtmlSource.Lines.BeginUpdate;

   lv_fileStream := TFileStream.Create(pi_Param1, fmOpenRead or fmShareDenyNone);
   lv_TmpFile := TStreamReader.Create(lv_fileStream, TEncoding.UTF8, True);
   try
      try
         lv_LoopCnt := 0;
         i := 0;
         lv_sDate := Now;
         case pi_Flg of
            0 :  // 최초 생성시 or Refresh 시 사용
               begin
                  SynEd_FullHtmlSource.Lines.Clear;

                  while (not lv_TmpFile.EndOfStream) do
                  begin
                     //* 현재 읽어들인 내용보다 클 경우.
                     lv_TmpStr := lv_TmpFile.ReadLine;
                     SynEd_FullHtmlSource.Lines.Add(lv_TmpStr);
                  end;
               end;
         end;
      except
        on E : Exception do
        begin
           lv_bExcept := True;
           //pSetLogging('ERROR', E.Message);
        end;
      end;
   finally
      lv_TmpFile.Free;
      lv_fileStream.Free;
      SynEd_FullHtmlSource.Lines.EndUpdate;

      {-- Ansi Read --}
      if lv_bExcept = True then
      begin
         //upReadFile(0, pi_Param1);
         upAnsiReadFile(pi_Flg, pi_Param1);
      end;

      if pi_Flg = 1 then
         SynEd_FullHtmlSource.GotoLineAndCenter(SynEd_FullHtmlSource.Lines.Count);
   end;
end;

procedure TForm2.upAnsiReadFile(pi_Flg : Integer; pi_Param1 : String);
var
   lv_fileStream : TFileStream;
   lv_TmpFile : TStreamReader;
   lv_TmpStr  : String;
   lv_LoopCnt, i, lv_ReadTotal : Integer;
   lv_sDate : TDateTime;
   lv_bExcept : Boolean;
begin
   lv_bExcept := False;

   SynEd_FullHtmlSource.Lines.BeginUpdate;

   if pi_Flg = 0 then SynEd_FullHtmlSource.Lines.Clear;

   lv_fileStream := TFileStream.Create(pi_Param1, fmOpenRead or fmShareDenyNone);
   lv_TmpFile := TStreamReader.Create(lv_fileStream, TEncoding.Default);
   try
      try
         lv_LoopCnt := 0;
         i := 0;
         lv_sDate := Now;
         case pi_Flg of
            0 :
               begin
                  while (not lv_TmpFile.EndOfStream) do
                  begin
                     //* 현재 읽어들인 내용보다 클 경우.
                     lv_TmpStr := lv_TmpFile.ReadLine;
                     SynEd_FullHtmlSource.Lines.Add(lv_TmpStr);
                  end;
               end;
            1 :
               begin
                  while (not lv_TmpFile.EndOfStream) do
                  begin
                     //* 현재 읽어들인 내용보다 클 경우.
                     lv_TmpStr := lv_TmpFile.ReadLine;
                     if ((lv_ReadTotal - 1) < lv_LoopCnt) then
                     begin
                        SynEd_FullHtmlSource.Lines.Add(lv_TmpStr);
                     end;
                  end;
               end;
         end;
      except
        on E : Exception do
        begin
           lv_bExcept := True;
           //pSetLogging('ERROR', E.Message);
        end;
      end;
   finally
      lv_TmpFile.Free;
      lv_fileStream.Free;
      SynEd_FullHtmlSource.Lines.EndUpdate;
   end;
end;

procedure TForm2.HtmlParse(pi_Flg, pi_idx : Integer);
var
   lv_GridTotCnt, lv_GridLoopCnt, lv_LoopCnt, lv_TrCnt : Integer;
   lv_tmpStr, lv_tmpParse1, lv_tmpParse2, lv_strMerge : String;
   lv_bCheck : Boolean;
begin
   case pi_Flg of
      0 :
         begin
            lv_GridTotCnt := 2;
         end;
      1 :
         begin
            lv_GridTotCnt := AdvStrGrd_HtmlLst.RowCount;
         end;
   end;
   SynEd_FullHtmlSource.Lines.BeginUpdate;
   SynEdit2.Lines.BeginUpdate;
   for lv_GridLoopCnt := 1 to lv_GridTotCnt - 1 do
   begin
      case pi_Flg of
         0 :
            begin
               upUTF8ReadFile(0, cxShellCmbBox_Html.Text + '\' + AdvStrGrd_HtmlLst.Cells[1, pi_idx]);
            end;
         1 :
            begin
               upUTF8ReadFile(0, cxShellCmbBox_Html.Text + '\' + AdvStrGrd_HtmlLst.Cells[1, lv_GridLoopCnt]);
            end;
      end;
      lv_bCheck := False;
      lv_TrCnt  := 0;
      lv_strMerge := '';
      for lv_LoopCnt := 0 to SynEd_FullHtmlSource.Lines.Count - 1 do
      begin
         try
            lv_tmpStr := Trim(SynEd_FullHtmlSource.Lines.Strings[lv_LoopCnt]);
            if CompareStr(lv_tmpStr, '<table class="bl_write2">') = 0 then
            begin
               lv_bCheck := True;
               lv_TrCnt  := 0;
               lv_strMerge := '';
            end;

            if (lv_bCheck = True) then
            begin
               if (CompareStr(lv_tmpStr, '</table>') = 0) then
               begin
                  lv_bCheck := False;
                  Break;
               end else
               begin
                  case lv_TrCnt of
                     2, 4, 6 :
                     begin
                        lv_tmpParse1 := Trim(Copy(lv_tmpStr, Pos('>', lv_tmpStr)+1, Length(lv_tmpStr)));
                        lv_tmpParse2 := Trim(Copy(lv_tmpParse1, 1, Pos('<', lv_tmpParse1)-1));
                        if lv_tmpParse2 <> '' then
                        begin
                           lv_strMerge  := lv_strMerge + '^^^' + lv_tmpParse2;
                           if (lv_TrCnt = 4) and (Pos('colspan="2">', lv_tmpStr) > 0) then
                           begin
                              //lv_strMerge := lv_strMerge + '^^^' + GetLngLat(lv_tmpParse2);
                           end;
                        end;
                     end;
                  end;

                  if CompareStr(lv_tmpStr, '<tr>') = 0 then Inc(lv_TrCnt);
               end;
            end;

         except
            on e : exception do
            begin

            end;

         end;
     end;
      SynEdit2.Lines.Add(lv_strMerge);
      case pi_Flg of
         1 :
            begin
               with frmProgress do
               begin
                  cxPgBar_Progress.Position := ((lv_GridLoopCnt-1) * 100) / lv_GridTotCnt;
                  //frmUploadMng.cxProgressBar_SaveFile.Position := (lv_iLoopCnt * 100) div lv_EndRow
                  Application.ProcessMessages;
               end;
            end;
      end;
   end;
   case pi_Flg of
      1 :
         begin
            frmProgress.Timer_frmClose.Enabled := True;
            frmProgress.Timer_frmClose.Interval := 100;
         end;
   end;
   SynEd_FullHtmlSource.Lines.EndUpdate;
   SynEdit2.Lines.EndUpdate;
end;

procedure TForm2.AdvStrGrd_HtmlLstDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
   upUTF8ReadFile(0, cxShellCmbBox_Html.Text + '\' + AdvStrGrd_HtmlLst.Cells[1, ARow]);
   HtmlParse(0, ARow);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
   frmProgress := TfrmProgress.Create(Self);
   with frmProgress do
   begin
      cxLbl_Elapsed.Caption      := 'Elapsed Time : 00:00:00.00';
      cxGrpBox_Progress1.Caption := 'Data 처리 중에 있습니다. 잠시만 기다려 주세요.!!';
      Ntbook_Progress.PageIndex := 0;
      {-- DB Connection Progress --}
      cxTxtEd_ProgressTypeFlg.Text := '2';
      Width  := 460;
      Height := 412;
      ShowModal;
   end;
end;

procedure TForm2.cxButton1Click(Sender: TObject);
begin
   frmProgress := TfrmProgress.Create(Self);
   with frmProgress do
   begin
      cxLbl_Elapsed.Caption      := 'Elapsed Time : 00:00:00.00';
      cxGrpBox_Progress1.Caption := 'Data 처리 중에 있습니다. 잠시만 기다려 주세요.!!';
      Ntbook_Progress.PageIndex := 0;
      {-- DB Connection Progress --}
      cxTxtEd_ProgressTypeFlg.Text := '0';
      Width  := 460;
      Height := 412;
      ShowModal;
   end;

end;

procedure TForm2.cxButton2Click(Sender: TObject);
begin
   frmProgress := TfrmProgress.Create(Self);
   with frmProgress do
   begin
      cxLbl_Elapsed.Caption      := 'Elapsed Time : 00:00:00.00';
      cxGrpBox_Progress1.Caption := 'Data 처리 중에 있습니다. 잠시만 기다려 주세요.!!';
      Ntbook_Progress.PageIndex := 0;
      {-- DB Connection Progress --}
      cxTxtEd_ProgressTypeFlg.Text := '1';
      Width  := 460;
      Height := 412;
      ShowModal;
   end;
end;

procedure TForm2.cxButton3Click(Sender: TObject);
begin
   frmProgress := TfrmProgress.Create(Self);
   with frmProgress do
   begin
      cxLbl_Elapsed.Caption      := 'Elapsed Time : 00:00:00.00';
      cxGrpBox_Progress1.Caption := 'Data 처리 중에 있습니다. 잠시만 기다려 주세요.!!';
      Ntbook_Progress.PageIndex := 0;
      {-- DB Connection Progress --}
      cxTxtEd_ProgressTypeFlg.Text := '3';
      Width  := 460;
      Height := 412;
      ShowModal;
   end;

end;

procedure TForm2.cxButton4Click(Sender: TObject);
begin
   frmProgress := TfrmProgress.Create(Self);
   with frmProgress do
   begin
      cxLbl_Elapsed.Caption      := 'Elapsed Time : 00:00:00.00';
      cxGrpBox_Progress1.Caption := 'Data 처리 중에 있습니다. 잠시만 기다려 주세요.!!';
      Ntbook_Progress.PageIndex := 0;
      {-- DB Connection Progress --}
      cxTxtEd_ProgressTypeFlg.Text := '4';
      Width  := 460;
      Height := 412;
      ShowModal;
   end;
end;

procedure TForm2.cxButton5Click(Sender: TObject);
begin
   WebBrowser1.Navigate(cxTxtEdit_Url.Text);
end;

procedure TForm2.cxShellCmbBox_HtmlPropertiesEditValueChanged(Sender: TObject);
begin
   pSet_FileSearch(0, cxShellCmbBox_Html.Path, AdvStrGrd_HtmlLst);
end;

end.
