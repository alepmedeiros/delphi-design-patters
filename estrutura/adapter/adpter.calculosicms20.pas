unit adpter.calculosicms20;

interface

uses
  adpter.interfaces,
  Delphiscal.Icms20,
  Delphiscal.Icms20.Intf,
  adpter.elementos;

type
  TCalculosICMS20 = class(TInterfacedObject, iCalculosICMS20)
  private
    FElementos: iElementos;
    FDelphiscal: iICMS20;
  public
    constructor Create(Elementos: iElementos);
    destructor Destroy; override;
    class function New(Elementos: iElementos): iCalculosICMS20;
    function ValorBaseCalculo(var Value: Double): iCalculosICMS20; overload;
    function ValorBaseCalculo: Double; overload;
    function ValorICMS(var Value: Double): iCalculosICMS20; overload;
    function ValorICMS: Double; overload;
    function ValorICMSDesonerado(var Value: Double): iCalculosICMS20; overload;
    function ValorICMSDesonerado: Double; overload;
    function ValorICMSOperacao(var Value: Double): iCalculosICMS20; overload;
    function ValorICMSOperacao: Double; overload;
    function ValorDiferimento(var Value: Double): iCalculosICMS20; overload;
    function ValorDiferimento: Double; overload;
  end;

implementation


constructor TCalculosICMS20.Create(Elementos: iElementos);
begin
  FElementos:= Elementos;
  FDelphiscal := TIcms20.Create(FElementos.ValorProduto,
                 FElementos.ValorFrete,
                 FElementos.ValorSeguro,
                 FElementos.ValorDespesas,
                 FElementos.ValorDesconto,
                 FElementos.AliquotaICMS,
                 FElementos.ValorIPI);
end;

destructor TCalculosICMS20.Destroy;
begin

  inherited;
end;

class function TCalculosICMS20.New(Elementos: iElementos): iCalculosICMS20;
begin
  Result := Self.Create(Elementos);
end;

function TCalculosICMS20.ValorBaseCalculo(var Value: Double): iCalculosICMS20;
begin
  Result := Self;
  Value := FDelphiscal.BaseReduzidaIcmsProprio;
end;

function TCalculosICMS20.ValorBaseCalculo: Double;
begin
  Result := FDelphiscal.BaseReduzidaIcmsProprio;
end;

function TCalculosICMS20.ValorDiferimento: Double;
begin
  Result := 0;
end;

function TCalculosICMS20.ValorDiferimento(var Value: Double): iCalculosICMS20;
begin
  Result := Self;
  Value := 0;
end;

function TCalculosICMS20.ValorICMS(var Value: Double): iCalculosICMS20;
begin
  Result := Self;
  Value := FDelphiscal.ValorIcmsProprio;
end;

function TCalculosICMS20.ValorICMS: Double;
begin
  Result := FDelphiscal.ValorIcmsProprio;
end;

function TCalculosICMS20.ValorICMSDesonerado(
  var Value: Double): iCalculosICMS20;
begin
  Result := Self;
  Value := FDelphiscal.ValorIcmsDesonerado;
end;

function TCalculosICMS20.ValorICMSDesonerado: Double;
begin
  Result := FDelphiscal.ValorIcmsDesonerado;
end;

function TCalculosICMS20.ValorICMSOperacao(var Value: Double): iCalculosICMS20;
begin
  Result := Self;
  Value := 0;
end;

function TCalculosICMS20.ValorICMSOperacao: Double;
begin
  Result := 0;
end;

end.

