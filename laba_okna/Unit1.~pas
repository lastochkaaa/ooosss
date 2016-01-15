unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if findwindow(nil,'Корзина')<>0 then
  begin
    showmessage('Окно присутствует');
    setwindowtext(findwindow(nil,'Корзина'), 'Урна');
    if IsIconic(findwindow(nil,'Урна'))
    then OpenIcon(findwindow(nil,'Урна'))
    else showwindow(findwindow(nil,'Урна'),SW_MINIMIZE);
  end
  else showmessage('Окно отсутствует');
end;

function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;
Var Nm:Array[0..255] of Char; // буфер для имени
    Cs: Array[0..255] of Char; // буфер для класса
Begin
  Form1.ListBox1.Items.Add(IntToStr(Wd)); // Добавляем текущий описатель
  GetWindowText(Wd,Nm,255); // считываем текст заголовка окна
  GetClassName(Wd,Cs,255); // считываем название класса окна
  If Wd<>Form1.Handle then
  Form1.ListBox1.Items.Add(String(Nm)+'/'+String(Cs));// Добавляем название окна и класс в список
  EnumProc := TRUE; // продолжать искать окна
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ListBox1.Items.Clear;
  EnumWindows(@Enumproc, 0);
end;

procedure TForm1.Button3Click(Sender: TObject);
var hnd: THandle;
    canvas: TCanvas;
    dc: Hdc;
begin
hnd:=findwindow(nil,'Form1');
hnd:=findwindowEx(hnd,0,'Form1.ListBox1',0);
canvas:=Tcanvas.Create;
dc:=getdc(hnd);
with canvas do
  begin
  handle:=dc;
  rectangle(0,0,385,217);
  font.Color:=$0000ff;
  textout(200,200,'фатальная');
  textout(250,200,'ошибка');
  free;
  end;
releasedc(0,dc);
end;

end.
 
