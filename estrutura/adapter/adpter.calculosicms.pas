unit adpter.calculosicms;

interface

uses
  adpter.interfaces,
  Delphiscal.Icms00,
  Delphiscal.Icms00.Intf,
  Delphiscal.Icms20,
  Delphiscal.Icms20.Intf,
  Delphiscal.Icms51,
  Delphiscal.Icms51.Intf;

type
  TCalculoAdapter = class(TInterfacedObject, iCalculoAdapter)
  private
    FICMS00: iICMS00;
    FICMS20: iICMS20;
    FICMS51: iICMS51;
    FElementos: iElementos;
    FValorBaseCalculo: Double;
    FValorICMS: Double;
    FValorICMSDesonerado: Double;
    FValorICMSOperacao: Double;
    FValorDiferimento: Double;
  public
    constructor Create(Elementos: iElementos);
    destructor Destroy; override;
    class function New(Elementos: iElementos): iCalculoAdapter;
    function CST(Value: String): iCalculoAdapter;
    function ValorBaseCalculo(var Value: Double): iCalculoAdapter; overload;
    function ValorBaseCalculo: Double; overload;
    function ValorICMS(var Value: Double): iCalculoAdapter; overload;
    function ValorICMS: Double; overload;
    function ValorICMSDesonerado(var Value: Double): iCalculoAdapter; overload;
    function ValorICMSDesonerado: Double; overload;
    function ValorICMSOperacao(var Value: Double): iCalculoAdapter; overload;
    function ValorICMSOperacao: Double; overload;
    function ValorDiferimento(var Value: Double): iCalculoAdapter; overload;
    function ValorDiferimento: Double; overload;
  end;

implementation

{ TMyClass }

constructor TCalculoAdapter.Create(Elementos: iElementos);
begin
  FElementos:= Elementos;
end;

function TCalculoAdapter.CST(Value: String): iCalculoAdapter;
var
  lCST: TCST;
begin
  Result := Self;
  case lCST.ToEnum(Value) of
    tp00: begin
      FICMS00 := TIcms00.Create(FElementos.ValorProduto,
               FElementos.ValorFrete,
               FElementos.ValorSeguro,
               FElementos.ValorDespesas,
               FElementos.ValorDesconto,
               FElementos.AliquotaICMS,
               FElementos.ValorIPI);

      FValorBaseCalculo := FICMS00.BaseIcmsProprio;
      FValorICMS := FICMS00.ValorIcmsProprio;
    end;
    tp20: begin
      FICMS20 := TIcms20.Create(FElementos.ValorProduto,
                 FElementos.ValorFrete,
                 FElementos.ValorSeguro,
                 FElementos.ValorDespesas,
                 FElementos.ValorDesconto,
                 FElementos.AliquotaICMS,
                 FElementos.PercentualReducao,
                 FElementos.ValorIPI);

      FValorBaseCalculo := FICMS20.BaseReduzidaIcmsProprio;
      FValorICMS := FICMS20.ValorIcmsProprio;
      FValorICMSDesonerado := FICMS20.ValorIcmsDesonerado;
    end;
    tp51: begin
      FICMS51 := TIcms51.Create(FElementos.ValorProduto,
                   FElementos.ValorFrete,
                   FElementos.ValorSeguro,
                   FElementos.ValorDespesas,
                   FElementos.ValorDesconto,
                   FElementos.AliquotaICMS,
                   FElementos.PercentualDiferimento,
                   FElementos.PercentualReducao,
                   FElementos.ValorIPI);

      FValorBaseCalculo := FICMS51.BaseIcmsProprio;
      FValorICMSOperacao := FICMS51.ValorIcmsOperacao;
      FValorDiferimento := FICMS51.ValorIcmsDiferido;
      FValorICMS := FICMS51.ValorIcmsProprio;
    end;
  end;
end;

destructor TCalculoAdapter.Destroy;
begin

  inherited;
end;

class function TCalculoAdapter.New(Elementos: iElementos): iCalculoAdapter;
begin
  Result := Self.Create(Elementos);
end;

function TCalculoAdapter.ValorBaseCalculo(var Value: Double): iCalculoAdapter;
begin
  Result := Self;
  Value := FValorBaseCalculo;
end;

function TCalculoAdapter.ValorBaseCalculo: Double;
begin
  Result := FValorBaseCalculo;
end;

function TCalculoAdapter.ValorDiferimento: Double;
begin
  Result := FValorDiferimento;
end;

function TCalculoAdapter.ValorDiferimento(var Value: Double): iCalculoAdapter;
begin
  Result := Self;
  Value := FValorDiferimento;
end;

function TCalculoAdapter.ValorICMS(var Value: Double): iCalculoAdapter;
begin
  Result := Self;
  Value := FValorICMS;
end;

function TCalculoAdapter.ValorICMS: Double;
begin
  Result := FValorICMS;
end;

function TCalculoAdapter.ValorICMSDesonerado: Double;
begin
  Result := FValorICMSDesonerado;
end;

function TCalculoAdapter.ValorICMSDesonerado(
  var Value: Double): iCalculoAdapter;
begin
  Result := self;
  Value := FValorICMSDesonerado;
end;

function TCalculoAdapter.ValorICMSOperacao: Double;
begin
  Result := FValorICMSOperacao;
end;

function TCalculoAdapter.ValorICMSOperacao(var Value: Double): iCalculoAdapter;
begin
  Result := Self;
  Value := FValorICMSOperacao;
end;

end.
