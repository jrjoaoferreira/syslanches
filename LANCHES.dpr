program LANCHES;

uses
  Vcl.Forms,
  untLanches in 'untLanches.pas' {frmPrincipal},
  UnitCadastroLanches in 'UnitCadastroLanches.pas' {frmCadLanches},
  UnitCadastroIngredientes in 'UnitCadastroIngredientes.pas' {frmCadIngredientes},
  untLanchesIngredientes in 'untLanchesIngredientes.pas' {frmLanchesIngredientes},
  untPesquisa in 'untPesquisa.pas' {frmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
