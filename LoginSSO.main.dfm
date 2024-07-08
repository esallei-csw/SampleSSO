object frmLogInSSO: TfrmLogInSSO
  Left = 0
  Top = 0
  Caption = 'Sample-SSO'
  ClientHeight = 349
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblTenentID: TLabel
    Left = 16
    Top = 11
    Width = 45
    Height = 13
    Caption = 'TenentID'
  end
  object lblClientID: TLabel
    Left = 16
    Top = 38
    Width = 38
    Height = 13
    Caption = 'ClientID'
  end
  object lblredirecturi: TLabel
    Left = 16
    Top = 67
    Width = 61
    Height = 13
    Caption = 'Redirect URI'
  end
  object lblauthcode: TLabel
    Left = 16
    Top = 92
    Width = 51
    Height = 13
    Caption = 'Auth Code'
  end
  object lblAccessToken: TLabel
    Left = 17
    Top = 119
    Width = 65
    Height = 13
    Caption = 'Access Token'
  end
  object lblDisplayName: TLabel
    Left = 17
    Top = 147
    Width = 64
    Height = 13
    Caption = 'Display Name'
  end
  object lblEmail: TLabel
    Left = 17
    Top = 174
    Width = 28
    Height = 13
    Caption = 'E-Mail'
  end
  object btnLogIn: TButton
    Left = 48
    Top = 209
    Width = 233
    Height = 39
    Caption = 'SSO'
    TabOrder = 0
    OnClick = btnLogInClick
  end
  object edtTenentID: TEdit
    Left = 120
    Top = 8
    Width = 373
    Height = 21
    TabOrder = 1
  end
  object edtClientID: TEdit
    Left = 120
    Top = 35
    Width = 373
    Height = 21
    TabOrder = 2
  end
  object edtredirecturi: TEdit
    Left = 120
    Top = 62
    Width = 373
    Height = 21
    TabOrder = 3
  end
  object edtAuthCode: TEdit
    Left = 120
    Top = 89
    Width = 373
    Height = 21
    TabOrder = 4
  end
  object edtAccessToken: TEdit
    Left = 120
    Top = 116
    Width = 373
    Height = 21
    TabOrder = 5
  end
  object btnGetToken: TButton
    Left = 48
    Top = 254
    Width = 233
    Height = 37
    Caption = 'Get Token'
    TabOrder = 6
    OnClick = btnGetTokenClick
  end
  object btnGetUserData: TButton
    Left = 48
    Top = 297
    Width = 233
    Height = 37
    Caption = 'Get User Data'
    TabOrder = 7
    OnClick = btnGetUserDataClick
  end
  object edtEmail: TEdit
    Left = 120
    Top = 171
    Width = 373
    Height = 21
    TabOrder = 8
  end
  object edtDisplayName: TEdit
    Left = 120
    Top = 144
    Width = 373
    Height = 21
    TabOrder = 9
  end
  object btnLogOut: TButton
    Left = 296
    Top = 254
    Width = 91
    Height = 37
    Caption = 'Log Out'
    TabOrder = 10
    OnClick = btnLogOutClick
  end
  object btnFullLogIn: TButton
    Left = 296
    Top = 209
    Width = 91
    Height = 39
    Caption = 'Log In'
    TabOrder = 11
    OnClick = btnFullLogInClick
  end
  object btnWebView: TButton
    Left = 393
    Top = 209
    Width = 91
    Height = 39
    Caption = 'Login WebView'
    TabOrder = 12
    OnClick = btnWebViewClick
  end
  object btnWebViewLogout: TButton
    Left = 393
    Top = 254
    Width = 91
    Height = 37
    Caption = 'Logout WebView'
    TabOrder = 13
    OnClick = btnWebViewLogoutClick
  end
end
