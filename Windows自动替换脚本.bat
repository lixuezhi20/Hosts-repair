@ECHO OFF&PUSHD %~DP0 &TITLE windows�Զ��滻�ű�-�ٶ��ӳɾ�
mode con lines=30 cols=60
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
:main
cls
echo.----------------------------------------------------------- 
echo.����360�����ԹܼҵȰ�ȫ������ѣ��빴ѡ��������Ͳ������ѣ�
echo.
echo.���棺ִ�и����� ����hosts�����Զ��滻���ǣ�
echo.����ԭ�ȵ�hosts���Լ��޸Ĺ�����Ϣ���������ֶ��޸ģ�
echo.
echo.-----------------------------------------------------------
echo.��ѡ��ʹ�ã�(���Թ���Ա������д˽ű�,��������滻���ɹ�)
echo.
echo. 1.ʹ�ñ�վ���صļ�ǿhosts������������1
echo.
echo. 2.�ָ����Գ�ʼhosts������������2
echo.-----------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p choice=���������ֲ����س���ȷ��:

echo.
if %choice%==1 goto host DNS
if %choice%==2 goto CL
cls
"set choice="
echo ����������������ѡ��
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 12 /n /m "��������Ӧ���֣�"
if errorlevel 2 goto CL
if errorlevel 1 goto host DNS
cls
goto main

:host DNS
cls

copy /y "hosts" "%SystemRoot%\System32\drivers\etc\hosts"
ipconfig /flushdns
echo.-----------------------------------------------------------
echo.
echo.��ϲ�������Ǳ���hosts��ˢ�±���DNS��������ɹ�!
echo.----------------------------------------------------------- 
goto end
:CL
cls

@echo 127.0.0.1 localhost > %SystemRoot%\System32\drivers\etc\hosts
echo ��ϲ����hosts�ָ���ʼ�ɹ�!
echo.
goto end

:end
echo �밴������˳���
@Pause>nul