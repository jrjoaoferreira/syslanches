unit UnitCadastroLanches;

interface

uses
  Vcl.Forms, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.StdCtrls, Vcl.DBGrids, Data.DB, Vcl.Controls, Vcl.ExtCtrls,
  System.Classes, Vcl.ComCtrls, Vcl.Grids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Vcl.Menus;

type
  TfrmCadLanches = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    txtNomeLanche: TEdit;
    btnIncluir: TButton;
    btnAlterar: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    FDQuery1ID_LANCHE: TIntegerField;
    FDQuery1NOME_LANCHE: TStringField;
    PopupMenu1: TPopupMenu;
    mnuExcluir: TMenuItem;
    mnuAlterar: TMenuItem;
    N1: TMenuItem;
    mnuSair: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnuSairClick(Sender: TObject);
  private
    procedure CarregarDados;
  public
  end;

var
  frmCadLanches: TfrmCadLanches;

implementation
    uses System.Types, Dialogs;

{$R *.dfm}

procedure TfrmCadLanches.FormActivate(Sender: TObject);
begin
    txtNomeLanche.SetFocus;
end;

procedure TfrmCadLanches.FormCreate(Sender: TObject);
begin
  CarregarDados;
end;

procedure TfrmCadLanches.FormShow(Sender: TObject);
begin
    FDConnection1.Connected := true;
    FDQuery1.Active := true;
end;

procedure TfrmCadLanches.mnuAlterarClick(Sender: TObject);
begin
   txtNomeLanche.Text := FDQuery1.FieldByName('nome_lanche').AsString;
   btnIncluir.Enabled := false;
   btnAlterar.Enabled := True;
end;

procedure TfrmCadLanches.mnuExcluirClick(Sender: TObject);
var
  cOpcao: Integer;
begin
  cOpcao := MessageDlg('Você tem certeza que vai apagar o registro? Essa ação não poderá ser desfeita!', mtWarning, [mbOK, mbCancel], 0);
  if cOpcao = mrOK then
  if not FDQuery1.IsEmpty then
    FDQuery1.Delete;

end;

procedure TfrmCadLanches.mnuSairClick(Sender: TObject);
begin
    txtNomeLanche.SetFocus;
end;

procedure TfrmCadLanches.CarregarDados;
begin
  FDConnection1.Connected := True;
  FDQuery1.Open;
end;

procedure TfrmCadLanches.DBGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt: TPoint;
begin
  if Button = mbRight then
  begin
    pt := ClientToScreen(Point(X, Y));
    PopupMenu1.Popup(pt.X, pt.Y);
  end;
end;


procedure TfrmCadLanches.btnIncluirClick(Sender: TObject);
begin
  FDQuery1.Append;
  FDQuery1.FieldByName('nome_lanche').AsString := txtNomeLanche.Text;
  FDQuery1.Post;

  txtNomeLanche.Clear;
  txtNomeLanche.SetFocus;
end;

procedure TfrmCadLanches.btnAlterarClick(Sender: TObject);
begin
  FDQuery1.Edit;
  FDQuery1.FieldByName('nome_lanche').AsString := txtNomeLanche.Text;
  FDQuery1.Post;

  txtNomeLanche.Clear;
  txtNomeLanche.SetFocus;
  btnIncluir.Enabled := true;
  btnAlterar.Enabled := false;
end;

end.

