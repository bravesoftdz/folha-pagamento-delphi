unit unClassTFunc;

interface

uses
  SysUtils;

Type
  EFuncError      = class(Exception);
  ENameLength     = class(EFuncError);
  ENegativeSalary = class(EFuncError);

  TFunc = class
  private
    procedure SetNome(const Value: String);
    procedure SetSalario(const Value: Double);
  protected
    fNome: String;
    fSalario: Double;
    procedure Create (cNome: String; cSal: Double);
    overload; procedure Create;
    function salarioTotal: double; abstract;
  public
    property Nome: String read fNome write SetNome;
    property Salario: Double read fSalario write SetSalario;
end;

implementation



{ TFunc }

procedure TFunc.Create(cNome: String; cSal: Double);
begin
  Nome := cNome;
  Salario := cSal;
end;

procedure TFunc.Create;
begin
  Nome := 'Josnei';
  Salario := 0;
end;

procedure TFunc.SetNome(const Value: String);
begin
  if((Length(value) > 3) OR (Value <> fNome)) then
    fNome := Value
  else
    if(Length(value) <= 3) then
      raise ENameLength.Create('Nome "' + Value + '" inv�lido, � necess�rio mais de 3 caracteres');
end;

procedure TFunc.SetSalario(const Value: Double);
begin
  if((Value <> fSalario) OR (Value) >= 0) then
    fSalario := Value
  else
    if Value < 0 then
      raise ENegativeSalary.Create('Sal�rio' + FloatToStr(Value) + ' � inv�lido, � negativo');
end;

end.
