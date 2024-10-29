object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pesquisa'
  ClientHeight = 298
  ClientWidth = 420
  Color = clSaddlebrown
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object lblTexto: TLabel
    Left = 11
    Top = 8
    Width = 190
    Height = 15
    Caption = 'Digite o item que deseja pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EditPesquisa: TEdit
    Left = 11
    Top = 25
    Width = 320
    Height = 23
    TabOrder = 0
  end
  object ButtonPesquisar: TButton
    Left = 337
    Top = 23
    Width = 70
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = ButtonPesquisarClick
  end
  object DBGridResultados: TDBGrid
    Left = 11
    Top = 54
    Width = 396
    Height = 236
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGridResultadosDblClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\DESEN\fb\LANCHES.FDB'
      'User_Name=SYSDBA'
      'Password=admin'
      'DriverID=FB')
    LoginPrompt = False
    Left = 192
    Top = 152
  end
  object dsPesquisa: TDataSource
    DataSet = fdqPesquisa
    Left = 264
    Top = 152
  end
  object fdqPesquisa: TFDQuery
    Connection = FDConnection1
    Left = 120
    Top = 152
  end
end
