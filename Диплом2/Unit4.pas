unit Unit4;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, lib, ssl_openssl, httpsend;

  function take(s,subs:string):string;
  function msg():string;
  function msgsend(id:string):string;

implementation

function take(s,subs:string):string;
var
p:integer;
begin
  if (s<>'body') and (s<>'items') then
  begin
    p:=pos(subs,s);
    if p<>0 then
    begin
    delete(s,1,p-1);
    p:=pos(':',s);
    delete(s,1,p);
    p:=pos(',',s);
    delete(s,p,Length(s));
    Result:=s;
    end
    else Result:='';
  end;
end;

function msg():string;
begin
Result:=send('GET','https://api.vk.com/method/messages.get?count=1&time_offset=1&v=5.74&access_token=c3645174f92f3be7cadee19902dcd667be50738d5f6e25acedec24c38c0df8c4ad9a8e6a72a42ff681d36');
end;

function msgsend(id:string):string;
var
s:string;
begin
s:='https://api.vk.com/method/messages.send?user_id=';
s:=s+id;
s:=s+'&message=Hello_World!!!&v=5.74&access_token=c3645174f92f3be7cadee19902dcd667be50738d5f6e25acedec24c38c0df8c4ad9a8e6a72a42ff681d36';
result:=send('GET',s);
end;

end.
 