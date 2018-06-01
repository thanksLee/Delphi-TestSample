program VitaminWebSourceParser;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uDataParse in 'uDataParse.pas' {Form2},
  uProgress in 'uProgress.pas' {frmProgress};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.Run;
end.
