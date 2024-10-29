unit untPesquisa;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.DBGrids, Vcl.Controls, Data.DB, FireDAC.Comp.Client, System.Classes, FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.DApt, SysUtils,
  Vcl.Grids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TfrmPesquisa = class(TForm)
    EditPesquisa: TEdit;
    ButtonPesquisar: TButton;
    DBGridResultados: TDBGrid;
    FDConnection1: TFDConnection;
    dsPesquisa: TDataSource;
    fdqPesquisa: TFDQuery;
    lblTexto: TLabel;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridResultadosDblClick(Sender: TObject);
  private
    FTabela: string;
    FCampo: string;
  public
    procedure ConfigurarPesquisa(ATabela, ACampo: string; AConnection: TFDConnection);
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation
    uses Dialogs;

{$R *.dfm}

procedure TfrmPesquisa.ButtonPesquisarClick(Sender: TObject);
begin
  fdqPesquisa.Close;
  fdqPesquisa.SQL.Text := Format('SELECT * FROM %s WHERE %s LIKE :Pesquisa', [FTabela, FCampo]);
  fdqPesquisa.ParamByName('Pesquisa').AsString := '%' + EditPesquisa.Text + '%';
  fdqPesquisa.Open;
  if (fdqPesquisa.Eof) then
  begin
      MessageDlg('Nenhum resultado encontrado!', TMsgDlgType.mtInformation, [mbOK], 0);
      EditPesquisa.SetFocus;
  end;
end;

procedure TfrmPesquisa.ConfigurarPesquisa(ATabela, ACampo: string; AConnection: TFDConnection);
begin
  FTabela := ATabela;
  FCampo := ACampo;
  FDConnection1 := AConnection;
  fdqPesquisa.Connection := FDConnection1;
end;

procedure TfrmPesquisa.DBGridResultadosDblClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin

  fdqPesquisa.Close;
  fdqPesquisa.SQL.Text := Format('SELECT * FROM %s', [FTabela]);
  fdqPesquisa.Open;
end;

end.

