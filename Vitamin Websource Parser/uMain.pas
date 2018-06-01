unit uMain;

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
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, SynEdit,
  Vcl.OleCtrls, SHDocVw, cxSplitter, cxGroupBox, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Grids, AdvObj, BaseGrid, AdvGrid
  , ActiveX, MSHTML, SynEditHighlighter, SynHighlighterHtml, AdvUtil,
  IdServerIOHandler, IdSSL, IdSSLOpenSSL, cxMemo, cxRichEdit, IdCustomTCPServer,
  IdCustomHTTPServer, IdMultipartFormData, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    cxGroupBox1: TcxGroupBox;
    cxSplitter1: TcxSplitter;
    cxGroupBox2: TcxGroupBox;
    WebBrowser1: TWebBrowser;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    SynEdit1: TSynEdit;
    cxTxtEdit_Url: TcxTextEdit;
    cxButton1: TcxButton;
    AdvStringGrid1: TAdvStringGrid;
    cxButton2: TcxButton;
    cxSplitter2: TcxSplitter;
    cxButton3: TcxButton;
    SynHTMLSyn1: TSynHTMLSyn;
    cxSplitter3: TcxSplitter;
    SynEdit2: TSynEdit;
    cxButton4: TcxButton;
    Button1: TButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    cxButton10: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
  private
    { Private declarations }
    function GetAirPortPageList(pi_Url : String) : String;
    function GetAirLinePageList(pi_Url : String) : String;
    function fGetSplit(pi_Flg : Integer; pi_HeadUrl, pi_AfterUrl, pi_Str : String) : String;
  public
    { Public declarations }
    function GetHTML(w: TWebBrowser): String;
    function GetWebBrowserHTML(const WebBrowser: TWebBrowser): String;
    //****************************************************************************//
    // IdHttp를 생성하여 Url 에 대한 Text 정보를 제공.
    //****************************************************************************//
    function fGetHttpParamUrl(pi_Flg : Integer; pi_Url, pi_Param : String) : String;
    procedure ExecuteScript(doc: IHTMLDocument2; script: string; language: string) ;
  end;

var
  Form1: TForm1;

implementation
uses uDataParse;
{$R *.dfm}

function TForm1.GetHTML(w: TWebBrowser): String;
Var
  e: IHTMLElement;
begin
  Result := '';
  if Assigned(w.Document) then
  begin
     e := (w.Document as IHTMLDocument2).body;

     while e.parentElement <> nil do
     begin
       e := e.parentElement;
     end;

     Result := e.outerHTML;
  end;
end;

function TForm1.GetWebBrowserHTML(const WebBrowser: TWebBrowser): String;  {-- use ActiveX 추가 --}
var
  LStream: TStringStream;
  Stream : IStream;
  LPersistStreamInit : IPersistStreamInit;
begin
  if not Assigned(WebBrowser.Document) then exit;
  LStream := TStringStream.Create('', TEncoding.UTF8);
  try
    LPersistStreamInit := WebBrowser.Document as IPersistStreamInit;
    Stream := TStreamAdapter.Create(LStream,soReference);
    LPersistStreamInit.Save(Stream,true);
    result := LStream.DataString;
  finally
    LStream.Free();
  end;
end;

function TForm1.GetAirPortPageList(pi_Url : String) : String;
var
   lv_LoopCnt, lv_Inc : Integer;
   lv_tmpStr, lv_Url, lv_headUrl : String;
   lv_LoopFlg, lv_Chkflg : Boolean;
