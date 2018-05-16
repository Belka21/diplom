unit Unit2;

interface

uses
  Classes, SysUtils, Variants, Dialogs, StdCtrls, lib, ssl_openssl, httpsend;

type
  TMyThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure memoadd;
  public
    login, pass, response: string;
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TMyThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }
uses Unit1, Unit3;
{ TMyThread }

procedure TMyThread.Execute;
var
id:string;
begin
  login:=Form1.Edit1.Text;
  pass:=Form1.Edit2.Text;
  id:='133246480';
  response:=send('GET','https://api.vk.com/method/messages.send?user_id='+id+'&message=Hello_World!!!&v=5.74&access_token=c3645174f92f3be7cadee19902dcd667be50738d5f6e25acedec24c38c0df8c4ad9a8e6a72a42ff681d36');
  Synchronize(memoadd);
end;

procedure TMyThread.memoadd;
begin
  form1.Memo1.Lines.Add(response);
end;

end.
 