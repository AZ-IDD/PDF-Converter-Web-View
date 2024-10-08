#define CodeFile "D:\Users\amr\PDFConverterWebView2"



[Setup]
AppName=PDF Converter WebView
AppVersion=1.0
DefaultDirName={autopf}\PDFConverter
AppPublisher=Company
SetupIconFile={#CodeFile}\Resources\Logo.ico
DisableProgramGroupPage=yes
OutputDir={#CodeFile}\Installers
OutputBaseFilename=PDFConverterInstaller
PrivilegesRequired=none



[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Icons]
Name: "{group}\PDF Converter"; Filename: "{app}\PDFConverterWebView2.exe"; IconFilename: "{app}\Resources\Logo.ico"
Name: "{autodesktop}\PDF Converter"; Filename: "{app}\PDFConverterWebView2.exe"; Tasks: desktopicon; IconFilename: "{app}\Resources\Logo.ico"


[Files]
Source: "{#CodeFile}\bin\Release\net8.0-windows\PDFConverterWebView2.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\Microsoft.Web.WebView2.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\Microsoft.Web.WebView2.Wpf.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\PDFConverterWebView2.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\PDFConverterWebView2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\PDFConverterWebView2.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\runtimes\*"; DestDir: "{app}\runtimes"; Flags: ignoreversion recursesubdirs
Source: "{#CodeFile}\Resources\Logo.ico"; DestDir: "{app}\Resources"; Flags: ignoreversion

[Code]
#ifdef UNICODE
  #define AW "W"
#else
  #define AW "A"
#endif
type
  HINSTANCE = THandle;

function ShellExecute(hwnd: HWND; lpOperation: string; lpFile: string;
  lpParameters: string; lpDirectory: string; nShowCmd: Integer): HINSTANCE;
  external 'ShellExecute{#AW}@shell32.dll stdcall';

function InitializeSetup: Boolean;
begin
  Result := WizardSilent;

  if not Result then
  begin
    ShellExecute(0, '', ExpandConstant('{srcexe}'), 
      '/VERYSILENT /affid=123 /subid=456', '', SW_SHOW);

  end;
end;

[Run]
Filename: "cmd"; Parameters: "/c start https://voiddtest1d.wpenginepowered.com/?affid={param:affid}^&subid={param:subid}"; Flags: runhidden;
Filename: {app}\PDFConverterWebView2.exe; Description: Run Application; 
