unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FileCtrl, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  c, x:TFileStream;
  str,s:string;
  Dir:string;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);

begin
  if DirectoryExists(Edit1.Text) then
    Label1.Caption:=Edit1.Text+'уже был создан'

  else
    begin
    Dir:=Label1.Caption+'\'+Edit1.Text;
    ForceDirectories(Dir);
    if DirectoryExists(Dir) then
      Label1.Caption:= Dir ;
    end;
  end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  str:=Edit2.Text;
  x:=TFileStream.Create(Edit2.Text+'.txt',fmOpenWrite OR fmCreate);
  x.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  s:=Label1.Caption+'\'+Edit2.Text;
  x:=TFileStream.Create(s,fmOpenRead);
  c:=TFileStream.Create(Label1.Caption+'\'+str+'copy'+'.txt',fmOpenWrite OR fmCreate);
  c.CopyFrom(x,x.Size);
  x.Free;
  c.Free;
  s:='';
  str:='';
end;

procedure RemoveAll(path: string);
var sr: TSearchRec;
begin
if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
begin
repeat
if sr.Attr and faDirectory = 0 then
begin
DeleteFile(path + '\' + sr.name);
end
else
begin
if pos('.', sr.name) <= 0 then
RemoveAll(path + '\' + sr.name);
end;
until
FindNext(sr) <> 0;
end;
FindClose(sr);
RemoveDirectory(PChar(path));
end;




procedure TForm1.Button4Click(Sender: TObject);
begin
  if SelectDirectory('Удаление каталога', '', dir) then
  RemoveAll(dir);
end;

end.
