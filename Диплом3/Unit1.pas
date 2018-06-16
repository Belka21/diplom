unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ADODB, DB, DBTables, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage, IdSSL, IdSSLOpenSSL,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, ComCtrls, Unit2;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
var
PostMail:MailPost;
i:integer;
begin

if Edit3.Text<>'0' then
begin
  if StrToInt(Edit3.Text)<=DBGrid1.FieldCount then
    begin
      for i:= 1 to StrToInt(Edit3.Text) do
        begin
          DBGrid1.DataSource.DataSet.RecNo:=i;
          DBGrid1.SelectedRows.CurrentRowSelected:=true;
        end;
     // DBGrid1.DataSource.DataSet.Next;
    end;
end;

PostMail:=MailPost.Create(true);
PostMail.Priority:=tpLower;
PostMail.FreeOnTerminate:=true;
PostMail.Resume;
end;

  {SMTP := TIdSMTP.Create(nil);
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
    SMTP.Username := 'blackbelka21@mail.ru';
    SMTP.Password := 'A232323a';
    SMTP.UseTLS := utUseExplicitTLS;
    SMTP.AuthType:=satDefault;

    Email.From.Address := 'blackbelka21@mail.ru';
    Email.Recipients.EmailAddresses := 'qfpm11@mail.ru';
    Email.Subject := 'Hello world!';
    Email.Body.Text :=StringOf(B);

    SMTP.Connect;
    SMTP.Send(Email);
    SMTP.Disconnect;

  finally
    SMTP.Free;
    Email.Free;
    SSLHandler.Free;
  end;    }

  {DBGrid1.DataSource.DataSet.RecNo:=1;
  DBGrid1.SelectedRows.CurrentRowSelected:=true;
  DBGrid1.DataSource.DataSet.RecNo:=2;
    DBGrid1.SelectedRows.CurrentRowSelected:=true; }


procedure TForm1.Button2Click(Sender: TObject);
var
s:string;
begin
if ADOConnection1.Connected=true then
  begin
  s:=InputBox('Поиск', 'Введите', '');
     try
        ADOQuery2.Active:=False;
        ADOQuery2.Close;
        ADOQuery2.SQL.Clear;
        ADOQuery2.SQL.Add('SELECT КодСт, ФС, ИО,  ДомТел, МобТел, email, ВступБал FROM Студент WHERE  (:s LIKE ФС ) OR  (:b LIKE ИО )');
        ADOQuery2.Parameters.ParamByName('b').Value:=s;
        ADOQuery2.Parameters.ParamByName('s').Value:=s;
        ADOQuery2.Active:=true;
      except
        ShowMessage('SQL 2.2 Error');
      end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if ADOConnection1.Connected=true then
  begin
     try
        ADOQuery2.Active:=False;
        ADOQuery2.Close;
        ADOQuery2.SQL.Clear;
        ADOQuery2.SQL.Add('SELECT КодСт, ФС, ИО,  ДомТел, МобТел, email, ВступБал FROM Студент WHERE  (email IS NULL)');
        ADOQuery2.Active:=true;
      except
        ShowMessage('SQL 2.2 Error');
      end;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
s:string;
begin
  if ADOConnection1.Connected=true then
  begin
    try
      ADOQuery1.Active:=False;
     ADOQuery1.Close;
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Add('SELECT КодСп FROM Специальность WHERE НазвСпРосс = :s');
     ADOQuery1.Parameters.ParamByName('s').Value:=ComboBox1.Text;
     ADOQuery1.Active:=true;
     s:=ADOQuery1.Fields[0].AsString;
      try
        ADOQuery2.Active:=False;
        ADOQuery2.Close;
        ADOQuery2.SQL.Clear;
        ADOQuery2.SQL.Add('SELECT КодСт, ФС, ИО, ДомТел, МобТел, email, ВступБал FROM Студент, ТабСтСпец WHERE (ТабСтСпец.КодСтуд = Студент.КодСт) AND (ТабСтСпец.КодСпец = :s)');
        ADOQuery2.Parameters.ParamByName('s').Value:=s;
        ADOQuery2.Active:=true;
      except
        ShowMessage('SQL 2.1 Error');
      end;
    except
     ShowMessage('SQL 1.2 Error');
    end;
  end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 ss : string;
begin
  if adoquery2.FieldByName(Column.FieldName).Tag=1 then
   begin
    ss := ' ASC';
    adoquery2.FieldByName(Column.FieldName).Tag := 0;
   end
  else
   begin
    ss := ' DESC';
    adoquery2.FieldByName(Column.FieldName).Tag := 1;
   end;
 adoquery2.Sort:=Column.FieldName + ss;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if (Key in ['0' .. '9', decimalseparator]) then
if Edit3.Text<>'' then
if (StrToInt(Edit3.Text)>DBGrid1.DataSource.DataSet.RecordCount) or (StrToInt(Key)>DBGrid1.DataSource.DataSet.RecordCount) then
begin
   Key:= #0;
   Edit3.Text:='';
   Edit3.Text:=IntToStr(DBGrid1.DataSource.DataSet.RecordCount) ;
end;
if (Edit3.Text='') and (StrToInt(Key)>DBGrid1.DataSource.DataSet.RecordCount) then
begin
   Key:= #0;
   Edit3.Text:='';
   Edit3.Text:=IntToStr(DBGrid1.DataSource.DataSet.RecordCount) ;
end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
i:=0;
  try
    ADOConnection1.Connected:=true;
  except
    ShowMessage('Error conection');
  end;
  if ADOConnection1.Connected=true then
  begin
    try
      ADOQuery1.Active:=False;
     ADOQuery1.Close;
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Add('SELECT НазвСпРосс FROM Специальность');
     ADOQuery1.Active:=true;
     ComboBox1.Items.Clear;
     for i := 0 to ADOQuery1.RecordCount - 1 do
     begin
      ComboBox1.Items.Add(ADOQuery1.Fields[0].AsString);
      ADOQuery1.Next;
     end;
    except
      ShowMessage('SQL Error');
    end;
  end;
end;

end.
