unit adpter.calculosicms00;

interface

uses
  adpter.interfaces,
  Delphiscal.Icms00,
  Delphiscal.Icms00.Intf, adpter.elementos;

type
  TCalculosICMS00 = class(TInterfacedObject, iCalculosICMS00)
  private
    FElementos: iElementos;
    FDelphiscal: iICMS00;
  public
    constructor Create(Elementos: iElementos);
    destructor Destroy; override;
    class function New(Elementos: iElementos): iCalculosICMS00;
    function ValorBaseCalculo(var Value: Double): iCalculosICMS00; overload;
    function ValorBaseCalculo: Double; overload;
    function ValorICMS(var Value: Double): iCalculosICMS00; overload;
    function ValorICMS: Double; overload;
    function ValorICMSDesonerado(var Value: Double): iCalculosICMS00; overload;
    function ValorICMSDesonerado: Double; overload;
    function ValorICMSOperacao(var Value: Double): iCalculosICMS00; overload;
    function ValorICMSOperacao: Double; overload;
    function ValorDiferimento(var Value: Double): iCalculosICMS00; overload;
    function ValorDiferimento: Double; overload;
  end;

implementation


constructor TCalculosICMS00.Create(Elementos: iElementos);
begin
  FElementos:= Elementos;

  FDelphiscal := TIcms00.Create(FElementos.ValorProduto,
               FElementos.ValorFrete,
               FElementos.ValorSeguro,
               FElementos.ValorDespesas,
               FElementos.ValorDesconto,
               FElementos.AliquotaICMS,
               FElementos.ValorIPI);
end;

destructor TCalculosICMS00.Destroy;
begin

  inherited;
end;

class function TCalculosICMS00.New(Elementos: iElementos): iCalculosICMS00;
begin
  Result := Self.Create(Elementos);
end;

function TCalculosICMS00.ValorBaseCalculo(var Value: Double): iCalculosICMS00;
begin
  Result := Self;
  Value := FDelphiscal.BaseIcmsProprio;
end;

function TCalculosICMS00.ValorBaseCalculo: Double;
begin
  Result := FDelphiscal.BaseIcmsProprio;
end;

function TCalculosICMS00.ValorDiferimento: Double;
begin
  Result := 0;
end;

function TCalculosICMS00.ValorDiferimento(var Value: Double): iCalculosICMS00;
begin
  Result := Self;
  Value := 0;
end;

function TCalculosICMS00.ValorICMS(var Value: Double): iCalculosICMS00;
begin
  Result := Self;
  Value := FDelphiscal.ValorIcmsProprio;
end;

function TCalculosICMS00.ValorICMS: Double;
begin
  Result := FDelphiscal.ValorIcmsProprio;
end;

function TCalculosICMS00.ValorICMSDesonerado(
  var Value: Double): iCalculosICMS00;
begin
  Result := Self;
  Value := 0;
end;

function TCalculosICMS00.ValorICMSDesonerado: Double;
begin
  Result := 0;
end;

function TCalculosICMS00.ValorICMSOperacao(var Value: Double): iCalculosICMS00;
begin
  Result := Self;
  Value := 0;
end;

function TCalculosICMS00.ValorICMSOperacao: Double;
begin
  Result := 0;
end;

end.
