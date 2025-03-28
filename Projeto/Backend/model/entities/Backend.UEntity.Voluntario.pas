unit Backend.UEntity.Voluntario;

interface

uses
  System.JSON,
  GBSwagger.Model.Attributes,
  Backend.UEntity.Cidadao,
  Backend.UEntity.Acao;

type
  TVoluntario = class
    private
      FId             : Integer;
      FCidadao        : TCidadao;
      FAcao           : TAcao;
      FJSON           : TJSONObject;

      function GetId             : Integer;
      function GetCidadao      : TCidadao;
      function GetAcao         : TAcao;

      function GetJSON: TJSONObject;


      procedure SetId           (const Value: Integer);
      procedure SetCidadao      (const Value: TCidadao);
      procedure SetAcao         (const Value: TAcao);


    public
      constructor Create; overload;
      constructor Create(aId: Integer); overload;

      destructor  Destroy; override;

      [SwagProp('Voluntario Id', True)]
      property Id: Integer read GetId write SetId;

      property Acao: TAcao read GetAcao
                                             write SetAcao;

      property Cidadao: TCidadao read GetCidadao write SetCidadao;
  end;
implementation

uses
  System.SysUtils;

{Constructor}
constructor TVoluntario.Create;
begin
  FJSON := TJSONObject.Create;
end;

{Destroy}
constructor TVoluntario.Create(aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

destructor TVoluntario.Destroy;
begin
  FreeAndNil(FJSON);

  inherited;
end;

{Gets}
function TVoluntario.GetId: Integer;
begin
  Result := FId;
end;

function TVoluntario.GetCidadao: TCidadao;
begin
  Result := FCidadao;
end;

function TVoluntario.GetAcao: TAcao;
begin
  Result := FAcao;
end;

function TVoluntario.GetJSON: TJSONObject;
begin

  FJSON.AddPair('idcidadao',        FCidadao.Id.ToString);
  FJSON.AddPair('idccao',      FAcao.Id.ToString);

  Result := FJSON;
end;

{Sets}
procedure TVoluntario.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TVoluntario.SetCidadao(const Value: TCidadao);
begin
  FCidadao := Value;
end;

procedure TVoluntario.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

end.
