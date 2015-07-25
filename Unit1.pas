unit Unit1;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,

  Dialogs, TLhelp32, shellapi, StdCtrls, Types, ShlObj, ActiveX, ComObj,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ComCtrls, Registry,
  Vcl.OleCtrls, SHDocVw, {该函数使用的单元} IOUtils, Wininet, StrUtils, MPlayer,
  mmsystem, ToolWin, IniFiles, System.Zip, Vcl.Imaging.pngimage,
  Vcl.Imaging.GIFImg, IdHashSHA, Typinfo,
  Vcl.ImgList, Vcl.Grids, FireDAC.Stan.Def, FireDAC.Phys.ASAWrapper,
  IdBaseComponent, IdAntiFreezeBase, Vcl.IdAntiFreeze, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.ASA, math, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdAuthentication, System.ImageList,
  nb30;


type
  PASTAT = ^TASTAT;

  TASTAT = record
    adapter: TAdapterStatus;
    name_buf: TNameBuffer;
  end;

type
  EIdReadTimeout = class(Exception)

  END;

type
  EIdSocketError = class(Exception)
  end;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Timer1: TTimer;
    N15: TMenuItem;
    N9: TMenuItem;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    Timer2: TTimer;
    BalloonHint1: TBalloonHint;
    N5: TMenuItem;
    N13: TMenuItem;
    N8: TMenuItem;
    TrayIcon2: TTrayIcon;
    IdHTTP1: TIdHTTP;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    APPID1: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N8DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure onionDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N13Click(Sender: TObject);
    procedure N18DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N19DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N20DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure O1Click(Sender: TObject);
    procedure O1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N26Click(Sender: TObject);
    procedure N26DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N27DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure FormShow(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure RC41Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure IP1Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N1111Click(Sender: TObject);
    procedure N1221Click(Sender: TObject);
    procedure N1321Click(Sender: TObject);
    procedure N1441Click(Sender: TObject);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure APPID1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
    procedure SysCommand(var SysMsg: TMessage); message WM_SYSCOMMAND;
  public
    { Public declarations }

  end;

function SetLayeredWindowAttributes(hwnd: hwnd; crKey: Longint; bAlpha: byte;
  dwFlags: Longint): Longint; stdcall; external user32; // 函数声明

var
  StrVerification: string;
  strRc4data: string;
  Form1: TForm1;
  hr: thandle;
  StrLibeaySha1, StrSsleaySha1: string;
  GetIniStartTime, GetIniEndTime: integer;
  GetPngStartTime, GetPngEndTime: integer;
  ElapseIniTime, ElapsePngTime: integer;
  item: TListItem;
  Summ: Word; // read process
  ContinueLoop: BOOL;
  NewItem: TListItem;
  slist: TStringList; // 存储文本文件内容
  pstrarray: array of string; // 数组
  i, icount: integer;
  mytitle, mytext: string;
  createini: TiniFile; // ------------
  p, dynamic, ini, pp, newday: integer;
  delappid, aa, c, d, self1, strHideFile, strdec: string;
  ai, strfox, strgo, Temfox, Temgo: string;
  icondata: tnotifyicondata;
  myinifile, myinifile1: TiniFile;
  e, b: string;
  vi, a, ComA, ComB: integer;
  filename, filename2: string;
  // MyStream: TMemIniFile;
  // --------------
  Reg: TRegistry;
  SEX: integer;
  info: INTERNET_PROXY_INFO;
  StrEncrypt, StrEncrypt1: string;
  protectFile: TFileStream;
  myThread: TThread;
    StrShaKylin, StrShaFirefox: string;
  Strfirefox, Strfirefox1: string;
  StrCountry: string;
  StrUpdate: string;
  Strkylinpath: string;
  StrMyPath: string;
  StrGetVolumeID: string;
  StrEncryption: string;
  StrEncryptionGet: string;
  StrJudgment: string; // read google_hk iplist Value
  MyStream, MyStream2: TMemoryStream;
  DownLoadImage: TFileStream;
  Stropenssl: string; // open ssl Release

function GetFile_SHA1(const iFileName: string): string; // 获取文件SHA1

implementation

uses Unit2, Unit4, Unit5, Unit3, unit7, formPSHotKey, Unit9, Unit10;

{$R *.dfm}
{$R test.res}

function DayOfWeek(const DateTime: TDateTime): Word;
begin
  Result := DateTimeToTimeStamp(DateTime).Date mod 7 + 1;
end;

function PropertyExists(const AObject: TObject;
  const APropName: string): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(AObject.ClassInfo, APropName);
  Result := Assigned(PropInfo);
end;

function GetObjectProperty(const AObject: TObject;
  const APropName: string): TObject;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := GetPropInfo(AObject.ClassInfo, APropName);
  if Assigned(PropInfo) and (PropInfo^.PropType^.Kind = tkClass) then
    Result := GetObjectProp(AObject, PropInfo);
end;


 
  function DeleteDirectory(NowPath: string): Boolean; // 删除整个目录
var
  search: TSearchRec;
  ret: integer;
  Key: string;
begin
  if NowPath[Length(NowPath)] <> '\' then
    NowPath := NowPath + '\';
  Key := NowPath + '*.*';
  ret := findFirst(Key, faanyfile, search);
  while ret = 0 do
  begin
    if ((search.Attr and fadirectory) = fadirectory) then
    begin
      if (search.Name <> '.') and (search.Name <> '..') then
        DeleteDirectory(NowPath + search.Name);
    end
    else
    begin
      if ((search.Attr and fadirectory) <> fadirectory) then
      begin
        deletefile(NowPath + search.Name);
      end;
    end;
    ret := FindNext(search);
  end;
  findClose(search);
  removedir(NowPath);
  Result := True;
end;


procedure TForm1.SysCommand(var SysMsg: TMessage); // 最小化 隐藏到 托盘
begin
  case SysMsg.WParam of
    SC_CLOSE:
      begin
        // 当最小化时
        SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
          SWP_HIDEWINDOW);
        Form1.hide; // 在任务栏隐藏程序
      end;

  else
    inherited;
    case SysMsg.WParam of
      SC_MINIMIZE:
        begin
          // 当最小化时
          SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
            SWP_HIDEWINDOW);
          Form1.hide; // 在任务栏隐藏程序
        end;
    else
      inherited;

    end;
  end;
