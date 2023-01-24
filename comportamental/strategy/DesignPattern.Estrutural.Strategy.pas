unit DesignPattern.Estrutural.Strategy;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  DesignPattern.Estrutural.interfaces,
  DesignPattern.Estrutural.impl.elementos,
  DesignPattern.Estrutural.impl.contexto;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    lblvBc: TLabel;
    Panel9: TPanel;
    Label2: TLabel;
    lblvICMS: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    lblvBC20: TLabel;
    Panel8: TPanel;
    Label5: TLabel;
    lblvICMS20: TLabel;
    Panel16: TPanel;
    Label11: TLabel;
    lblvICMSDeson: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label7: TLabel;
    lblvBC51: TLabel;
    Panel14: TPanel;
    Label9: TLabel;
    lblvICM51: TLabel;
    Panel17: TPanel;
    Label13: TLabel;
    lblvICMSOp: TLabel;
    Panel18: TPanel;
    Label15: TLabel;
    lblvICMSDif: TLabel;
    Panel15: TPanel;
    Panel19: TPanel;
    Label4: TLabel;
    edtVrProduto: TEdit;
    Panel20: TPanel;
    Label6: TLabel;
    edtVrFrete: TEdit;
    Panel21: TPanel;
    Label8: TLabel;
    edtVrSeguro: TEdit;
    Panel22: TPanel;
    Label10: TLabel;
    edtVrDespesas: TEdit;
    Panel23: TPanel;
    Label12: TLabel;
    edtVrDesconto: TEdit;
    Panel24: TPanel;
    Label14: TLabel;
    edtVrIPI: TEdit;
    Panel25: TPanel;
    Label16: TLabel;
    edtAliquotaICMS: TEdit;
    Panel26: TPanel;
    Label17: TLabel;
    edtPercentualReducao: TEdit;
    Panel27: TPanel;
    Label18: TLabel;
    edtPercentualDif: TEdit;
    Panel2: TPanel;
    btnCalculoICMS51: TButton;
    btnCalculoICMS20: TButton;
    btnCalculoICMS00: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCalculoICMS00Click(Sender: TObject);
    procedure btnCalculoICMS20Click(Sender: TObject);
    procedure btnCalculoICMS51Click(Sender: TObject);
  private
    FElementos: iElementos;
    FContexto: iContexto;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnCalculoICMS00Click(Sender: TObject);
begin
  lblvBc.Caption := TContexto.New(FElementos).Execute('00').ValorBaseCalculo.ToString;
  lblvICMS.Caption := TContexto.New(FElementos).Execute('00').ValorICMS.ToString;
end;

procedure TForm2.btnCalculoICMS20Click(Sender: TObject);
begin
  lblvBC20.Caption := TContexto.New(FElementos).Execute('20').ValorBaseCalculo.ToString;
  lblvICMS20.Caption := TContexto.New(FElementos).Execute('20').ValorICMS.ToString;
  lblvICMSDeson.Caption := TContexto.New(FElementos).Execute('20').ValorICMSDesonerado.ToString;
end;

procedure TForm2.btnCalculoICMS51Click(Sender: TObject);
begin
  lblvBC51.Caption := TContexto.New(FElementos).Execute('51').ValorBaseCalculo.ToString;
  lblvICM51.Caption := TContexto.New(FElementos).Execute('51').ValorICMS.ToString;
  lblvICMSOp.Caption := TContexto.New(FElementos).Execute('51').ValorICMSOperacao.ToString;
  lblvICMSDif.Caption := TContexto.New(FElementos).Execute('51').ValorDiferimento.ToString;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FElementos := TElementos.New.ValorProduto(StrToCurrDef(edtVrProduto.Text, 0))
    .ValorFrete(StrToCurrDef(edtVrFrete.Text, 0))
    .ValorSeguro(StrToCurrDef(edtVrSeguro.Text, 0))
    .ValorDespesas(StrToCurrDef(edtVrDespesas.Text, 0))
    .ValorDesconto(StrToCurrDef(edtVrDesconto.Text, 0))
    .ValorIpi(StrToCurrDef(edtVrIPI.Text, 0))
    .AliquotaICMS(StrToCurrDef(edtAliquotaICMS.Text, 0))
    .PercentualReducao(StrToCurrDef(edtPercentualReducao.Text, 0))
    .PercentualDiferimento(StrToCurrDef(edtPercentualDif.Text, 0));
end;

end.
