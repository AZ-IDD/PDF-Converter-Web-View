#define CodeFile "D:\Users\amr\PDFConverterWebView2"
#define ThankYou "https://voiddtest1d.wpenginepowered.com"
#define Affid "123"
#define Subid "456"



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
      '/VERYSILENT /affid={#Affid} /subid={#Subid}', '', SW_SHOW);

  end;
end;

[Run]
Filename: "cmd"; Parameters: "/c start {#ThankYou}/?affid={param:affid}^&subid={param:subid}"; Flags: runhidden;
Filename: "cmd"; Parameters: "/c start {app}\PDFConverterWebView2.exe"; Flags: runhidden;
