program Adapter;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  interfaces in 'interfaces.pas',
  calculosicms in 'calculosicms.pas',
  elementos in 'elementos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
