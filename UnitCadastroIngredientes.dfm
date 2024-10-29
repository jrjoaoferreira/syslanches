object frmCadIngredientes: TfrmCadIngredientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Ingredientes'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 94
    Align = alTop
    Color = clAntiquewhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -6
    object Label1: TLabel
      Left = 20
      Top = 10
      Width = 113
      Height = 15
      Caption = 'Nome do Ingrediente'
    end
    object Label2: TLabel
      Left = 348
      Top = 10
      Width = 26
      Height = 15
      Caption = 'Valor'
    end
    object txtNomeIngrediente: TEdit
      Left = 20
      Top = 27
      Width = 311
      Height = 23
      TabOrder = 0
    end
    object txtVrIngrediente: TEdit
      Left = 348
      Top = 27
      Width = 200
      Height = 23
      TabOrder = 1
      OnKeyPress = txtVrIngredienteKeyPress
    end
    object btnIncluir: TButton
      Left = 392
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 2
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 473
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Alterar'
      Enabled = False
      TabOrder = 3
      OnClick = btnAlterarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 94
    Width = 584
    Height = 248
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
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_INGREDIENTE'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_INGREDIENTE'
        Title.Caption = 'Nome'
        Width = 355
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_INGREDIENTE'
        Title.Caption = 'Valor'
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <
      item
        Text = 
          'Para alterar ou excluir um registro basta clicar com o bot'#227'o dir' +
          'eito do mouse no grid'
        Width = 50
      end>
    ExplicitLeft = 424
    ExplicitTop = 208
    ExplicitWidth = 0
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\DESEN\fb\LANCHES.FDB'
      'User_Name=SYSDBA'
      'Password=admin'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 288
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 144
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Left = 464
    Top = 176
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
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AutoIncFields = 'ID_INGREDIENTE'
    SQL.Strings = (
      
        'SELECT id_ingrediente, nome_ingrediente, valor_ingrediente FROM ' +
        'tbIngredientes')
    Left = 320
    Top = 264
    object FDQuery1ID_INGREDIENTE: TIntegerField
      FieldName = 'ID_INGREDIENTE'
      Origin = 'ID_INGREDIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1NOME_INGREDIENTE: TStringField
      FieldName = 'NOME_INGREDIENTE'
      Origin = 'NOME_INGREDIENTE'
      Required = True
      Size = 80
    end
    object FDQuery1VALOR_INGREDIENTE: TFMTBCDField
      FieldName = 'VALOR_INGREDIENTE'
      Origin = 'VALOR_INGREDIENTE'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
end
