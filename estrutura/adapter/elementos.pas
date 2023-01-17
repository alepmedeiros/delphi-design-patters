unit elementos;

interface

uses
  interfaces, calculosicms;

type
  TElementos = class(TInterfacedObject, iElementos)
  private
    FAdapter: iCalculosAdapter;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FValorDespesas: Double;
    FValorDesconto: Double;
    FValorIPI: Double;
    FAliquotaICMS: Double;
    FPercentualReducao: Double;
    FPercentualDiferimento: Double;
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
    function ValorIpi(Value: Double): iElementos; overload;
    function ValorIPI: Double; overload;
    function AliquotaICMS(Value: Double): iElementos; overload;
    function AliquotaICMS: Double; overload;
    function PercentualReducao(Value: Double): iElementos; overload;
    function PercentualReducao: Double; overload;
    function PercentualDiferimento(Value: Double): iElementos; overload;
    function PercentualDiferimento: Double; overload;
    function Calcula(Value: String): iCalculosAdapter;
  end;

implementation

{ TMyClass }

function TElementos.AliquotaICMS: Double;
begin
  Result := FAliquotaICMS;
end;

function TElementos.AliquotaICMS(Value: Double): iElementos;
begin
  Result := Self;
  FAliquotaICMS := Value;
end;

function TElementos.Calcula(Value: String): iCalculosAdapter;
begin
  if not Assigned(FAdapter) then
    FAdapter := TCalculosAdapter.New(Self).CST(Value);
  Result := FAdapter;
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

function TElementos.PercentualDiferimento: Double;
begin
  Result := FPercentualDiferimento;
end;

function TElementos.PercentualDiferimento(Value: Double): iElementos;
begin
  Result := Self;
  FPercentualDiferimento := VAlue;
end;

function TElementos.PercentualReducao: Double;
begin
  Result := FPercentualReducao;
end;

function TElementos.PercentualReducao(Value: Double): iElementos;
begin
  Result := Self;
  FPercentualReducao := Value;;
end;

function TElementos.ValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

function TElementos.ValorDesconto(Value: Double): iElementos;
begin
  Result := Self;
  FValorDesconto := VAlue;
end;

function TElementos.ValorDespesas(Value: Double): iElementos;
begin
  Result := Self;
  FValorDespesas := VAlue;
end;

function TElementos.ValorDespesas: Double;
begin
  Result := FValorDespesas;
end;

function TElementos.ValorFrete(Value: Double): iElementos;
begin
  Result := Self;
  FValorFrete := VAlue;
end;

function TElementos.ValorFrete: Double;
begin
  Result := FValorFrete;
end;

function TElementos.ValorIpi(Value: Double): iElementos;
begin
  Result := Self;
  FValorIPI := VAlue;
end;

function TElementos.ValorIpi: Double;
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
  FValorProduto := VAlue;
end;

function TElementos.ValorSeguro: Double;
begin
  Result := FValorSeguro;
end;

function TElementos.ValorSeguro(Value: Double): iElementos;
begin
  Result := Self;
  FValorSeguro := VAlue;
end;

end.
