unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls,
  Vcl.ComCtrls, MSHTML;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Button2: TButton;
    RichEdit1: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  pv_LoopCnt : Integer;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Doc : IHTMLDocument3;
  lv_Langbtn, lv_Langbtn1 : IHTMLElement;
  Coll : IHTMLElementCollection;
  I : Integer;
  lv_div: IHTMLDivElement;
  tmpStr : String;
  tmpLeftBoolean, tmpRightBoolean : Boolean;

  doc2 : IHTMLDocument2;
begin
   //http://bloodguy.tistory.com/entry/Delphi-HTML-%ED%8E%98%EC%9D%B4%EC%A7%80%EC%9D%98-%ED%83%9C%EA%B7%B8-%EC%82%AC%EC%9D%B4%EB%A5%BC-%EC%9C%A0%EB%9E%91%ED%95%98%EA%B8%B0

   pv_LoopCnt := 0;
   WebBrowser1.Navigate('https://translate.google.co.kr/');

   while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
   begin
      Sleep(5);
      Application.ProcessMessages;
   end;

//   if Supports(WebBrowser1.Document, IHTMLDocument3, Doc) and
//        Supports(Doc.getElementById('sugg-item-en'), IHTMLElement, lv_Langbtn) then
//   begin
//      lv_Langbtn.click;
//   end;

   doc2 := WebBrowser1.Document as IHTMLDocument2;

   tmpLeftBoolean := False;
   tmpRightBoolean := False;
   for I := 0 to doc2.all.length - 1 do
   begin

      lv_Langbtn := doc2.all.item(I, 0) as IHTMLElement;

      if (LowerCase(lv_Langbtn.tagName) = 'div') and (lv_Langbtn.id = 'gt-lang-left') then
      begin
         tmpLeftBoolean := True;
         Continue;
      end;
      if (tmpLeftBoolean = True) and (lv_Langbtn.id = 'sugg-item-en')  then
      begin
         lv_Langbtn.click;
         tmpLeftBoolean := False;
      end;

      if (LowerCase(lv_Langbtn.tagName) = 'div') and (lv_Langbtn.id = 'gt-lang-right') then
      begin
         tmpRightBoolean := True;
         Continue;
      end;

      if (tmpRightBoolean = True) and (lv_Langbtn.id = 'sugg-item-ko')  then
      begin
         lv_Langbtn.click;
         Break;
      end;

   end;


   //WebBrowser1.OleObject.Document.getElementByID('source').Value:='apartment - n. a usually rented room or set of rooms that is part of a building and is used as a place to live. She lives in an apartment.';
   WebBrowser1.OleObject.Document.getElementByID('source').Value:=RichEdit1.Text;
   //WebBrowser1.OleObject.Document.getElementByID('source').Value:='平成24年3月1日より、日本国際教育支援協会の日本語能力試験ウェブサイトをリニューアルしました。';
   Button2Click(Sender);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
   doc : IHTMLDocument3;
   lv_Langbtn1 : IHTMLElement;
begin
   Supports(WebBrowser1.Document, IHTMLDocument3, doc);
   lv_Langbtn1 := doc.getElementByID('result_box');
   lv_Langbtn1.removeAttribute('span', 0);
   RichEdit1.Text := lv_Langbtn1.outerText;

   while lv_Langbtn1.outerText = '' do
   begin
      if pv_LoopCnt > 500 then Exit;
      
      Sleep(50);
      Application.ProcessMessages;
      Inc(pv_LoopCnt);
      Button2Click(Sender);
   end;


   //RichEdit1.Text := WebBrowser1.OleObject.Document.getElementByID('result_box').innerHtml;
end;

end.
