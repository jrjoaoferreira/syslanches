unit untLanchesIngredientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Menus;

type
  TfrmLanchesIngredientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    FDConnection1: TFDConnection;
    qryLanches: TFDQuery;
    qryIngredientes: TFDQuery;
    DataSource1: TDataSource;
    qryIngredientesID_LANCHE: TIntegerField;
    qryIngredientesID_INGREDIENTE: TIntegerField;
    qryIngredientesNOME_INGREDIENTE: TStringField;
    DataSource2: TDataSource;
    fdqLanchesIngredientes: TFDQuery;
    fdqLanchesIngredientesID_LANCHE: TIntegerField;
    fdqLanchesIngredientesID_INGREDIENTE: TIntegerField;
    qryLanchesID_LANCHE: TIntegerField;
    qryLanchesNOME_LANCHE: TStringField;
    qryIngredientesVALOR_INGREDIENTE: TFMTBCDField;
    qryTotal: TFDQuery;
    DataSource3: TDataSource;
    qryTotalVRTOTAL: TFMTBCDField;
    GroupBox1: TGroupBox;
    dbCodLanche: TDBEdit;
    dbNomeLanche: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    txtVrTotal: TDBEdit;
    StatusBar1: TStatusBar;
    btIncluirIngredientes: TBitBtn;
    PopupMenu1: TPopupMenu;
    mnuExcluir: TMenuItem;
    N1: TMenuItem;
    mnuSair: TMenuItem;
    procedure btIncluirIngredientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function fncExisteIngrediente(MCodIngrediente, MCodLanche : integer) : boolean;
  end;

var
  frmLanchesIngredientes: TfrmLanchesIngredientes;

implementation

{$R *.dfm}

uses untPesquisa;

procedure TfrmLanchesIngredientes.btIncluirIngredientesClick(Sender: TObject);
begin
   frmPesquisa := TfrmPesquisa.Create(Self);
   try
      frmPesquisa.ConfigurarPesquisa('tbIngredientes', 'id_ingrediente', FDConnection1);
      frmPesquisa.ShowModal;

      if (not frmPesquisa.fdqPesquisa.Eof) then
      begin
         if not fncExisteIngrediente(frmPesquisa.fdqPesquisa.FieldByName('id_ingrediente').AsInteger, qryLanches.FieldByName('id_lanche').AsInteger) then
         begin
           fdqLanchesIngredientes.Append;
           fdqLanchesIngredientes.FieldByName('id_lanche').AsInteger :=  qryLanches.FieldByName('id_lanche').AsInteger;
           fdqLanchesIngredientes.FieldByName('id_ingrediente').AsInteger :=  frmPesquisa.fdqPesquisa.FieldByName('id_ingrediente').AsInteger;
           fdqLanchesIngredientes.Post;

           qryIngredientes.Active := false;
           qryIngredientes.Active := true;

           qryTotal.Active := false;
           qryTotal.Active := true;

           qryIngredientes.Last;
         end
         else
         begin
            MessageDlg('Este ingrediente já foi adicionado para esse lanche!', mtInformation, [mbOK], 0);
         end;
      end;

   finally
      frmPesquisa.Free;
   end;
end;

procedure TfrmLanchesIngredientes.FormShow(Sender: TObject);
begin
   fdqLanchesIngredientes.Active := true;
   qryLanches.Active := true;
   qryIngredientes.Active := true;
   qryLanches.First;
   qryTotal.Active := true;
end;


procedure TfrmLanchesIngredientes.mnuExcluirClick(Sender: TObject);
var
  cOpcao: Integer;
begin
  cOpcao := MessageDlg('Você tem certeza que vai apagar o registro? Essa ação não poderá ser desfeita!', mtWarning, [mbOK, mbCancel], 0);
  if cOpcao = mrOK then
  if not fdqLanchesIngredientes.IsEmpty then
    fdqLanchesIngredientes.Delete;

   qryIngredientes.Active := false;
   qryIngredientes.Active := true;
   qryTotal.Active := false;
   qryTotal.Active := true;
   qryIngredientes.First;
end;

function TfrmLanchesIngredientes.fncExisteIngrediente(MCodIngrediente, MCodLanche : integer) : boolean;
var
   qryBusca : TFDQuery;
begin
   qryBusca := TFDQuery.Create(Self);
   qryBusca.Connection := FDConnection1;
   try
     qryBusca.Close;
     qryBusca.SQL.Add('SELECT COUNT(*) AS QTDE FROM TBLANCHEINGREDIENTES WHERE ID_INGREDIENTE = ' + IntToStr(MCodIngrediente) + ' AND ID_LANCHE = ' + IntToStr(MCodLanche));
     qryBusca.Open;
     fncExisteIngrediente := (qryBusca.FieldByName('QTDE').AsInteger <> 0);
   finally
     qryBusca.free;
   end;

end;



end.
