unit adpter.interfaces;

interface

uses
  System.SysUtils,
  System.TypInfo;

type
  TCST = (tp00, tp20, tp51);

  TCSTHelper = record helper for TCST
    function ToString: String;
    function ToEnum(Value: String): TCST;
  end;

  iCalculoAdapter = interface
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

  iCalculosICMS00 = interface
    function ValorBaseCalculo(var Value: Double): iCalculosICMS00; overload;
    function ValorBaseCalculo: Double; overload;
    function ValorICMS(var Value: Double): iCalculosICMS00; overload;
    function ValorICMS: Double; overload;
  end;

  iCalculosICMS20 = interface
    function ValorBaseCalculo(var Value: Double): iCalculosICMS20; overload;
    function ValorBaseCalculo: Double; overload;
    function ValorICMS(var Value: Double): iCalculosICMS20; overload;
    function ValorICMS: Double; overload;
    function ValorICMSDesonerado(var Value: Double): iCalculosICMS20; overload;
    function ValorICMSDesonerado: Double; overload;
  end;

  iCalculosICMS51 = interface
    function ValorBaseCalculo(var Value: Double): iCalculosICMS51; overload;
    function ValorBaseCalculo: Double; overload;
    function ValorICMS(var Value: Double): iCalculosICMS51; overload;
    function ValorICMS: Double; overload;
    function ValorICMSOperacao(var Value: Double): iCalculosICMS51; overload;
    function ValorICMSOperacao: Double; overload;
    function ValorDiferimento(var Value: Double): iCalculosICMS51; overload;
    function ValorDiferimento: Double; overload;
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

{ TCSTHelper }

function TCSTHelper.ToEnum(Value: String): TCST;
begin
  Result := TCST(GetEnumValue(TypeInfo(TCST), 'tp'+Value));
end;

function TCSTHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TCST), Integer(Self));
end;

end.
