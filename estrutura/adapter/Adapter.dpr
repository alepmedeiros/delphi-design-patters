program Adapter;

uses
  Vcl.Forms,
  DesignPattern.Comportamental.Adapter in 'DesignPattern.Comportamental.Adapter.pas' {Form1},
  interfaces in 'interfaces.pas',
  calculosicms in 'calculosicms.pas',
  elementos in 'elementos.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
