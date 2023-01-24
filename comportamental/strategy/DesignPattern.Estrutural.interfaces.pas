unit DesignPattern.Estrutural.interfaces;

interface

uses
  System.TypInfo;

type
  TTipoICMS = (tp00, tp20, tp51);

  TTipoICMSHelper = record helper for TTipoICMS
    function ToString: String;
    function ToEnum(Value: String): TTipoICMS;
  end;

  iElementos = interface
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
    function Build: iElementos;
  end;

  iStrategy = interface
    function ValorBaseCalculo: Double;
    function ValorICMS: Double;
    function ValorICMSDesonerado: Double;
    function ValorICMSOperacao: Double;
    function ValorDiferimento: Double;
  end;

  iContexto = interface
    function Execute(Value: String): iStrategy;
  end;

implementation

{ TTipoICMSHelper }

function TTipoICMSHelper.ToEnum(Value: String): TTipoICMS;
begin
  Result := TTipoICMS(GetEnumValue(TypeInfo(TTipoICMS), 'tp'+Value));
end;

function TTipoICMSHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTipoICMS), Integer(Self));
end;

end.