begin
   lv_LoopFlg := True;
   lv_Url     := pi_Url;
   lv_headUrl := 'http://www.airportal.co.kr/knowledge/airports/';
   lv_Inc     := 0;

   SynEdit2.Lines.Add(lv_Url);
   while (lv_LoopFlg) do
   begin
      SynEdit1.Lines.Clear;

      //WebBrowser1.Navigate(lv_Url, 4);
      try
         SynEdit1.Text := IdHTTP1.Get(lv_Url);

         lv_Chkflg := False;

         for lv_LoopCnt := 0 to SynEdit1.Lines.Count - 1 do
         begin
            lv_tmpStr := SynEdit1.Lines.Strings[lv_LoopCnt];
            if (Pos('src="../../images/table_prev.gif" alt="이전페이지보기" width="40" height="17"', LowerCase(lv_tmpStr)) > 0) or
               (Pos('src="http://www.airportal.go.kr/images/table_prev.gif" width=40 height=17></A></TD>', LowerCase(lv_tmpStr)) > 0)
            then
            begin
               lv_Chkflg := True;
            end;
            if (lv_Chkflg = True) and (Pos('</a></td>', LowerCase(lv_tmpStr)) > 0) then
            begin
               lv_tmpStr := fGetSplit(0, lv_headUrl, '', lv_tmpStr);
               Break;
            end;
         end;
         lv_tmpStr := SynEdit1.Lines.Strings[lv_LoopCnt+2];
         if Pos('<a href="', lv_tmpStr) > 0 then
         begin
            lv_tmpStr := Copy(lv_tmpStr, Pos('<a href="', lv_tmpStr) + 9, Length(lv_tmpStr));
            lv_tmpStr := Copy(lv_tmpStr, 1, Pos('"', lv_tmpStr) - 1);
         end else
         begin
            lv_tmpStr := Copy(lv_tmpStr, Pos('<a href=', lv_tmpStr) + 8, Length(lv_tmpStr));
            lv_tmpStr := Copy(lv_tmpStr, 1, Pos('>', lv_tmpStr) - 1);
         end;

         lv_Url    := lv_headUrl + StringReplace(lv_tmpStr, '???', '', [rfReplaceAll]);

         //SynEdit1.Text := IdHTTP1.Get(lv_Url);

         if Pos('KfMain01.jsp', lv_tmpStr) = 0 then Break;
      except
         on E : Exception do
         begin

         end;
      end;
      Inc(lv_Inc);
   end;
end;

function TForm1.GetAirLinePageList(pi_Url : String) : String;
var
   lv_LoopCnt, lv_Inc : Integer;
   lv_tmpStr, lv_Url, lv_headUrl, lv_afterUrl : String;
   lv_LoopFlg, lv_Chkflg : Boolean;
begin
   lv_LoopFlg := True;
   lv_Url     := pi_Url;
   lv_headUrl := 'http://www.airportal.go.kr/knowledge/airlines/KbAirline01.jsp?PAGENO=';
   lv_afterUrl := '&PAGEROWS=10&START=&keyword1=&keyword2=&gubun=&sortvalue=&order=&area=code&target=&search=';
   lv_Inc     := 0;

   SynEdit2.Lines.Add(lv_Url);
   while (lv_LoopFlg) do
   begin
      SynEdit1.Lines.Clear;

      //WebBrowser1.Navigate(lv_Url, 4);
      try
         SynEdit1.Text := IdHTTP1.Get(lv_Url);

         lv_Chkflg := False;

         for lv_LoopCnt := 0 to SynEdit1.Lines.Count - 1 do
         begin
            lv_tmpStr := SynEdit1.Lines.Strings[lv_LoopCnt];
            if (Pos('src="../../images/table_prev.gif" alt="이전페이지보기" width="40" height="17"', LowerCase(lv_tmpStr)) > 0) then
            begin
               lv_Chkflg := True;
            end;
            if (lv_Chkflg = True) and (Pos('</a></td>', LowerCase(lv_tmpStr)) > 0) then
            begin
               lv_tmpStr := fGetSplit(1, lv_headUrl, lv_afterUrl, lv_tmpStr);
               Break;
            end;
         end;
         lv_tmpStr := Trim(SynEdit1.Lines.Strings[lv_LoopCnt+2]);
         if Pos('<a href=''javascript:goPage(', lv_tmpStr) > 0 then
         begin
            lv_tmpStr := Copy(lv_tmpStr, Pos('<a href=''javascript:goPage(', lv_tmpStr) + 27, Length(lv_tmpStr));
            lv_tmpStr := Copy(lv_tmpStr, 1, Pos(');', lv_tmpStr) - 1);
         end else
         begin
            lv_tmpStr := '';
         end;

         lv_Url := lv_headUrl + lv_tmpStr + lv_afterUrl;

         //SynEdit1.Text := IdHTTP1.Get(lv_Url);

         if lv_tmpStr = '' then Break;
      except
         on E : Exception do
         begin

         end;
      end;
      Inc(lv_Inc);
   end;
end;

function TForm1.fGetSplit(pi_Flg : Integer; pi_HeadUrl, pi_AfterUrl, pi_Str : String) : String;
var
   lv_stlTmp : TStringList;
   lv_stlLoopCnt : Integer;
   lv_stlTmpStr : String;
