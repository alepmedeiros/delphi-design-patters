unit DesignPattern.Estrutural.impl.icms00;

interface

uses
  Delphiscal.Icms00,
  Delphiscal.Icms00.Intf,
  DesignPattern.Estrutural.interfaces;

type
  TStrategyICMS00 = class(TInterfacedObject, iStrategy)
  private
    FICMS: iICMS00;

  public
    constructor Create(Elementos: iElementos);
    destructor Destroy; override;
    class function New(Elementos: iElementos): iStrategy;
    function ValorBaseCalculo: Double;
    function ValorICMS: Double;
    function ValorICMSDesonerado: Double;
    function ValorICMSOperacao: Double;
    function ValorDiferimento: Double;
  end;

implementation

{ TMyClass }

constructor TStrategyICMS00.Create(Elementos: iElementos);
begin
  FICMS := TICMS00.Create(
        Elementos.ValorProduto,
        Elementos.ValorFrete,
        Elementos.ValorSeguro,
        Elementos.ValorDespesas,
        Elementos.ValorDesconto,
        Elementos.AliquotaICMS,
        Elementos.ValorIPI);
end;

destructor TStrategyICMS00.Destroy;
begin

  inherited;
end;

class function TStrategyICMS00.New(Elementos: iElementos): iStrategy;
begin
  Result := Self.Create(Elementos);
end;

function TStrategyICMS00.ValorBaseCalculo: Double;
begin
  Result := FICMS.BaseIcmsProprio;
end;

function TStrategyICMS00.ValorDiferimento: Double;
begin
  Result := 0;
end;

function TStrategyICMS00.ValorICMS: Double;
begin
  Result := FICMS.ValorIcmsProprio;
end;

function TStrategyICMS00.ValorICMSDesonerado: Double;
begin
  Result := 0;
end;

function TStrategyICMS00.ValorICMSOperacao: Double;
begin
  Result := 0;
end;

end.
