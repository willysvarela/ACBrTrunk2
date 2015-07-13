; ler a vers�o do ACBrMonitor do arquivo versao.txt
#define FileHandle = FileOpen(AddBackslash(SourcePath) + "versao.txt")
#define FileLine = FileRead(FileHandle)
#define FileHandle FileClose(FileHandle)
#define MyAppVersion Str( FileLine )
#define MyAppVersion copy( MyAppVersion, pos("'", MyAppVersion) + 1, pos(";", MyAppVersion) )
#define MyAppVersion Copy( MyAppVersion, 0, pos("'", MyAppVersion) - 1 )

#define MyAppName "ACBrMonitorPLUS"
#define MyAppVerName MyAppName + '-' + MyAppVersion
#define MyAppPublisher "Projeto ACBr"
#define MyAppURL "http://acbr.sourceforge.net/ACBrMonitor.htm"
#define MyAppUrlName "ACBrMonitor.url"
#define MyAppExeName "ACBrMonitor.exe"
#define ACBrDIR "..\..\..\"

[Setup]
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=LICENCA.TXT
OutputBaseFilename={#MyAppVerName}-Windows-Instalador
Compression=lzma
SolidCompression=yes
AppMuTex=ACBrMonitor

[Types]
Name: full; Description: Instala��o Completa;
Name: compact; Description: Instala��o M�nima
Name: custom; Description: Instala��o Customizada; Flags: iscustom

[Components]
Name: programa; Description: Programa ACBrMonitor; Types: full compact custom; Flags: fixed
;Name: console; Description: ACBrMonitor modo Console; Types: full custom
Name: help; Description: Arquivos de Ajuda; Types: full custom
Name: exemplos; Description: Exemplos de Uso; Types: full custom

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: firewallopen; Description: "Liberar {#MyAppName}, porta 3434, no Firewall do Windows"; GroupDescription: "Firewall:"

[Files]
; Aplica��o
Source: {#MyAppExeName}; DestDir: {app}; Flags: ignoreversion; Components: programa
Source: banner_acbrmonitor.gif; DestDir: {app}; Flags: ignoreversion; Components: programa
;Source: ACBrMonitorConsole.exe; DestDir: {app}; Flags: ignoreversion; Components: console
Source: {#ACBrDIR}\Exemplos\ACBrSerial\ACBrECF\Lazarus\ECFTeste.exe; DestDir: {app}; Flags: ignoreversion; Components: programa
;Arquivos de configura��o
Source: PRICETAB.TXT; DestDir: {app}; Flags: onlyifdoesntexist; Components: programa
Source: ACBrNFeServicos.ini; DestDir: {app}; Flags: ignoreversion; Components: programa
;Exemplos
Source: Exemplos\TesteTXT.BAT; DestDir: {app}\Exemplos; Flags: ignoreversion; Components: exemplos
Source: Exemplos\Clipper_TXT_xHarbour_Socket.zip; DestDir: {app}\Exemplos; Flags: ignoreversion; Components: exemplos
Source: Exemplos\Cobol_TXT_Socket.zip; DestDir: {app}\Exemplos; Flags: ignoreversion; Components: exemplos
Source: Exemplos\Java_socket.txt; DestDir: {app}\Exemplos; Flags: ignoreversion; Components: exemplos
Source: Exemplos\Oracle.txt; DestDir: {app}\Exemplos; Flags: ignoreversion; Components: exemplos
Source: Exemplos\php_socket.zip; DestDir: {app}\Exemplos; Flags: ignoreversion; Components: exemplos
;Logotipos de Bancos
Source: {#ACBrDIR}\Fontes\ACBrBoleto\Logos\Colorido\*.*; DestDir: {app}\Logos; Flags: ; Components: programa
;Licen�a de uso
Source: LICENCA.TXT; DestDir: {app}; Flags: ignoreversion; Components: programa
Source: LICENSE.TXT; DestDir: {app}; Flags: ignoreversion; Components: programa
;Arquivos de Ajuda e documenta��o
Source: ACBrMonitor.chm; DestDir: {app}; Flags: ignoreversion; Components: help
Source: ACBrMonitor.pdf; DestDir: {app}; Flags: ignoreversion; Components: help
;DLL para acesso direto a portas
Source: {#ACBrDIR}\DLLs\Diversos\inpout32.dll; DestDir: {syswow64}; Flags: ; Components: programa
;OpenSSL
Source: {#ACBrDIR}\DLLs\OpenSSL\0.9.8.14\openssl.exe; DestDir: {app}; Flags: ; Components: programa
Source: {#ACBrDIR}\DLLs\OpenSSL\0.9.8.14\libeay32.dll; DestDir: {app}; Flags: ; Components: programa
Source: {#ACBrDIR}\DLLs\OpenSSL\0.9.8.14\ssleay32.dll; DestDir: {app}; Flags: ; Components: programa
Source: {#ACBrDIR}\DLLs\Diversos\msvcr71.dll; DestDir: {app}; Components: programa;  Flags: sharedfile 
;DLLs CAPICOM
Source: {#ACBrDIR}\DLLs\Capicom\capicom.dll; DestDir: {syswow64}; Components: programa; Flags: regserver sharedfile
Source: {#ACBrDIR}\DLLs\Capicom\msxml5.dll; DestDir: {syswow64}; Components: programa; Flags: regserver sharedfile
Source: {#ACBrDIR}\DLLs\Capicom\msxml5r.dll; DestDir: {syswow64}; Components: programa; Flags: sharedfile
;DLLs XMLSec
Source: {#ACBrDIR}\DLLs\XMLSec\libxml2.dll; DestDir: {app}; Flags: ; Components: programa
Source: {#ACBrDIR}\DLLs\XMLSec\libxmlsec.dll; DestDir: {app}; Flags: ; Components: programa
Source: {#ACBrDIR}\DLLs\XMLSec\libxmlsec-openssl.dll; DestDir: {app}; Flags: ; Components: programa
Source: {#ACBrDIR}\DLLs\XMLSec\libxslt.dll; DestDir: {app}; Flags: ; Components: programa
Source: {#ACBrDIR}\DLLs\XMLSec\zlib1.dll; DestDir: {app}; Flags: ; Components: programa
Source: {#ACBrDIR}\DLLs\XMLSec\iconv.dll; DestDir: {app}; Flags: ; Components: programa
;Schemas da NFe
Source: Schemas\*.*; DestDir: {app}\Schemas; Components: programa;
;Lista de munic�pios do IBGE
Source: MunIBGE\*.*; DestDir: {app}\MunIBGE; Flags: ; Components: programa
;DLLs de Fabricantes SAT
Source: SAT\*.*; DestDir: {app}\SAT; Flags: recursesubdirs; Components: programa;

[INI]
Filename: {app}\{#MyAppUrlName}; Section: InternetShortcut; Key: URL; String: {#MyAppURL}; Components: help

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; WorkingDir: {app}; Components: programa
Name: {group}\Programa para Configurar e Testar ECF; Filename: {app}\ECFTeste.exe; WorkingDir: {app}; Components: programa
Name: {group}\Manual do ACBrMonitor; Filename: {app}\ACBrMonitor.chm; WorkingDir: {app}; Components: help
Name: {group}\Pasta Exemplos; Filename: {app}\Exemplos\; Components: exemplos
Name: {userdesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; WorkingDir: {app}; Tasks: desktopicon
Name: {userstartup}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; WorkingDir: {app}
Name: {group}\{cm:ProgramOnTheWeb,{#MyAppName}}; Filename: {app}\{#MyAppUrlName}; Components: help

[Run]
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#MyAppName}}"
Filename: "{app}\ACBrMonitor.chm"; Flags: postinstall shellexec skipifsilent; Description: "Manual ACBrMonitor"; Components: help
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall add rule name=""{#MyAppName}"" dir=in action=allow protocol=TCP localport=3434"; Flags: skipifdoesntexist runhidden; MinVersion: 0,6.0; Tasks: firewallopen

[UninstallRun]
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall delete rule name=""{#MyAppName}"""; Flags: skipifdoesntexist runhidden; MinVersion: 0,6.0; Tasks: firewallopen