end;

procedure ExtractRes(ResType, ResName, ResNewName: string);
var
  Res: TResourceStream;
begin // 释放资源文件library.ini
  Res := TResourceStream.Create(Hinstance, ResName, PChar(ResType));
  Res.SavetoFile(ResNewName);
  Res.Free;
end; // 这个方法意思是释放资源文件   有三个参数
// 一个资源类型   2 资源名字   生成资源的名字

// ----------------------------------------------------

procedure RefreshControl(Control: TControl);
/// 解决 托盘重现显示窗体控件 无法重画的问题
var
  i: integer;
begin
  Control.Invalidate;
  if Control is TWinControl then
    for i := 0 to TWinControl(Control).ControlCount - 1 do
      RefreshControl(TWinControl(Control).Controls[i]);
end;
// ----------------------------------------------------------

function FindProcess(AFileName: string): Boolean;
var
  hSnapshot: thandle; // 用于获得进程列表
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
// ----------------------------------------------------------------------------------------------------------

function CheckTask(ExeFileName: string): Boolean;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: thandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := False;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))
      = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(ExeFileName))) then
      Result := True;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
end;

function KillTask(ExeFileName: string): integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: Boolean;
  FSnapshotHandle: thandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))
      = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(ExeFileName))) then
      Result := integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
        FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;
// -----------------------------------------------------------------------------



function SubStrConut(mStr, mSub: string): integer; // 返回mSub字符串在mStr字符串中的个数
begin
  Result := (Length(mStr) - Length(StringReplace(mStr, mSub, '', [rfReplaceAll])
    )) div Length(mSub);
end;

procedure SetUserEnvironmentVariable(const Name, Value: string);
var
  strpath: string;
  countgood: integer;
  aResult: PDWORD_PTR;
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Environment', False);
      strpath := readstring('Path');
      // showmessage(strpath);
      countgood := SubStrConut(strpath, Value);
      if countgood = 0 then
      begin
        writestring(name, strpath + ';' + Value);
        aResult := nil; { <--- }
        SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0,
          LPARAM(PChar('Environment')), SMTO_NORMAL, 4000, aResult);
      end
      else
      begin

        sleep(50); // showmessage('重复操作');
      end;

    finally
      Free
    end
