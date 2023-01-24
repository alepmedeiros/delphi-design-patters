unit DesignPattern.Estrutural.impl.icms20;

interface

uses
  Delphiscal.Icms20,
  Delphiscal.Icms20.Intf,
  DesignPattern.Estrutural.interfaces;

type
  TStrategyICMS20 = class(TInterfacedObject, iStrategy)
  private
    FICMS: iICMS20;

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

constructor TStrategyICMS20.Create(Elementos: iElementos);
begin
  FICMS := TICMS20.Create(
        Elementos.ValorProduto,
        Elementos.ValorFrete,
        Elementos.ValorSeguro,
        Elementos.ValorDespesas,
        Elementos.ValorDesconto,
        Elementos.AliquotaICMS,
        Elementos.PercentualReducao,
        Elementos.ValorIPI);
end;

destructor TStrategyICMS20.Destroy;
begin

  inherited;
end;

class function TStrategyICMS20.New(Elementos: iElementos): iStrategy;
begin
  Result := Self.Create(Elementos);
end;

function TStrategyICMS20.ValorBaseCalculo: Double;
begin
  Result := FICMS.BaseReduzidaIcmsProprio;
end;

function TStrategyICMS20.ValorDiferimento: Double;
begin
  Result := 0;
end;

function TStrategyICMS20.ValorICMS: Double;
begin
  Result := FICMS.ValorIcmsProprio;;
end;

function TStrategyICMS20.ValorICMSDesonerado: Double;
begin
  Result := FICMS.ValorIcmsDesonerado;
end;

function TStrategyICMS20.ValorICMSOperacao: Double;
begin
  Result := 0;
end;

end.

