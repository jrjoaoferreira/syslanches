object frmLanchesIngredientes: TfrmLanchesIngredientes
  Left = 0
  Top = 0
  Caption = 'Card'#225'pio / Cadastro de ingredientes para os lanches'
  ClientHeight = 413
  ClientWidth = 718
  Color = clCornsilk
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
    Width = 718
    Height = 35
    Align = alTop
    Caption = 'CARD'#193'PIO'
    Color = clCornsilk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 898
  end
  object Panel2: TPanel
    Left = 0
    Top = 35
    Width = 718
    Height = 378
    Align = alClient
    Color = clCornsilk
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 41
    ExplicitHeight = 403
    object GroupBox1: TGroupBox
      Left = 16
      Top = 6
      Width = 681
      Height = 107
      Caption = 'Lanche'
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 21
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 74
        Top = 21
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object dbCodLanche: TDBEdit
        Left = 11
        Top = 37
        Width = 54
        Height = 23
        DataField = 'ID_LANCHE'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
      end
      object dbNomeLanche: TDBEdit
        Left = 74
        Top = 37
        Width = 343
        Height = 23
        DataField = 'NOME_LANCHE'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBNavigator1: TDBNavigator
        Left = 433
        Top = 35
        Width = 232
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 2
      end
      object btIncluirIngredientes: TBitBtn
        Left = 433
        Top = 69
        Width = 232
        Height = 25
        Caption = 'Incluir ingredientes no lanche'
        TabOrder = 3
        OnClick = btIncluirIngredientesClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 122
      Width = 681
      Height = 226
      Caption = 'Ingredientes do lanche'
      TabOrder = 1
      object Label3: TLabel
        Left = 459
        Top = 202
        Width = 108
        Height = 15
        Caption = 'Valor total do lanche'
      end
      object DBGrid1: TDBGrid
        Left = 11
        Top = 25
        Width = 657
        Height = 168
        DataSource = DataSource2
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_INGREDIENTE'
            Title.Caption = 'C'#243'd. Ingrediente'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_INGREDIENTE'
            Title.Caption = 'Ingredientes'
            Width = 392
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_INGREDIENTE'
            Title.Caption = 'Valor'
            Visible = True
          end>
      end
      object txtVrTotal: TDBEdit
        Left = 576
        Top = 199
        Width = 92
        Height = 23
        BorderStyle = bsNone
        DataField = 'VRTOTAL'
        DataSource = DataSource3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 358
      Width = 716
      Height = 19
      Panels = <
        item
          Text = 
            'Para excluir um ingrediente do lanche, clique com o bot'#227'o direit' +
            'o do mouse no grid'
          Width = 50
        end>
      ExplicitLeft = 360
      ExplicitTop = 280
      ExplicitWidth = 0
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\DESEN\fb\LANCHES.FDB'
      'User_Name=SYSDBA'
      'Password=admin'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 280
  end
  object qryLanches: TFDQuery
    IndexFieldNames = 'ID_LANCHE'
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT DISTINCT LAN.ID_LANCHE, LAN.NOME_LANCHE '
      'FROM TBLANCHES LAN'
      
        'LEFT JOIN TBLANCHEINGREDIENTES TLI ON TLI.ID_LANCHE = LAN.ID_LAN' +
        'CHE')
    Left = 408
    Top = 288
    object qryLanchesID_LANCHE: TIntegerField
      FieldName = 'ID_LANCHE'
      Origin = 'ID_LANCHE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLanchesNOME_LANCHE: TStringField
      FieldName = 'NOME_LANCHE'
      Origin = 'NOME_LANCHE'
      Required = True
      Size = 100
    end
  end
  object qryIngredientes: TFDQuery
    IndexFieldNames = 'ID_LANCHE'
    MasterSource = DataSource1
    MasterFields = 'ID_LANCHE'
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT DISTINCT TLI.ID_LANCHE, TLI.ID_INGREDIENTE , ING.NOME_ING' +
        'REDIENTE, ING.VALOR_INGREDIENTE'
      'FROM TBLANCHEINGREDIENTES TLI'
      
        'INNER JOIN TBINGREDIENTES ING ON TLI.ID_INGREDIENTE = ING.ID_ING' +
        'REDIENTE ')
    Left = 216
    Top = 288
    object qryIngredientesID_LANCHE: TIntegerField
      FieldName = 'ID_LANCHE'
      Origin = 'ID_LANCHE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryIngredientesID_INGREDIENTE: TIntegerField
      FieldName = 'ID_INGREDIENTE'
      Origin = 'ID_INGREDIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryIngredientesNOME_INGREDIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_INGREDIENTE'
      Origin = 'NOME_INGREDIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryIngredientesVALOR_INGREDIENTE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_INGREDIENTE'
      Origin = 'VALOR_INGREDIENTE'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = qryLanches
    Left = 144
    Top = 288
  end
  object DataSource2: TDataSource
    DataSet = qryIngredientes
    Left = 456
    Top = 288
  end
  object fdqLanchesIngredientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT ID_LANCHE, ID_INGREDIENTE FROM TBLANCHEINGREDIENTES')
    Left = 272
    Top = 288
    object fdqLanchesIngredientesID_LANCHE: TIntegerField
      FieldName = 'ID_LANCHE'
      Origin = 'ID_LANCHE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqLanchesIngredientesID_INGREDIENTE: TIntegerField
      FieldName = 'ID_INGREDIENTE'
      Origin = 'ID_INGREDIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qryTotal: TFDQuery
    MasterSource = DataSource1
    MasterFields = 'ID_LANCHE'
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT SUM(ING.VALOR_INGREDIENTE) AS VRTOTAL'
      'FROM TBLANCHEINGREDIENTES TLI'
      
        'INNER JOIN TBINGREDIENTES ING ON TLI.ID_INGREDIENTE = ING.ID_ING' +
        'REDIENTE '
      'WHERE TLI.ID_LANCHE = :ID_LANCHE')
    Left = 536
    Top = 288
    ParamData = <
      item
        Name = 'ID_LANCHE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryTotalVRTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VRTOTAL'
      Origin = 'VRTOTAL'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 38
      Size = 2
    end
  end
  object DataSource3: TDataSource
    DataSet = qryTotal
    Left = 344
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 216
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
end
