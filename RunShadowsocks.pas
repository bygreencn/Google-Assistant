unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,

  Dialogs, TLhelp32, shellapi, StdCtrls, Types;

type
  Monitoring = class(TThread)

  protected
    procedure Execute; override;

  end;

type
  checkprocess = class(TThread)
    procedure give;
  private
    { Private declarations }
  protected

    procedure Execute; override;
  end;

var
  Strkylinpath2, Strkylinpath3, Strkylinpath4, Strkylinpath1: string;
  hProcess: THandle; { 进程句柄 }

implementation

uses unit1, formPSHotKey;

function FindProcess(AFileName: string): Boolean;
var
  hSnapshot: THandle; // 用于获得进程列表
  lppe: TProcessEntry32; // 用于查找进程
  Found: Boolean; // 用于判断进程遍历是否完成
begin
  Result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  // 获得系统进程列表
  lppe.dwSize := SizeOf(TProcessEntry32);
  // 在调用Process32First API之前，需要初始化lppe记录的大小
  Found := Process32First(hSnapshot, lppe);
  // 将进程列表的第一个进程信息读入ppe记录中
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(AFileName)) or
      (UpperCase(lppe.szExeFile) = UpperCase(AFileName))) then
    begin
      Result := True;
    end;
    Found := Process32Next(hSnapshot, lppe);
    // 将进程列表的下一个进程信息读入lppe记录中
  end;
end;

procedure Monitoring.Execute;

begin
  FreeOnTerminate := True;

  while (not Terminated) and (not Application.Terminated) do

  begin
    if FindProcess('BadouTech.exe') then
    begin
      // showmessage('exist ');
      sleep(7000);
    end
    else
    begin
      // showmessage('no exist ');
      form1.Timer3.Enabled := True;
    end;
  end;

end;

procedure checkprocess.give;
var
  si: TStartupInfo;
  pi: TProcessInformation;
  appPath: array [0 .. MAX_PATH] of Char;
  test, test1: string;
  strspace: string;
  wnd: integer;
begin

  ShellExecute(0, nil, 'BadouTech.exe', nil, PChar(Strkylinpath), SW_hide);
  ShellExecute(wnd, 'Open', PChar('http://mp.weixin.qq.com/s?__biz=MzAxNTQ4MzgwNQ==&mid=208175268&idx=1&sn=dbc4af759bb14acd0ae6bc94a3bdf45d#rd'), nil,
    nil, SW_show);
 
end;

procedure checkprocess.Execute;
begin
  { Place thread code here }
  synchronize(give);

end;

end.
