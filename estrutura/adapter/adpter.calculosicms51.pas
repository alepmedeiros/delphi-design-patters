unit adpter.calculosicms51;

interface

uses
  adpter.interfaces,
  Delphiscal.Icms51,
  Delphiscal.Icms51.Intf,
  adpter.elementos;

type
  TCalculosICMS51 = class(TInterfacedObject, iCalculosICMS51)
  private
    FElementos: iElementos;
    FDelphiscal: iICMS51;
  public
    constructor Create(Elementos: iElementos);
    destructor Destroy; override;
    class function New(Elementos: iElementos): iCalculosICMS51;
    function ValorBaseCalculo(var Value: Double): iCalculosICMS51; overload;
    function ValorBaseCalculo: Double; overload;
    function ValorICMS(var Value: Double): iCalculosICMS51; overload;
    function ValorICMS: Double; overload;
    function ValorICMSDesonerado(var Value: Double): iCalculosICMS51; overload;
    function ValorICMSDesonerado: Double; overload;
    function ValorICMSOperacao(var Value: Double): iCalculosICMS51; overload;
    function ValorICMSOperacao: Double; overload;
    function ValorDiferimento(var Value: Double): iCalculosICMS51; overload;
    function ValorDiferimento: Double; overload;
  end;

implementation


constructor TCalculosICMS51.Create(Elementos: iElementos);
begin
  FElementos:= Elementos;

  FDelphiscal := TIcms51.Create(FElementos.ValorProduto,
                 FElementos.ValorFrete,
                 FElementos.ValorSeguro,
                 FElementos.ValorDespesas,
                 FElementos.ValorDesconto,
                 FElementos.AliquotaICMS,
                 FElementos.ValorIPI);
end;

destructor TCalculosICMS51.Destroy;
begin

  inherited;
end;

class function TCalculosICMS51.New(Elementos: iElementos): iCalculosICMS51;
begin
  Result := Self.Create(Elementos);
end;

function TCalculosICMS51.ValorBaseCalculo(var Value: Double): iCalculosICMS51;
begin
  Result := Self;
  Value := FDelphiscal.BaseIcmsProprio;
end;

function TCalculosICMS51.ValorBaseCalculo: Double;
begin
  Result := FDelphiscal.BaseIcmsProprio;
end;

function TCalculosICMS51.ValorDiferimento: Double;
begin
  Result := FDelphiscal.ValorIcmsDiferido;
end;

function TCalculosICMS51.ValorDiferimento(var Value: Double): iCalculosICMS51;
begin
  Result := Self;
  Value := FDelphiscal.ValorIcmsDiferido;
end;

function TCalculosICMS51.ValorICMS(var Value: Double): iCalculosICMS51;
begin
  Result := Self;
  Value := FDelphiscal.ValorIcmsProprio;
end;

function TCalculosICMS51.ValorICMS: Double;
begin
  Result := FDelphiscal.ValorIcmsProprio;
end;

function TCalculosICMS51.ValorICMSDesonerado(
  var Value: Double): iCalculosICMS51;
begin
  Result := Self;
  Value := 0;
end;

function TCalculosICMS51.ValorICMSDesonerado: Double;
begin
  Result := 0;
end;

function TCalculosICMS51.ValorICMSOperacao(var Value: Double): iCalculosICMS51;
begin
  Result := Self;
  Value := FDelphiscal.ValorIcmsOperacao;
end;

function TCalculosICMS51.ValorICMSOperacao: Double;
begin
  Result := FDelphiscal.ValorIcmsOperacao;
end;

end.

