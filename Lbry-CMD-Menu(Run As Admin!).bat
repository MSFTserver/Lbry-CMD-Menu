@echo off
::START
Rem User Defined Settings & Configs
set LBRYexeLocation=C:\Program Files (x86)\LBRY
set DaemonCLIexeLocation=C:\Program Files (x86)\LBRY\resources\app\dist
set LBRYname=LBRY.exe
set DaemonName=lbrynet-daemon.exe
set CLIname=lbrynet-cli.exe
set BatchFileLocation=C:\Users\Administrator\Desktop\Lbry-CMD-Menu
Rem User Defined Settings & Configs
::END
::
::
::
::
::START
REM Logo Text
title Welcome To Lbry
set LogoLine1=                        :::        :::::::::  :::::::::  :::   :::    
set LogoLine2=                       :+:        :+:    :+: :+:    :+: :+:   :+:     
set LogoLine3=                      +:+        +:+    +:+ +:+    +:+  +:+ +:+       
set LogoLine4=                     +#+        +#++:++#+  +#++:++#:    +#++:         
set Logoline5=                    +#+        +#+    +#+ +#+    +#+    +#+           
set LogoLine6=                   #+#        #+#    #+# #+#    #+#    #+#            
set Logoline7=                  ########## #########  ###    ###    ###             
set WelcomeText=                             Welcome To LBRY
Rem Global Vars and Settings
::END
::
::
::
::
::START
Rem Running as Admin Check
:AdminCheck
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
openfiles >nul 2>&1
if %ErrorLevel% equ 0 ( goto :LogFileSpecify ) else ( 
echo You should run the .bat as administrator for Full Functionality.
echo you may continue to use it without running as admin just note most things wont work.
ping localhost -n 7 >nul
goto :LogFileSpecify
)
Rem Running as Admin Check
::END
::
::
::
::
::START
Rem Specify Location For Log Files
:LogFileSpecify
set LogFile=%BatchFileLocation%\LbryMenuLog.txt
set logg=^> _^&^& type _^&^&type _^>^>%LogFile%
goto :Open
Rem Specify Location For Log Files
::END
::
::
::
::
::START
Rem Welcome Text
:Open
cls
echo %Logoline1% %logg%
echo %Logoline2% %logg%
echo %Logoline3% %logg%
echo %Logoline4% %logg%
echo %Logoline5% %logg%
echo %Logoline6% %logg%
echo %Logoline7% %logg%
echo %WelcomeText% %logg%
ping localhost -n 5 >nul
cls
goto :menu
Rem Welcome Text
::END
::
::
::
::
::START
Rem Main Menu
:menu
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo          ////////////////////////////////////////////////////////// %logg%
echo         //                    Lbry Main Menu                    // %logg%
echo        ////////////////////////////////////////////////////////// %logg%
echo       //sd - Start Lbry Daemon  //b - Check Wallet Balance    // %logg%
echo      //sa - Start Lbry App     //wl - Check List of Wallets  // %logg%
echo     //ka - Kill the App       //cl - Check List of Channels // %logg%
echo    //kd - Kill the Daemon    //                            // %logg%
echo   //kb - Kill App and Daemon//n - Important Notes!        // %logg%
echo  //k - Kill all Processes  //e - Exit This Window        // %logg%
echo ////////////////////////////////////////////////////////// %logg%
echo Note: Upon Closing This CMD Window it Will Close The LBRY.exe
echo       if Launched With This App
set /p OptionMainMenu= Menu Selection:  
if %OptionMainMenu%==sa goto :App
if %OptionMainMenu%==sd goto :Daemon
if %OptionMainMenu%==e goto :exitCMD
if %OptionMainMenu%==kd goto :exitDaemon
if %OptionMainMenu%==ka goto :exitAPP
if %OptionMainMenu%==kb goto :exitAPPandDAEMON
if %OptionMainMenu%==k goto :exitALL
if %OptionMainMenu%==n goto :ImportantNotes
if %OptionMainMenu%==b goto :CheckBalance
if %OptionMainMenu%==wl goto :WalletList
if %OptionMainMenu%==cl goto :ChannelList
echo invalid selection %logg%
ping localhost -n 3 >nul
goto :menu
Rem Main Menu
::END
::
::
::
::
::START
Rem run Lbry App w/out Daemon Window
:App
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo starting %LBRYname%... %logg%
cd "%LBRYexeLocation%"
start %LBRYname%
ping localhost -n 5 >nul 
echo LBRY-App Started %logg%
pause >nul|set/p =Press any Key to Go Back To Menu
goto :menu
Rem run Lbry App w/out Daemon Window
::END
::
::
::
::
::START
Rem run Lbry daemon
:Daemon
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo starting Daemon Service... %logg%
ping localhost -n 3 >nul
cd "%DaemonCLIexeLocation%"
start %DaemonName%
ping localhost -n 2 >nul
echo Daemon Service Started %logg%
echo Note: Let This Run For Atleast a minute Before Starting The App(LBRY.exe)
ping localhost -n 5 >nul
pause >nul|set/p =Press any Key to Go Back To Menu
goto :menu
Rem run Lbry daemon
::END
::
::
::
::
::START
Rem Important Notes!
:ImportantNotes
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo              ////////////////////////////////////////////////////////////////
echo             // Important Notes:                                           //
echo            //  1) If App Started Before Daemon This CMD Will Become      //
echo           //      The Daemon Host Window                                //
echo          //  2) If the Lbry-App(LBRY.exe) Errors out it will cover     //
echo         //      menu but is still usable                              //
echo        //  3) Upon Closing This CMD Window Will Close The LBRY.exe   //
echo       //      if Launched With This App                             //
echo      //  4) If Starting Daemon Before LBRY-App wait atleast        //
echo     //      1 minute before starting the app                      //
echo    //       (it may cause the app to crash if launhced to early) //
echo   //  5) All CLI Outputs for account info and more is           //
echo  //      in the Log file(LbryMenuLog.txt)                      //
echo ////////////////////////////////////////////////////////////////
ping localhost -n 6 >nul
goto :RunExitMenu
Rem Important Notes!
::END
::
::
::
::
::START
Rem Check Wallet Balance
:CheckBalance
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking Balance Please Wait a Moment %logg%
ping localhost -n 2 >nul
echo Balance: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_balance %logg%
ping localhost -n 5 >nul
goto :RunExitMenu
Rem Check Wallet Balance
::END
::
::
::
::
::START
Rem Check Wallet List
:WalletList
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking All Wallets Associated With Account %logg%
ping localhost -n 2 >nul
echo Wallets: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_list %logg%
ping localhost -n 7 >nul
goto :RunExitMenu
Rem Check Wallet List
::END
::
::
::
::
::START
Rem Your Channel List
:ChannelList
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking All Channels Associated With Account %logg%
ping localhost -n 2 >nul
echo My Channels: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% channel_list_mine %logg%
ping localhost -n 7 >nul
goto :RunExitMenu
Rem Your Channel List
::END
::
::
::
::
::START
Rem RunExitMenu after starting app(s)
:RunExitMenu
echo Press (m) for menu and (q) to quit
set /p OptionStart= Option: 
if %OptionStart%==q goto :exitCMD
if %OptionStart%==m goto :menu
goto :menu
Rem RunExitMenu after starting app(s)
::END
::
::
::
::
::START
Rem Exit CMD Window 
:exitCMD
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting CMD(5)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting CMD(4)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting CMD(3)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting CMD(2)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting CMD(Complete)... %logg%
ping localhost -n 4 >nul
exit /b %logg%
Rem Exit CMD Window
::END
::
::
::
::
::START
Rem Exit Daemon Window 
:exitDaemon
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Sending Daemon ShutDown Command... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% daemon_stop %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting Daemon... %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Incase Daemon Doesnt Close Sending Force Close... %logg%
taskkill /f /im "%DaemonName%"
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting Daemon... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting Daemon(Complete)... %logg%
echo Note: Upon Closing This CMD Window Will Close The LBRY.exe if Launched With This App
ping localhost -n 4 >nul
goto :RunExitMenu
Rem Exit Daemon Window
::END
::
::
::
::
::START
Rem Exit LBRY APP 
:exitAPP
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting APP(5)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting APP(4)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting APP(3)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Stopping APP Now(2)... %logg%
taskkill /f /im "%LBRYname%" %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting APP(Complete)... %logg%
ping localhost -n 4 >nul
goto :RunExitMenu
Rem Exit LBRY APP
::END
::
::
::
::
::START
Rem Exit LBRY APP 
:exitAPPandDAEMON
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting APP(5)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting APP Now (4)... %logg%
taskkill /f /im "%LBRYname%" %logg%
ping localhost -n 4 >nul
echo Exiting APP(Complete)... %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting Daemon(1)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Sending Daemon ShutDown Command... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% daemon_stop %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting Daemon(Complete)... %logg%
ping localhost -n 4 >nul
goto :RunExitMenu
Rem Exit LBRY APP
::END
::
::
::
::
::START
Rem Exit LBRY APP 
:exitALL
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting APP(5)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting APP Now (4)... %logg%
taskkill /f /im "%LBRYname%" %logg%
ping localhost -n 4 >nul
echo Exiting APP(Complete)... %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting Daemon(1)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Sending Daemon ShutDown Command... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% daemon_stop %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting Daemon(Complete)... %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting CMD(3)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting CMD(2)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Exiting CMD(Complete)... %logg%
ping localhost -n 4 >nul
exit /b %logg%
Rem Exit LBRY APP
::END