begin
   lv_stlTmp := TStringList.Create;
   lv_stlTmp.StrictDelimiter := True;
   try
      ExtractStrings(  ['|']
                     , [' ']
                     , Pchar(pi_Str)
                     , lv_stlTmp
                     );
      for lv_stlLoopCnt := 0 to lv_stlTmp.Count - 1 do
      begin
         lv_stlTmpStr := Trim(lv_stlTmp.Strings[lv_stlLoopCnt]);
         case pi_Flg of
            0 :
               begin
                  lv_stlTmpStr := Copy(lv_stlTmpStr, Pos('<a href="', lv_stlTmpStr) + 9, Length(lv_stlTmpStr));
                  lv_stlTmpStr := Copy(lv_stlTmpStr, 1, Pos('"', lv_stlTmpStr) - 1);
                  if Pos('KfMain01.jsp', lv_stlTmpStr) > 0 then SynEdit2.Lines.Add(pi_HeadUrl + lv_stlTmpStr);
               end;
            1 :
               begin
                  lv_stlTmpStr := Copy(lv_stlTmpStr, Pos('<a href=''javascript:goPage(', lv_stlTmpStr) + 27, Length(lv_stlTmpStr));
                  lv_stlTmpStr := Copy(lv_stlTmpStr, 1, Pos(');', lv_stlTmpStr) - 1);
                  if lv_stlTmpStr <> '' then SynEdit2.Lines.Add(pi_HeadUrl + lv_stlTmpStr + pi_AfterUrl);
               end;
         end;
      end;
   finally
      FreeAndNil(lv_stlTmp);
   end;
   Result := lv_stlTmpStr;
end;


procedure TForm1.ExecuteScript(doc: IHTMLDocument2; script: string; language: string) ;
begin
    if doc <> nil then
    begin
      if doc.parentWindow <> nil then
        doc.parentWindow.ExecScript(script, Olevariant(language)) ;
    end;
end;


//****************************************************************************//
//* User Define Procedure, Function End
//****************************************************************************//

procedure TForm1.Button1Click(Sender: TObject);
begin
   //WebBrowser1.Navigate('javascript:document.brokerForm.action="/?menuno=2776&pageIndex=11151";document.brokerForm.submit();');
   WebBrowser1.Navigate(cxTxtEdit_Url.Text);

   while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
   begin
      Sleep(5);
      Application.ProcessMessages;
   end;

   SynEdit1.Text := (WebBrowser1.Document as IHTMLDocument2).body.innerHTML;
end;

procedure TForm1.cxButton10Click(Sender: TObject);
var
   col: IHTMLElementCollection;
   el: IHTMLInputElement;
   lv_script : String;
begin
   col := (WebBrowser1.Document as IHTMLDocument3).getElementsByName('ctl00$SPWebPartManager1$g_e3b09024_878e_4522_bd47_acfefd1000b0$ctl00$txtSearchCriteria');
   if col.length <> 0 then
   begin
      el := col.item(0, 0) as IHTMLInputElement;
      el.value := 'KE';
   end;
   //WebBrowser1.Navigate();
   lv_script := 'WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ctl00$SPWebPartManager1$g_e3b09024_878e_4522_bd47_acfefd1000b0$ctl00$butSearch", "", true, "Search", "", false, false));';
   ExecuteScript((WebBrowser1.Document as IHTMLDocument2), lv_script, 'javascript');
end;

procedure TForm1.cxButton1Click(Sender: TObject);
begin
   WebBrowser1.Navigate(cxTxtEdit_Url.Text);
end;

procedure TForm1.cxButton2Click(Sender: TObject);
begin
   SynEdit1.Text := GetHTML(WebBrowser1);
end;


procedure TForm1.cxButton3Click(Sender: TObject);
var
   lv_LoopCnt, lv_incInt : Integer;
   lv_srchStr, lv_tmpStr, lv_ParseStr1, lv_ParseStr2  : String;
   lv_LoopCheck : Boolean;
