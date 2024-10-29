object frmCadLanches: TfrmCadLanches
  Left = 0
  Top = 0
  Caption = 'Cadastro de Lanches'
  ClientHeight = 315
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 65
    Align = alTop
    Color = clBurlywood
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 144
      Height = 15
      Caption = 'Nome/Descri'#231#227'o do lanche'
    end
    object txtNomeLanche: TEdit
      Left = 10
      Top = 27
      Width = 311
      Height = 23
      TabOrder = 0
    end
    object btnIncluir: TButton
      Left = 327
      Top = 26
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 408
      Top = 26
      Width = 75
      Height = 25
      Caption = 'Alterar'
      Enabled = False
      TabOrder = 2
      OnClick = btnAlterarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 502
    Height = 231
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnMouseDown = DBGrid1MouseDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_LANCHE'
        Title.Caption = 'C'#243'digo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_LANCHE'
        Title.Caption = 'Nome do lanche'
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 296
    Width = 502
    Height = 19
    Panels = <
      item
        Text = 
          'Para alterar ou excluir um registro, clique com o bot'#227'o direito ' +
          'do mouse no grid'
        Width = 50
      end>
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=admin'
      'Database=C:\DESEN\fb\LANCHES.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 264
    Top = 136
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AutoIncFields = 'ID_LANCHE'
    SQL.Strings = (
      'SELECT id_lanche, nome_lanche FROM tbLanches')
    Left = 208
    Top = 136
    object FDQuery1ID_LANCHE: TIntegerField
      FieldName = 'ID_LANCHE'
      Origin = 'ID_LANCHE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1NOME_LANCHE: TStringField
      FieldName = 'NOME_LANCHE'
      Origin = 'NOME_LANCHE'
      Required = True
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 320
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 136
    object mnuAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuAlterarClick
    end
    object mnuExcluir: TMenuItem
      Caption = 'Excluir'
      OnClick = mnuExcluirClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuSair: TMenuItem
      Caption = 'Sair'
      OnClick = mnuSairClick
    end
  end
end
