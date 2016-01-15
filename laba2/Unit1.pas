unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i : integer;

implementation


uses
Unit2 , Unit3;
{$R *.dfm}
var x: MyThread;
y: MyThread2;
procedure TForm1.Button1Click(Sender: TObject);
begin
i:=0;
x:=MyThread.Create(true);
x.Resume;
x.Priority:=tpIdle;
y:=MyThread2.Create(true);
y.Resume;
y.Priority:=tpTimeCritical;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
i:= i + 1;
if i mod 2 <> 0 then
x.Suspend
else x.Resume;
if i mod 2 <> 0 then
y.Suspend
else y.Resume;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
x.Terminate;
y.Terminate;
Label1.Caption:= '0';
Label2.Caption:= '0';
end;

end.