begin
   SynEdit2.Lines.Clear;

   lv_LoopCheck := True;
   lv_incInt    := 1;
   SynEdit2.Lines.BeginUpdate;
   try
      while(lv_LoopCheck) do
      begin
         WebBrowser1.Navigate('javascript:document.brokerForm.action="/?menuno=2776&pageIndex='+ IntToStr(lv_incInt) +'";document.brokerForm.submit();');
         cxButton2Click(Sender);
         lv_LoopCnt := 0;
         lv_srchStr := '<td class="t_c"><a href="';
         lv_ParseStr2 := '';
         for lv_LoopCnt := 0 to SynEdit1.Lines.Count - 1 do
         begin
            lv_tmpStr := Trim(SynEdit1.Lines.Strings[lv_LoopCnt]);
            lv_ParseStr1 := Copy(lv_tmpStr, 1, 25);
            if CompareStr(lv_ParseStr1, lv_srchStr) = 0 then
            begin
               lv_ParseStr2 := Copy(lv_tmpStr, Pos('?', lv_tmpStr)-1, Length(lv_tmpStr));
               lv_ParseStr2 := Copy(lv_ParseStr2, 1, Pos('>', lv_ParseStr2)-2);
               SynEdit2.Lines.Add('http://www.nsdi.go.kr' + lv_ParseStr2);
            end;
         end;
         if lv_ParseStr2 = '' then Break;

         Inc(lv_incInt);
      end;

   finally
      SynEdit2.Lines.EndUpdate;
   end;
end;

//****************************************************************************//
// IdHttp를 생성하여 Url 에 대한 Text 정보를 제공.
//****************************************************************************//
function TForm1.fGetHttpParamUrl(pi_Flg : Integer; pi_Url, pi_Param : String) : String;
var
   lv_IdHttp : TIdHTTP;
   lv_IdSSL  : TIdSSLIOHandlerSocketOpenSSL;
   lv_sstResponse : TBytesStream;

   lv_retVal, lv_tmpStr : String;
   //lv_tmpStl : TStringList;
   //lv_dtStart : TDateTime;
begin
   //lv_dtStart := Now();
   lv_retVal := 'SUCCESS';
   lv_IdHttp := TIdHTTP.Create(nil);
   lv_IdSSL  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
   lv_sstResponse  := TStringStream.Create(Result, TEncoding.Default.UTF8);
//   lv_tmpStl := TStringList.Create;
   try
      try
         lv_IdHttp.HandleRedirects := True;
         lv_IdHttp.IOHandler := lv_IdSSL;

         lv_IdHttp.Request.ContentType := 'application/x-www-form-urlencoded';
         lv_IdHttp.Request.CharSet     := 'utf-8';
         lv_IdHttp.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko';

         lv_IdHttp.ReadTimeout         := 10000;
         lv_IdHttp.ConnectTimeout      := 10000;
         lv_IdHttp.HTTPOptions := [hoForceEncodeParams];

         lv_IdSSL.SSLOptions.Mode := sslmClient;

         {-- URL HTML 정보를 가져온다. --}
         lv_IdHttp.Get(lv_IdHttp.URL.URLEncode(pi_Url + pi_Param), lv_sstResponse, []);
         //lv_retVal := TEncoding.UTF8.GetString(lv_sstResponse.Bytes, 0, lv_sstResponse.Size);
         lv_retVal := lv_sstResponse.ToString;
         //lv_retVal := fGetHTMLReplace(0, lv_retVal);
//         lv_tmpStl.Text := lv_retVal;
//         lv_tmpStl.SaveToFile(pb_CrawlingPath + pi_Param + '.html', TEncoding.UTF8);

      except
         on E : Exception do
         begin
            lv_retVal := 'FAIL';
            //frmMain.pSetLogging('Mr', 'DEBUG', '[GET URL SOURCE] - ERROR : ' + E.Message);
         end;
      end;
   finally
//      FreeAndNil(lv_tmpStl);
      lv_IdHttp.Disconnect;
      FreeAndNil(lv_sstResponse);
      FreeAndNil(lv_IdSSL);
      FreeAndNil(lv_IdHttp);
   end;
   Result := lv_retVal;
end;

procedure TForm1.cxButton4Click(Sender: TObject);
begin
   form2 := TForm2.Create(Self);
   with form2 do
   begin
      ShowModal;
   end;
end;

procedure TForm1.cxButton5Click(Sender: TObject);
begin
   SynEdit2.Lines.Clear;
   GetAirPortPageList('http://www.airportal.co.kr/knowledge/airports/KfMain01.jsp?df_area=&df_start=0&df_count=10&df_search_target=&df_search_keyword=&df_sort=&df_desc=&df_search_keyword2=null');
