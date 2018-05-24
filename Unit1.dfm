object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    Host = 'smtp.mail.ru'
    SASLMechanisms = <>
    Left = 32
    Top = 16
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    Body.Strings = (
      'Hello World!!!')
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
        Address = 'blackbelka@mail.ru'
        Name = 'Black Belka'
        Text = 'Black Belka <blackbelka@mail.ru>'
        Domain = 'mail.ru'
        User = 'blackbelka'
      end>
    From.Address = 'blackbelka@mail.ru'
    From.Name = 'Black Belka'
    From.Text = 'Black Belka <blackbelka@mail.ru>'
    From.Domain = 'mail.ru'
    From.User = 'blackbelka'
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 224
    Top = 32
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'smtp.mail.ru:25'
    Host = 'smtp.mail.ru'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 408
    Top = 48
  end
end
