unit Unit3;

interface

uses
  Classes, SysUtils, Variants, Dialogs, StdCtrls, lib, ssl_openssl, httpsend;

type
  TNewMes = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
     procedure memoadd;
  public
    respons: string;
  end;

implementation

uses Unit1, Unit4;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TNewMes.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TNewMes }

procedure TNewMes.Execute;
var
    id:string;
begin
while true do
  begin
    respons:= msg();
    if take(respons,'user_id')<>'' then
    begin
    id:= take(respons,'user_id');
    Synchronize(memoadd);
    respons:=msgsend(id);
    Synchronize(memoadd);
    end;
  end;
end;

procedure TNewMes.memoadd;
begin
form1.Memo1.Lines.Add(respons);
end;

end.
