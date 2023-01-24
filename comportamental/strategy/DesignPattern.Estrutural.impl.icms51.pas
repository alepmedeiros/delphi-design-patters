unit DesignPattern.Estrutural.impl.icms51;

interface

uses
  Delphiscal.Icms51,
  Delphiscal.Icms51.Intf,
  DesignPattern.Estrutural.interfaces;

type
  TStrategyICMS51 = class(TInterfacedObject, iStrategy)
  private
    FICMS: iICMS51;

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

constructor TStrategyICMS51.Create(Elementos: iElementos);
begin
  FICMS := TICMS51.Create(
        Elementos.ValorProduto,
        Elementos.ValorFrete,
        Elementos.ValorSeguro,
        Elementos.ValorDespesas,
        Elementos.ValorDesconto,
        Elementos.AliquotaICMS,
        Elementos.PercentualDiferimento,
        Elementos.PercentualReducao,
        Elementos.ValorIPI);
end;

destructor TStrategyICMS51.Destroy;
begin

  inherited;
end;

class function TStrategyICMS51.New(Elementos: iElementos): iStrategy;
begin
  Result := Self.Create(Elementos);
end;

function TStrategyICMS51.ValorBaseCalculo: Double;
begin
  Result := FICMS.BaseIcmsProprio;;
end;

function TStrategyICMS51.ValorDiferimento: Double;
begin
  Result := FICMS.ValorIcmsDiferido;;
end;

function TStrategyICMS51.ValorICMS: Double;
begin
  Result := FICMS.ValorIcmsProprio;;
end;

function TStrategyICMS51.ValorICMSDesonerado: Double;
begin
  Result := 0;
end;

function TStrategyICMS51.ValorICMSOperacao: Double;
begin
  Result := FICMS.ValorIcmsOperacao;;
end;

end.

