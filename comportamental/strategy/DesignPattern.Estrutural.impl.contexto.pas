unit DesignPattern.Estrutural.impl.contexto;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  DesignPattern.Estrutural.interfaces,
  DesignPattern.Estrutural.impl.icms00,
  DesignPattern.Estrutural.impl.icms20,
  DesignPattern.Estrutural.impl.icms51;

type
  TContexto = class(TInterfacedObject, iContexto)
  private
    FElementos: iElementos;

    FMap : TDictionary<String, iStrategy>;

    procedure MapEstructure;
  public
    constructor Create(Elementos: iElementos);
    destructor Destroy; override;
    class function New(Elementos: iElementos): iContexto;
    function Execute(Value: String): iStrategy;
  end;

implementation

{ TMyClass }

function TContexto.Execute(Value: String): iStrategy;
begin
  if not FMap.TryGetValue(Value, Result) then
    raise Exception.Create('Não existe tipo de tributação solicitada');
end;

procedure TContexto.MapEstructure;
begin
  FMap.Add('00', TStrategyICMS00.New(FElementos));
  FMap.Add('20', TStrategyICMS20.New(FElementos));
  FMap.Add('51', TStrategyICMS51.New(FElementos));
end;

constructor TContexto.Create(Elementos: iElementos);
begin
  FElementos := Elementos;
  FMap := TDictionary<String, iStrategy>.Create;

  MapEstructure;
end;

destructor TContexto.Destroy;
begin
  FMap.DisposeOf;
  inherited;
end;

class function TContexto.New(Elementos: iElementos): iContexto;
begin
  Result := Self.Create(Elementos);
end;

end.
