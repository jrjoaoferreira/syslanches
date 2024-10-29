unit untLanches;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    mnuCadLanhes: TMenuItem;
    mnuIngredientes: TMenuItem;
    N1: TMenuItem;
    mnuCardapio: TMenuItem;
    N2: TMenuItem;
    mnuSair: TMenuItem;
    Image1: TImage;
    procedure mnuSairClick(Sender: TObject);
    procedure mnuCadLanhesClick(Sender: TObject);
    procedure mnuIngredientesClick(Sender: TObject);
    procedure mnuCardapioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UnitCadastroLanches, UnitCadastroIngredientes, untLanchesIngredientes;

procedure TfrmPrincipal.mnuCadLanhesClick(Sender: TObject);
begin
    frmCadLanches := TfrmCadLanches.Create(Application);
    frmCadLanches.ShowModal;
end;

procedure TfrmPrincipal.mnuCardapioClick(Sender: TObject);
begin
   frmLanchesIngredientes := TfrmLanchesIngredientes.Create(Application);
   frmLanchesIngredientes.ShowModal;
end;

procedure TfrmPrincipal.mnuIngredientesClick(Sender: TObject);
begin
   frmCadIngredientes := TfrmCadIngredientes.Create(Application);
   frmCadIngredientes.ShowModal;
end;

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

end.