end;


procedure TForm1.Timer1Timer(Sender: TObject);
var
  wnd: integer;
  strCheck: string;
  hi, comdate: integer;
  StartTime, EndTime: integer;
begin

  Timer1.Enabled := False;

  if FindProcess('badouTech.exe') then
  begin
    frmPSHotKey.ProgressBar1.Position := 100;
    frmPSHotKey.ProgressBar1.Max := 100;


GetPngEndTime := GetTickCount; // 计时结束
frmPSHotKey.ProgressBar1.Position := 100;
frmPSHotKey.ProgressBar1.Max := 100;
frmPSHotKey.Label2.Caption := '100%';
// frmPSHotKey.Label6.Visible := True;

frmPSHotKey.Timer1.Enabled := True;

end
else
begin
  frmPSHotKey := TfrmPSHotKey.Create(Self); // 实际生成窗口。
  frmPSHotKey.Show;
  frmPSHotKey.Timer1.Enabled := True;
  frmPSHotKey.Label4.Caption := 'Launching Fail';
  frmPSHotKey.Update;
  N4.Enabled := True;
end;


form2.Timer2.Enabled := True;

end;


procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm1.APPID1Click(Sender: TObject);

begin

  form9.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
// ------------------------------------------------------
var

  mytitle, mytext, xpx, Music: string;
  ee: string;
  vi, ComA, ComB: integer;
  oldtitle: string;
  SEX: integer;
  Reg: TRegistry;
  a, ai: string;
  info: INTERNET_PROXY_INFO;
  re_id: integer;
  registerTemp: TRegistry;
  inputstr, get_id: string;
  dy, clickedok: Boolean;
  Zip: TZipFile;
  // --------------
  strcopysource, strcopyobject: string;
  Dir: TDirectory;
  files: TStringDynArray; // 需要 Types 单元支持
  Str: string;
  // --------------------
  hr: thandle;
  l: Longint; // 窗体透明申明
  strrich, strCheck, path: string;
  ARegistry: TRegistry;
  TOM: string;
  Titem: TListItem;
  Intsetenvironment: integer;

begin

  SetWindowPos(Form1.Handle, Hwnd_Topmost, 0, 0, 0, 0,
    (SWP_NOMOVE Or SWP_NOSIZE));

  StrGetVolumeID := GetVolumeID;
  StrEncryption := Rc4(1, StrGetVolumeID, 'sheismysin', 4); //
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
    getWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW);

  TrayIcon1.ShowBalloonHint;
  N3.Checked := True;
  SetWindowLong(Application.Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW);
  // 让启动窗体不显示在任务栏！
  // ---------------------------------------------------------------
  l := getWindowLong(Handle, GWL_EXSTYLE);
  l := l or WS_EX_LAYERED;
  SetWindowLong(Handle, GWL_EXSTYLE, l);
  SetLayeredWindowAttributes(Handle, 0, 255, LWA_ALPHA);
  // hr:=createroundrectrgn(0,0,width,height,20,20);
  setwindowrgn(Handle, hr, True);

  Application.ShowMainForm := False;
  self1 := ExtractFileDir(Application.Exename);
  StrMyPath := ExtractFileName(Application.Exename);

  TrayIcon1.Hint := '谷歌助手v1.3';

  Strkylinpath := GetEnvironmentVariable('APPDATA') + '\badouTech\';
  Stropenssl := GetEnvironmentVariable('APPDATA');

 
  // ----------------------------------------------
  if FileExists(Strkylinpath + 'Lahn7cii.run') then
  begin
    sleep(50);
    // showmessage(Strkylinpath+'更新成功');
  end
  else
  begin
    // showmessage(Strkylinpath+'正在更新');
    KillTask('badouTech.exe');
    DeleteDirectory(Strkylinpath);
    sleep(2000);

    if DirectoryExists(Strkylinpath) then
    begin
      sleep(50)
    end // 创建ringhacker的文件夹
    else
    begin
      CreateDirectory(PChar(Strkylinpath), nil);

    end;
    // ===========================释放压缩文件=============================================
    if FileExists(Strkylinpath + 'kylin.zip') then
    begin
      // ShowMessage(Strkylinpath+'\kylin.zip');

      sleep(50);

    end
    else
    begin
      // ShowMessage('kylin.zip');
      ExtractRes('EXEFILE', 'test', Strkylinpath + 'kylin.zip');

      // 从资源文件中释放压缩文件
    end;

    if FileExists(Strkylinpath + 'Lahn7cii.run') then
    begin
      // showmessage('解压成功');
      sleep(50);
    end
    else
    begin
      Zip := TZipFile.Create;
      Zip.Open(Strkylinpath + 'kylin.zip', TZipMode.zmRead);
      Zip.ExtractAll(Strkylinpath);
      Zip.Free; // 结束解压

    end;
  end;
  

  strgo := Strkylinpath;

   try
    try
    frmPSHotKey.Label2.Caption := '从服务器读取数据中...';
    frmPSHotKey.Update;

    IdHTTP1.ReadTimeout := 7000;
    IdHTTP1.ConnectTimeout := 7000;
    MyStream := TMemoryStream.Create;
    IdHTTP1.Get('http://yourserver/download/gui-config.json', MyStream);

    GetIniEndTime := GetTickCount; // 计时结束
    MyStream.SavetoFile(Strkylinpath + 'gui-config.json');

    sleep(2500);
  finally

    MyStream.Free;
  end;
