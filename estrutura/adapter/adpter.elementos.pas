unit adpter.elementos;

interface

uses
  adpter.interfaces;

type
  TElementos = class(TInterfacedObject, iElementos)
  private
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FValorDespesas: Double;
    FValorDesconto: Double;
    FValorIPI: Double;
    FValorICMS: Double;
    FValorReducao: Double;
    FValorDiferimento: Double;
    FAliquotaICMS: Double;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iElementos;
    function ValorProduto(Value: Double): iElementos; overload;
    function ValorProduto: Double; overload;
    function ValorFrete(Value: Double): iElementos; overload;
    function ValorFrete: Double; overload;
    function ValorSeguro(Value: Double): iElementos; overload;
    function ValorSeguro: Double; overload;
    function ValorDespesas(Value: Double): iElementos; overload;
    function ValorDespesas: Double; overload;
    function ValorDesconto(Value: Double): iElementos; overload;
    function ValorDesconto: Double; overload;
    function ValorIPI(Value: Double): iElementos; overload;
    function ValorIPI: Double; overload;
    function ValorICMS(Value: Double): iElementos; overload;
    function ValorICMS: Double; overload;
    function PercentualReducao(Value: Double): iElementos; overload;
    function PercentualReducao: Double; overload;
    function PercentualDiferimento(Value: Double): iElementos; overload;
    function PercentualDiferimento: Double; overload;
    function AliquotaICMS(Value: Double): iElementos; overload;
    function AliquotaICMS: Double; overload;
  end;

implementation

function TElementos.AliquotaICMS: Double;
begin
  Result := FAliquotaICMS;
end;

function TElementos.AliquotaICMS(Value: Double): iElementos;
begin
  Result := Self;
  FAliquotaICMS := Value;
end;

constructor TElementos.Create;
begin

end;

destructor TElementos.Destroy;
begin

  inherited;
end;

class function TElementos.New: iElementos;
begin
  Result := Self.Create;
end;

function TElementos.ValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

function TElementos.ValorDesconto(Value: Double): iElementos;
begin
  Result := Self;
  FValorDesconto := Value;
end;

function TElementos.ValorDespesas(Value: Double): iElementos;
begin
  Result := Self;
  FValorDespesas := Value;
end;

function TElementos.ValorDespesas: Double;
begin
  Result := FValorDespesas;
end;

function TElementos.PercentualDiferimento(Value: Double): iElementos;
begin
  Result := Self;
  FValorDiferimento := Value;
end;

function TElementos.PercentualDiferimento: Double;
begin
  Result := FValorDiferimento;
end;

function TElementos.ValorFrete: Double;
begin
  Result := FValorFrete;
end;

function TElementos.ValorFrete(Value: Double): iElementos;
begin
  Result := Self;
  FValorFrete := Value;
end;

function TElementos.ValorICMS(Value: Double): iElementos;
begin
  Result := Self;
  FValorICMS := Value;
end;

function TElementos.ValorICMS: Double;
begin
  Result := FValorICMS;
end;

function TElementos.ValorIPI(Value: Double): iElementos;
begin
  Result := Self;
  FValorIPI := Value;
end;

function TElementos.ValorIPI: Double;
begin
  Result := FValorIPI;
end;

function TElementos.ValorProduto: Double;
begin
  Result := FValorProduto;
end;

function TElementos.ValorProduto(Value: Double): iElementos;
begin
  Result := Self;
  FValorProduto := Value;
end;

function TElementos.PercentualReducao: Double;
begin
  Result := FValorReducao;
end;

function TElementos.PercentualReducao(Value: Double): iElementos;
begin
  Result := Self;
  FValorReducao := Value;
end;

function TElementos.ValorSeguro: Double;
begin
  Result := FValorSeguro;
end;

function TElementos.ValorSeguro(Value: Double): iElementos;
begin
  Result := Self;
  FValorSeguro := Value;
end;

end.
