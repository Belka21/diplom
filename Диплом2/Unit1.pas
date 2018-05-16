unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, Unit3;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    My:TMyThread;
    new:TNewMes;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  My:=TMyThread.Create(true);
  My.Priority:=tpLower;
  My.FreeOnTerminate:=true;
  my.Resume;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     new:=TNewMes.Create(true);
  new.Priority:=tpLower;
  new.FreeOnTerminate:=true;
  new.Resume;
end;

end.
