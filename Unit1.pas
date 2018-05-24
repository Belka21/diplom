unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage, IdSSL, IdSSLOpenSSL,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack;

type
  TForm1 = class(TForm)
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
SMTP:TIdSMTP;
Email:TIdMessage;
begin
SMTP := TIdSMTP.Create(nil);
  Email := TIdMessage.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  try
   // SSLHandler.MaxLineAction := maException;
    SSLHandler.SSLOptions.Method := sslvTLSv1;
    SSLHandler.SSLOptions.Mode := sslmUnassigned;
    SSLHandler.SSLOptions.VerifyMode := [];
    SSLHandler.SSLOptions.VerifyDepth := 0;

    SMTP.IOHandler := SSLHandler;
    SMTP.Host := 'smtp.mail.ru';
    SMTP.Port := 465;
    SMTP.Username := 'blackbelka21@mail.ru';
    SMTP.Password := 'A232323a';
    SMTP.UseTLS := utUseExplicitTLS;
    SMTP.AuthType:=satDefault;

    Email.From.Address := 'blackbelka21@mail.ru';
    Email.Recipients.EmailAddresses := 'qfpm11@mail.ru';
    Email.Subject := 'Hello world!';
    Email.Body.Text := 'Hello';

    SMTP.Connect;
    SMTP.Send(Email);
    SMTP.Disconnect;

  finally
    SMTP.Free;
    Email.Free;
    SSLHandler.Free;
  end;


{SMTP:=TIdSMTP.Create(nil);
SMTP.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
SMTP.Host := 'smtp.gmail.com';
SMTP.Port := 25;
//SMTP.UseTLS := utUseExplicitTLS;
SMTP.Username := 'blackbelka21@gmail.com';
SMTP.Password := 'Bcnbyfdbcnbyt23';

Email:= TIdMessage.Create(nil);
Email.From.Address := 'blackbelka21@gmail.com';
Email.Recipients.EmailAddresses := 'qfpm11@mail.ru';
Email.Subject := 'Hi';
Email.Body.Text := 'Hi';

SMTP.Connect;
SMTP.Send(Email);
SMTP.Disconnect;   }
end;

end.
