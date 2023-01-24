program Strategy;

uses
  Vcl.Forms,
  DesignPattern.Estrutural.Strategy in 'DesignPattern.Estrutural.Strategy.pas' {Form2},
  DesignPattern.Estrutural.impl.icms20 in 'DesignPattern.Estrutural.impl.icms20.pas',
  DesignPattern.Estrutural.impl.icms51 in 'DesignPattern.Estrutural.impl.icms51.pas',
  DesignPattern.Estrutural.impl.contexto in 'DesignPattern.Estrutural.impl.contexto.pas',
  DesignPattern.Estrutural.impl.icms00 in 'DesignPattern.Estrutural.impl.icms00.pas',
  DesignPattern.Estrutural.impl.elementos in 'DesignPattern.Estrutural.impl.elementos.pas',
  DesignPattern.Estrutural.interfaces in 'DesignPattern.Estrutural.interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