end;

procedure TForm1.cxButton6Click(Sender: TObject);
begin
   //SynEdit1.Text := IdHTTP1.Get(cxTxtEdit_Url.Text);
   SynEdit1.Text := IdHTTP1.Get(cxTxtEdit_Url.Text);
end;

procedure TForm1.cxButton7Click(Sender: TObject);
var
   lv_LoopCnt, lv_SgrdRowCnt : Integer;
begin
   form2 := TForm2.Create(Self);
   with form2 do
   begin
      lv_SgrdRowCnt := 1;
      for lv_LoopCnt := 0 to Form1.SynEdit2.Lines.Count - 1 do
      begin
         AdvStrGrd_HtmlLst.Cells[0, lv_SgrdRowCnt] := IntToStr(lv_SgrdRowCnt);
         AdvStrGrd_HtmlLst.Cells[1, lv_SgrdRowCnt] := Form1.SynEdit2.Lines.Strings[lv_LoopCnt];

         //SynEd_DBImpLog.Lines.Add(FloatToStr((lv_Sr.Size / 1024)));
         AdvStrGrd_HtmlLst.RowCount := lv_SgrdRowCnt + 1;
         Inc(lv_SgrdRowCnt);
      end;
      ShowModal;
   end;
end;

procedure TForm1.cxButton8Click(Sender: TObject);
begin
   SynEdit2.Lines.Clear;
   GetAirLinePageList('http://www.airportal.go.kr/knowledge/airlines/KbAirline01.jsp?PAGENO=1&PAGEROWS=10&START=&keyword1=&keyword2=&gubun=&sortvalue=&order=&area=code&target=&search=');
end;

procedure TForm1.cxButton9Click(Sender: TObject);
var
   aData : TStringList;
   i : Integer;
   aURL : String;
   ResultStr : String;
   ms : TMemoryStream;
   mime : TIdMultiPartFormDataStream;
begin
   ResultStr := '';
   aURL :=  'https://www.airportal.go.kr/common/login/loginproc_popup.jsp';
   //aURL :=  'https://www.airportal.go.kr/common/login/login_popup.jsp?returnpage=http://www.airportal.go.kr/knowledge/airlines/KgAirline01.jsp?area=name';
   ms := TMemoryStream.Create;
   mime := TIdMultiPartFormDataStream.Create; {-- use IdMultipartFormData 선언 --}
   aData := TStringList.Create;
   try
      // idhttp init
//      idHttp1.Host := URL;
//      idHttp.Request.Referer := URL;
      idHttp1.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT)';
      idHttp1.Request.ContentType := 'application/x-www-form-urlencoded';
      idHttp1.HandleRedirects := true;
      IdHTTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
//      IdHTTP1.Request.Connection := 'Keep-Alive';
//      IdHTTP1.Response.KeepAlive := True; // 소켓유지

      // data
      aData.Add('df_userid=dmzone75');
      aData.Add('df_passwd=dlqudgns750!');

      // data input
      idHttp1.Request.ContentType := mime.RequestContentType;
      for i := 0 to aData.Count - 1 do
        mime.AddFormField(aData.Names[i], aData.Values[aData.Names[i]]);
      mime.Position := 0;

      // post data
      idHttp1.Post(aURL, mime, ms);

      // data response
      if ms.Size > 0 then
      begin
        SetLength(ResultStr, ms.Size);
        Move(PChar(ms.Memory)^, ResultStr[1], ms.Size);
      end;

      IdHTTP1.IOHandler := nil;

      SynEdit1.Text := idhttp1.Get(cxTxtEdit_Url.Text);
      //IdHTTP1.Post('https://www.airportal.go.kr/common/login/loginproc_popup.jsp', Params);

      //fGetHttpParamUrl(0, 'https://www.airportal.go.kr/common/login/loginproc_popup.jsp?', 'df_userid=dmzone75&df_passwd=dlqudgns750!');
   finally
      aData.Free;
      ms.Free;
      mime.Free;
   end;
   //'http://www.airportal.go.kr/knowledge/airlines/KgMain01P1.jsp?df_id=6911'
   //SynEdit1.Text := IdHTTP1.Get(cxTxtEdit_Url.Text);
end;

end.
