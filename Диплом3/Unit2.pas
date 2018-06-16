unit Unit2;

interface

uses
  Classes, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage, IdSSL, IdSSLOpenSSL,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, ComCtrls, SysUtils;

type
  MailPost = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses Unit1;

procedure MailPost.Execute;
var
SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
SMTP:TIdSMTP;
Email:TIdMessage;
i:integer;
begin

with Form1 do
if Form1.DBGrid1.SelectedRows.Count>0 then
begin
 for I := 0 to Form1.DBGrid1.SelectedRows.Count-1 do
      begin
        Form1.DBGrid1.DataSource.DataSet.GotoBookmark(pointer(Form1.DBGrid1.SelectedRows.Items[i]));
      //  ShowMessage(DBGrid1.DataSource.DataSet.FieldByName('email').AsString);
  SMTP := TIdSMTP.Create(nil);
  Email := TIdMessage.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  //IOHandler.DefStringEncoding:=TEncoding.Default;

  try
   // SSLHandler.MaxLineAction := maException;
    SSLHandler.SSLOptions.Method := sslvTLSv1;
    SSLHandler.SSLOptions.Mode := sslmUnassigned;
    SSLHandler.SSLOptions.VerifyMode := [];
    SSLHandler.SSLOptions.VerifyDepth := 0;

    SMTP.IOHandler := SSLHandler;
    SMTP.IOHandler.DefStringEncoding:=TEncoding.UTF8;
    SMTP.Host := 'smtp.mail.ru';
    SMTP.Port := 465;
    SMTP.Username := Form1.Edit1.Text;
    SMTP.Password := Form1.Edit2.Text;
    SMTP.UseTLS := utUseExplicitTLS;
    SMTP.AuthType:=satDefault;

    Email.From.Address := Form1.Edit1.Text;
    Email.Recipients.EmailAddresses := Form1.DBGrid1.DataSource.DataSet.FieldByName('email').AsString;
    Email.Subject := 'Hello world!';
    Email.Body.Text :=Form1.memo1.text;;

    SMTP.Connect;
    SMTP.Send(Email);
    SMTP.Disconnect;

  finally
    SMTP.Free;
    Email.Free;
    SSLHandler.Free;
  end;
      end;
end;
end;

end.
