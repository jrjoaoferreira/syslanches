unit UnitCadastroIngredientes;

interface

uses
  Vcl.Forms, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.StdCtrls, Vcl.DBGrids, Data.DB, Vcl.Controls, Vcl.ExtCtrls,
  Vcl.Grids, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, Vcl.Menus, FireDAC.Comp.DataSet, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Vcl.ComCtrls;

type
  TfrmCadIngredientes = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    txtNomeIngrediente: TEdit;
    Label2: TLabel;
    txtVrIngrediente: TEdit;
    btnIncluir: TButton;
    btnAlterar: TButton;
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    mnuAlterar: TMenuItem;
    mnuExcluir: TMenuItem;
    N1: TMenuItem;
    mnuSair: TMenuItem;
    StatusBar1: TStatusBar;
    FDQuery1: TFDQuery;
    FDQuery1ID_INGREDIENTE: TIntegerField;
    FDQuery1NOME_INGREDIENTE: TStringField;
    FDQuery1VALOR_INGREDIENTE: TFMTBCDField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure txtVrIngredienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
  private
  public
  end;

var
  frmCadIngredientes: TfrmCadIngredientes;

implementation
     uses System.Types, Dialogs, SysUtils;

{$R *.dfm}

procedure TfrmCadIngredientes.FormShow(Sender: TObject);
begin
    FDConnection1.Connected := true;
    FDQuery1.Active := true;
end;


procedure TfrmCadIngredientes.mnuAlterarClick(Sender: TObject);
begin
    txtNomeIngrediente.Text := FDQuery1.FieldByName('nome_ingrediente').AsString;
    txtVrIngrediente.Text := FDQuery1.FieldByName('valor_ingrediente').AsString;
    btnIncluir.Enabled := false;
    btnAlterar.Enabled := True;
end;

procedure TfrmCadIngredientes.mnuExcluirClick(Sender: TObject);
var
  cOpcao: Integer;
begin
  cOpcao := MessageDlg('Você tem certeza que vai apagar o registro? Essa ação não poderá ser desfeita!', mtWarning, [mbOK, mbCancel], 0);
  if cOpcao = mrOK then
  if not FDQuery1.IsEmpty then
    FDQuery1.Delete;
end;

procedure TfrmCadIngredientes.txtVrIngredienteKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', FormatSettings.DecimalSeparator, #8, #13]) then
    Key := #0;

  // Permite apenas um DecimalSeparator
  if (Key = FormatSettings.DecimalSeparator) and (Pos(FormatSettings.DecimalSeparator, TEdit(Sender).Text) > 0) then
    Key := #0;

  // Evita que o primeiro caractere seja DecimalSeparator
  if (Key = FormatSettings.DecimalSeparator) and (TEdit(Sender).SelStart = 0) then
    Key := #0;
end;

procedure TfrmCadIngredientes.btnIncluirClick(Sender: TObject);
begin
  FDQuery1.Append;
  FDQuery1.FieldByName('nome_ingrediente').AsString := txtNomeIngrediente.Text;
  FDQuery1.FieldByName('valor_ingrediente').AsFloat := StrToFloat(txtVrIngrediente.Text);
  FDQuery1.Post;

  txtNomeIngrediente.Clear;
  txtVrIngrediente.Clear;
  txtNomeIngrediente.SetFocus;
end;

procedure TfrmCadIngredientes.btnAlterarClick(Sender: TObject);
begin
  if not FDQuery1.IsEmpty then
  begin
    FDQuery1.Edit;
    FDQuery1.FieldByName('nome_ingrediente').AsString := txtNomeIngrediente.Text;
    FDQuery1.FieldByName('valor_ingrediente').AsFloat := StrToFloat(txtVrIngrediente.Text);
    FDQuery1.Post;
  end;

  txtNomeIngrediente.Clear;
  txtVrIngrediente.Clear;
  txtNomeIngrediente.SetFocus;
  btnIncluir.Enabled := true;
  btnAlterar.Enabled := false;
end;

end.

