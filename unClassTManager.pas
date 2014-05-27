unit unClassTManager;

interface

uses
  unClassTFunc;

Type
  EManagerError = class(EFuncError);
  ENegativeBonus = class(EManagerError);

  TManager = class(TFunc)
    private
      procedure SetBonus(const Value: Double);
    protected
      fBonus: Double;
    public
      property Bonus: Double read fBonus write SetBonus;
  end;

implementation

{ TManager }

procedure TManager.SetBonus(const Value: Double);
begin
  if(Value <> fBonus) AND (Value >= 0) then
    fBonus := Value
  else
    if Value < 0 then
      raise ENegativeBonus.Create('O B�nus de ' + Value + ' � inv�lido, n�o pode ser negativo');
end;

end.
