unit Unit1;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls, adpter.interfaces, adpter.calculosicms00, adpter.elementos,
  adpter.calculosicms;

type
  TForm1 = class(TForm)
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
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label7: TLabel;
    lblvBC51: TLabel;
    Panel14: TPanel;
    Label9: TLabel;
    lblvICM51: TLabel;
    Panel16: TPanel;
    Label11: TLabel;
    lblvICMSDeson: TLabel;
    Panel17: TPanel;
    Label13: TLabel;
    lblvICMSOp: TLabel;
    Panel18: TPanel;
    Label15: TLabel;
    lblvICMSDif: TLabel;
    Panel2: TPanel;
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
    btnCalculoICMS51: TButton;
    btnCalculoICMS20: TButton;
    btnCalculoICMS00: TButton;
    procedure btnCalculoICMS00Click(Sender: TObject);
    procedure btnCalculoICMS20Click(Sender: TObject);
    procedure btnCalculoICMS51Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalculoICMS00Click(Sender: TObject);
var
  lvBC: Double;
  lvICMS: Double;
begin
  TCalculoAdapter.New(
  TElementos.NEw
      .ValorProduto(StrToFloatDef(edtVrProduto.Text,0))
      .ValorFrete(StrToFloatDef(edtVrFrete.Text,0))
      .ValorSeguro(StrToFloatDef(edtVrSeguro.Text,0))
      .ValorDespesas(StrToFloatDef(edtVrDespesas.Text,0))
      .ValorDesconto(StrToFloatDef(edtVrDesconto.Text,0))
      .ValorIPI(StrToFloatDef(edtVrIPI.Text,0))
      .AliquotaICMS(StrToFloatDef(edtAliquotaICMS.Text,0))
      .PercentualReducao(StrToFloatDef(edtPercentualReducao.Text,0))
      .PercentualDiferimento(StrToFloatDef(edtPercentualDif.Text,0)))
    .CST('00')
    .ValorBaseCalculo(lvBC)
    .ValorICMS(lvICMS);

    lblvBc.Caption := lvBc.ToString;
    lblvICMS.Caption := lvicms.ToString;
end;

procedure TForm1.btnCalculoICMS20Click(Sender: TObject);
var
  lvBC, lvICMS, lvICMSDeson: Double;
begin
  TCalculoAdapter.New(
  TElementos.NEw
      .ValorProduto(StrToFloatDef(edtVrProduto.Text,0))
      .ValorFrete(StrToFloatDef(edtVrFrete.Text,0))
      .ValorSeguro(StrToFloatDef(edtVrSeguro.Text,0))
      .ValorDespesas(StrToFloatDef(edtVrDespesas.Text,0))
      .ValorDesconto(StrToFloatDef(edtVrDesconto.Text,0))
      .ValorIPI(StrToFloatDef(edtVrIPI.Text,0))
      .AliquotaICMS(StrToFloatDef(edtAliquotaICMS.Text,0))
      .PercentualReducao(StrToFloatDef(edtPercentualReducao.Text,0))
      .PercentualDiferimento(StrToFloatDef(edtPercentualDif.Text,0)))
    .CST('20')
    .ValorBaseCalculo(lvBC)
    .ValorICMS(lvICMS)
    .ValorICMSDesonerado(lvICMSDeson);

  lblvBC20.Caption := lvBc.ToString;
  lblvICMS20.Caption := lvICMS.ToString;
  lblvICMSDeson.Caption := lvICMSdeson.ToString;
end;

procedure TForm1.btnCalculoICMS51Click(Sender: TObject);
var
  lBC, lICMS, lICMSOp, lICMSDif: Double;
begin
  TCalculoAdapter.New(
  TElementos.NEw
      .ValorProduto(StrToFloatDef(edtVrProduto.Text,0))
      .ValorFrete(StrToFloatDef(edtVrFrete.Text,0))
      .ValorSeguro(StrToFloatDef(edtVrSeguro.Text,0))
      .ValorDespesas(StrToFloatDef(edtVrDespesas.Text,0))
      .ValorDesconto(StrToFloatDef(edtVrDesconto.Text,0))
      .ValorIPI(StrToFloatDef(edtVrIPI.Text,0))
      .AliquotaICMS(StrToFloatDef(edtAliquotaICMS.Text,0))
      .PercentualReducao(StrToFloatDef(edtPercentualReducao.Text,0))
      .PercentualDiferimento(StrToFloatDef(edtPercentualDif.Text,0)))
    .CST('51')
    .ValorBaseCalculo(lBC)
    .ValorICMS(lICMS)
    .ValorDiferimento(lICMSDif)
    .ValorICMSOperacao(licmsop);

  lblvBC51.Caption := lbc.ToString;
  lblvICM51.Caption := lIcms.ToString;
  lblvICMSOp.Caption := licmsop.ToString;
  lblvICMSDif.Caption := licmsdif.ToString;
end;

end.