except
  on e: EIdHTTPProtocolException do
  begin
    showmessage('timeout');
  end;

  on e: EIdHTTPProtocolException do
  begin
    frmPSHotKey.Label2.Caption := '83%';
    frmPSHotKey.Label4.Visible := True;
    frmPSHotKey.Label4.Caption := 'HttpprotocolError...';
    frmPSHotKey.Update;

    // showmessage('网络超时');
  end;

  on e: EIdOSSLCouldNotLoadSSLLibrary do
  begin
    frmPSHotKey.Label2.Caption := '83%';
    frmPSHotKey.Label4.Visible := True;
    frmPSHotKey.Label4.Caption := 'Could not load SSL library';
    frmPSHotKey.Update;
    sleep(2000);
    // showmessage('网络超时');
  end;

  on e: EIdReadTimeout do
  begin
    frmPSHotKey.Label2.Caption := '83%';
    frmPSHotKey.Label4.Visible := True;
    frmPSHotKey.Update;
    frmPSHotKey.Label4.Caption := '尝试连接到其他备用服务器1...';
    N81.Click;
    N81.Checked := True;
    frmPSHotKey.Update;
    sleep(2000);

  end;

  on e: EIdSocketError do
  begin
    frmPSHotKey.Label2.Caption := '83%';
    frmPSHotKey.Label4.Visible := True;
    frmPSHotKey.Label4.Caption := 'EocketError...';
    frmPSHotKey.Update;
  end;

end;
//download config file

  if not FindProcess('badouTech.exe') then
  begin

    sleep(1500);
    checkprocess.Create(False);
    frmPSHotKey.ProgressBar1.Position := 49;
    frmPSHotKey.ProgressBar1.Max := 100;
    frmPSHotKey.Label2.Caption := '49.8%';
    frmPSHotKey.Update;
    sleep(2000);
  end
  else
  begin
    frmPSHotKey.ProgressBar1.Position := 49;
    frmPSHotKey.ProgressBar1.Max := 100;
    frmPSHotKey.Label2.Caption := '49.8%';
    frmPSHotKey.Update;
    sleep(50);

  end;

  N4.Enabled := True;
  Timer1.Enabled := True;
end;

procedure TForm1.FormHide(Sender: TObject);
begin
  ANimateWindow(Handle, 3000, AW_BLEND + AW_HIDE);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Application.MainFormOnTaskbar := False;
end;

procedure TForm1.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  Application.ProcessMessages;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  Form1.hide;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  Form1.hide;
end;


procedure TForm1.Label1Click(Sender: TObject);
var
  wnd: integer;
begin
  ShellExecute(wnd, 'Open', PChar('https://twitter.com/onionhacker'), nil,
    nil, SW_show);
end;

procedure TForm1.Label2Click(Sender: TObject);
var
  wnd: integer;
begin
  ShellExecute(wnd, 'Open',
    PChar('https://plus.google.com/u/0/communities/100095559541855774106'), nil,
    nil, SW_show);
end;


procedure TForm1.N7Click(Sender: TObject);
begin
  form10.Show;
end;

end.
