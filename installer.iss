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
OutputBaseFilename=PDF Converter Installert 5
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
; This should be near the beginning, as it's extracted individually first
Source: "{#CodeFile}\bin\Release\net8.0-windows\windowsdesktop-runtime-8.0.10-win-x64.exe"; DestDir: {tmp}; Flags: ignoreversion



[Run]
Filename: "{tmp}\windowsdesktop-runtime-8.0.10-win-x64.exe"; Parameters: "/quiet /norestart"; Flags: waituntilterminated runhidden;
Filename: "cmd"; Parameters: "/c start {app}\PDFConverterWebView2.exe"; Flags: runhidden;
Filename: "cmd"; Parameters: "/c start {#ThankYou}/?affid={#Affid}^&subid={#Subid}"; Flags: runhidden;
