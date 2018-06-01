unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Uni, Data.DB, DBAccess, MemDS,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, AdvUtil, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, CRGrid, Vcl.DBGrids, cxSplitter, SynEdit, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, UniProvider, MySQLUniProvider, cxContainer,
  cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TForm1 = class(TForm)
    UniConnection1: TUniConnection;
    UniDataSource1: TUniDataSource;
    UniQuery1: TUniQuery;
    UniDataSource2: TUniDataSource;
    UniQuery2: TUniQuery;
    UniDataSource3: TUniDataSource;
    Panel1: TPanel;
    SynEdit1: TSynEdit;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    CRDBGrid1: TCRDBGrid;
    cxSplitter2: TcxSplitter;
    cxSplitter3: TcxSplitter;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxSplitter4: TcxSplitter;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    UniQuery3: TUniQuery;
    UniQuery4: TUniQuery;
    UniDataSource4: TUniDataSource;
    MySQLUniProvider1: TMySQLUniProvider;
    cxCheckBox1: TcxCheckBox;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DataSource1: TDataSource;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDQuery1: TFDQuery;
    DBAdvGrid1: TDBAdvGrid;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure DBAdvGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    fv_ADDBGrdNextCheck : Boolean;
  public
    { Public declarations }
    //****************************************************************************//
    // DB Connection을 한다.
    //****************************************************************************//
    function fGetDBConnect(pi_Flg : Integer; pi_ObjDBConn : TUniConnection) : String;
    procedure fSetRunSQL(pi_ObjQuery : TUniQuery);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//****************************************************************************//
// DB Connection을 한다.
//****************************************************************************//
function TForm1.fGetDBConnect(pi_Flg : Integer; pi_ObjDBConn : TUniConnection) : String;
var
   lv_EnvPath, lv_retVal : String;
begin
   lv_retVal := 'SUCCESS';
   try

      with pi_ObjDBConn do
      begin
         Connected := False;
         LoginPrompt := False;

         ProviderName := 'MySQL';
         Username     := 'devnewhtl';
         Password     := 'devnewhtl0!';
         Server       := '192.168.1.61';
         Port         := 3306;
         Database     := 'dev_newbrandhtl_db';

         SpecificOptions.Values['Charset'] := 'utf8';
         SpecificOptions.Values['UseUnicode'] := 'True';

         Connected := True;
      end;
   except
      on E : Exception do
      begin
         lv_retVal := 'FAIL';
      end;
   end;

   Result := lv_retVal;
end;

procedure TForm1.fSetRunSQL(pi_ObjQuery : TUniQuery);
begin
   with pi_ObjQuery do
   begin
      Connection := UniConnection1;
      DisableControls;
      try
         Active := False;
         SQL.Clear;
         SQL.Text := SynEdit1.Text;
         FetchRows := 100;
         if cxCheckBox1.Checked = False then
         begin
            SpecificOptions.Values['FetchAll'] := 'False';
         end;

         Active := True;
      finally
         EnableControls;
      end;
   end;
end;

procedure TForm1.cxButton1Click(Sender: TObject);
begin
   DBGrid1.DataSource := UniDataSource1;
   CRDBGrid1.DataSource := UniDataSource2;
   cxGrid1DBTableView1.DataController.DataSource := UniDataSource3;
   DBAdvGrid1.DataSource := UniDataSource4;
   fGetDBConnect(0, UniConnection1);
end;

procedure TForm1.cxButton2Click(Sender: TObject);
begin
   fSetRunSQL(UniQuery1);
end;

procedure TForm1.cxButton3Click(Sender: TObject);
begin
   fSetRunSQL(UniQuery2);
end;

procedure TForm1.cxButton4Click(Sender: TObject);
begin
   fSetRunSQL(UniQuery3);
   with cxGrid1DBTableView1 do
   begin
     DataController.DataSource := nil;
     DataController.DataSource := UniDataSource3;
     { -- Grid 부분범위 처리 -- }
     DataController.DataModeController.GridMode := True;
     DataController.BeginUpdate;
     try
      (cxGrid1DBTableView1.DataController as IcxCustomGridDataController).DeleteAllItems;

       { -- SQL 결과를 Grid에 표현 -- }
       (cxGrid1DBTableView1.DataController as IcxCustomGridDataController).CreateAllItems(True);
     finally
        DataController.EndUpdate;
     end;
   end;
end;

procedure TForm1.cxButton5Click(Sender: TObject);
begin
   DBAdvGrid1.BeginUpdate;
   try
      UniQuery4.DisableControls;
      fSetRunSQL(UniQuery4);
   finally
      UniQuery4.EnableControls;
      DBAdvGrid1.EndUpdate;
   end;
end;

procedure TForm1.cxButton6Click(Sender: TObject);
begin
   FDConnection1.Connected := True;
end;

procedure TForm1.cxButton7Click(Sender: TObject);
begin
   fv_ADDBGrdNextCheck := True;
   with FDQuery1 do
   begin
      Active := False;
      Connection := FDConnection1;
      SQL.Clear;
      SQL.Text := SynEdit1.Text;
      DBAdvGrid1.DataSource := DataSource1;

      FetchOptions.CursorKind := ckDefault;
      FetchOptions.AutoClose  := False;
      FetchOptions.Mode := TFDFetchMode.fmManual;
      FetchOptions.RowsetSize := 100;
      Active := True;

      FDQuery1.FetchNext;
   end;
end;

procedure TForm1.DBAdvGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if FDQuery1.Active = False then Exit;

   if (ARow = (DBAdvGrid1.RowCount-1)) and (fv_ADDBGrdNextCheck = False) then
   begin
      fv_ADDBGrdNextCheck := True;
      FDQuery1.FetchNext;
      DBAdvGrid1.AutoNumberCol(0);
      ARow := ARow + 1;
   end else
   begin
      fv_ADDBGrdNextCheck := False;
   end;
end;

end.
