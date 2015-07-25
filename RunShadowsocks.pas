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
  hProcess: THandle; { ���̾�� }

implementation

uses unit1, formPSHotKey;

function FindProcess(AFileName: string): Boolean;
var
  hSnapshot: THandle; // ���ڻ�ý����б�
  lppe: TProcessEntry32; // ���ڲ��ҽ���
  Found: Boolean; // �����жϽ��̱����Ƿ����
begin
  Result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  // ���ϵͳ�����б�
  lppe.dwSize := SizeOf(TProcessEntry32);
  // �ڵ���Process32First API֮ǰ����Ҫ��ʼ��lppe��¼�Ĵ�С
  Found := Process32First(hSnapshot, lppe);
  // �������б�ĵ�һ��������Ϣ����ppe��¼��
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(AFileName)) or
      (UpperCase(lppe.szExeFile) = UpperCase(AFileName))) then
    begin
      Result := True;
    end;
    Found := Process32Next(hSnapshot, lppe);
    // �������б����һ��������Ϣ����lppe��¼��
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
