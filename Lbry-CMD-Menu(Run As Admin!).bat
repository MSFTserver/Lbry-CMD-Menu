Rem CMD Options Size & Logs (Dont Touch Please)
@echo off
Mode 105, 30
set logg=^> _^&^& type _^&^&type _^>^>%~dp0\LbryMenuLog.txt
set menuhour=%time:~0,2%
set menumin=%time:~3,2%
set menusecs=%time:~6,2%
if "%menuhour:~0,1%" == " " set menuhour=0%menuhour:~1,1%
if "%menumin:~0,1%" == " " set menumin=0%menumin:~1,1%
if "%menusecs:~0,1%" == " " set menusecs=0%menusecs:~1,1%

Rem Settings & Configs (Devs This You May Edit)
set MenuVersion=1.7
set CodeLevel=ReleaseBeta
set User=%username%
set LBRYexeLocation=C:\Program Files (x86)\LBRY
set DaemonCLIexeLocation=%LBRYexeLocation%\resources\app\dist
set LBRYname=LBRY.exe
set DaemonName=lbrynet-daemon.exe
set CLIname=lbrynet-cli.exe

REM Logo Text
title Lbry CMD Menu
set LogoLine1=                        :::        :::::::::  :::::::::  :::   :::    
set LogoLine2=                       :+:        :+:    :+: :+:    :+: :+:   :+:     
set LogoLine3=                      +:+        +:+    +:+ +:+    +:+  +:+ +:+       
set LogoLine4=                     +#+        +#++:++#+  +#++:++#:    +#++:         
set Logoline5=                    +#+        +#+    +#+ +#+    +#+    +#+           
set LogoLine6=                   #+#        #+#    #+# #+#    #+#    #+#            
set Logoline7=                  ########## #########  ###    ###    ###             

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
if %ErrorLevel% equ 0 ( goto :Open ) else ( 
echo You should run the .bat as administrator for Full Functionality. %logg%
echo you may continue to use it without running as admin just note most things wont work. %logg%
ping localhost -n 10 >nul
goto :Open
)

Rem Specify Location For Log Files
:Open
cls
echo %Logoline1% %logg%
echo %Logoline2% %logg%
echo %Logoline3% %logg%
echo %Logoline4% %logg%
echo %Logoline5% %logg%
echo %Logoline6% %logg%
echo %Logoline7% %logg%
echo                               Welcome To LBRY %logg%
echo                       This is a AIO CMD Menu For Lbry %logg%
echo                            Coded By: MSFTserver %logg%
echo . %logg%
echo                   Lbry Install Info: %logg%
echo                       Menu Version: %MenuVersion% %logg%
echo                       Code Level: %CodeLevel% %logg%
echo                       Instance Started: %date% %menuhour%:%menumin%:%menusecs%
echo                       Instance Started By (%user%) %logg%
echo                       Menu Location: %~dp0 %logg%
echo                       Log File: %~dp0\LbryMenuLog.txt %logg%
echo                       App (LBRY.exe) Location: %LBRYexeLocation% %logg%
echo                       Daemon/CLI exe Location: %DaemonCLIexeLocation% %logg%
echo                       App name: %LBRYname% %logg%
echo                       Daemon Name: %DaemonName% %logg%
echo                       CLI name: %CLIname% %logg%
ping localhost -n 5 >nul
goto :MainMenu

Rem Main Menu
:MainMenu
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
echo       //sd - Start Lbry Daemon   //w - Wallet Menu            // %logg%
echo      //sa - Start Lbry App      //h - Help and Info Menu     // %logg%
echo     //ka - Kill the App        //                           // %logg%
echo    //kd - Kill the Daemon     //                           // %logg%
echo   //kb - Kill App and Daemon //                           // %logg%
echo  //k - Kill all Processes   //e - Exit This Window       // %logg%
echo ////////////////////////////////////////////////////////// %logg%
set /p OptionMainMenu= Menu Selection: ||set OptionMainMenu=invalid
if %OptionMainMenu%==sa goto :App
if %OptionMainMenu%==sd goto :Daemon
if %OptionMainMenu%==e goto :exitCMD
if %OptionMainMenu%==kd goto :exitDaemon
if %OptionMainMenu%==ka goto :exitAPP
if %OptionMainMenu%==kb goto :exitAPPandDAEMON
if %OptionMainMenu%==k goto :exitALL
if %OptionMainMenu%==h goto :InfoMenu
if %OptionMainMenu%==w goto :WalletMenu1
if not "%OptionMainMenu%"=="sa" if not "%OptionMainMenu%"=="sd" if not "%OptionMainMenu%"=="e" if not "%OptionMainMenu%"=="kd" if not "%OptionMainMenu%"=="ka" if not "%OptionMainMenu%"=="kb" if not "%OptionMainMenu%"=="k" if not "%OptionMainMenu%"=="h" if not "%OptionMainMenu%"=="w" (
echo invalid selection %logg%
ping localhost -n 3 >nul
goto :MainMenu
)

Rem Wallet Menu 1
:WalletMenu1
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo           ////////////////////////////////////////////////////////// %logg%
echo          //                    Lbry Wallet Menu                  // %logg%
echo         ////////////////////////////////////////////////////////// %logg%
echo        //b - Current Balance       //au - Address Unused/Empty  // %logg%
echo       //o - Input Address Balance //ag - Generate new address  // %logg%
echo      //w - List of Wallets       //cu - Claimed URI's        // %logg%
echo     //c - List of Channels      //ca - Abandon Claim        // %logg%
echo    //k - Wallets Public Key    //s - Send LBC              // %logg%
echo   //t - Transaction List      //m - More Options          // %logg%
echo  //ts - Show Specific Trans. //e - Main Menu             // %logg%
echo ////////////////////////////////////////////////////////// %logg%
set /p OptionWalletMenu1= Menu Selection: ||set OptionWalletMenu1=invalid
if %OptionWalletMenu1%==b goto :AddressBalanceYours
if %OptionWalletMenu1%==o goto :AddressBalanceOther
if %OptionWalletMenu1%==w goto :AddressList
if %OptionWalletMenu1%==c goto :ChannelList
if %OptionWalletMenu1%==cu goto :ClaimList
if %OptionWalletMenu1%==t goto :TransactionList
if %OptionWalletMenu1%==s goto :TransactionSendLBC
if %OptionWalletMenu1%==k goto :AddressPublicKey
if %OptionWalletMenu1%==au goto :AddressUnused
if %OptionWalletMenu1%==ag goto :AddressGenerateNew
if %OptionWalletMenu1%==ca goto :ClaimAbandon
if %OptionWalletMenu1%==ts goto :TransactionDetails
if %OptionWalletMenu1%==m goto :WalletMenu2
if %OptionWalletMenu1%==e goto :Open
if not "%OptionWalletMenu1%"=="b" if not "%OptionWalletMenu1%"=="o" if not "%OptionMWalletMenu1%"=="w" if not "%OptionWalletMenu1%"=="c" if not "%OptionWalletMenu1%"=="cu" if not "%OptionWalletMenu1%"=="t" if not "%OptionWalletMenu1%"=="s" if not "%OptionWalletMenu1%"=="k" if not "%OptionWalletMenu1%"=="au" if not "%OptionWalletMenu1%"=="ag" if not "%OptionWalletMenu1%"=="ca" if not "%OptionWalletMenu1%"=="ts" if not "%OptionWalletMenu1%"=="m" if not "%OptionWalletMenu1%"=="e" (
echo invalid selection %logg%
ping localhost -n 3 >nul
goto :WalletMenu1
)

Rem Wallet Menu2
:WalletMenu2
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo           ////////////////////////////////////////////////////////// %logg%
echo          //                Lbry Wallet Menu(More)                // %logg%
echo         ////////////////////////////////////////////////////////// %logg%
echo        //gc - Generate New Channel //pl - Peers List           // %logg%
echo       //lb - List Blobs           //fl - Files List           // %logg%
echo      //nb - List Needed Blobs    //fa - File Availability    // %logg%
echo     //fb - List Finished Blobs  //fr - Reflect File Blobs   // %logg%
echo    //ab - Announce Blob        //m - More                  // %logg%
echo   //ba - Announce All Blobs   //b - Go Back               // %logg%
echo  //db - delete blob          //e - Main Menu             // %logg%
echo ////////////////////////////////////////////////////////// %logg%
set /p OptionWalletMenu2= Menu Selection: ||set OptionWalletMenu2=invalid
if %OptionWalletMenu2%==gc goto :ChannelGenerateNew
if %OptionWalletMenu2%==pl goto :FilePeersList
if %OptionWalletMenu2%==lb goto :BlobHashAll
if %OptionWalletMenu2%==nb goto :BlobHashNeeded
if %OptionWalletMenu2%==fb goto :BlobHashFinished
if %OptionWalletMenu2%==fa goto :FileAvailability
if %OptionWalletMenu2%==fr goto :BlobReflect
if %OptionWalletMenu2%==ba goto :BlobAnnounceAll
if %OptionWalletMenu2%==ab goto :BlobAnnounce
if %OptionWalletMenu2%==db goto :BlobDelete
if %OptionWalletMenu2%==m goto :WalletMenu3
if %OptionWalletMenu2%==b goto :WalletMenu1
if %OptionWalletMenu2%==e goto :Open
if %OptionWalletMenu2%==fl goto :Filelist
if not "%OptionWalletMenu2%"=="gc" if not "%OptionWalletMenu2%"=="pl" if not "%OptionWalletMenu2%"=="lb" if not "%OptionWalletMenu2%"=="nb" if not "%OptionWalletMenu2%"=="fb" if not "%OptionWalletMenu2%"=="fa" if not "%OptionWalletMenu2%"=="fr" if not "%OptionWalletMenu2%"=="ba" if not "%OptionWalletMenu2%"=="ab" if not "%OptionWalletMenu2%"=="db" if not "%OptionWalletMenu2%"=="m" if not "%OptionWalletMenu2%"=="b" if not "%OptionWalletMenu2%"=="e" if not "%OptionWalletMenu2%"=="fl" (
echo invalid selection %logg%
ping localhost -n 3 >nul
goto :WalletMenu2
)

Rem Wallet Menu3
:WalletMenu3
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo           /////////////////////////////////////////////////////////// %logg%
echo          //                Lbry Wallet Menu(More)                 // %logg%
echo         /////////////////////////////////////////////////////////// %logg%
echo        //r - Resolve URI            //p - Publish(Coming Soon)  // %logg%
echo       //rc - Resolve Channel Name  //                          // %logg%
echo      //ac - Check Address Is Yours//cc - Custom Command       // %logg%
echo     //df - Download File         //cl - Custom Command List  // %logg%
echo    //ef - Erase/Delete File     //                          // %logg%
echo   //fs - Set Status Of File    //b - Go Back               // %logg%
echo  //sc - Stream Cost Estimate  //e - Main Menu             // %logg%
echo /////////////////////////////////////////////////////////// %logg%
set /p OptionWalletMenu3= Menu Selection: ||set OptionWalletMenu3=invalid
if %OptionWalletMenu3%==cc goto :CustomCommand
if %OptionWalletMenu3%==cl goto :CommandList
if %OptionWalletMenu3%==r goto :URIResolve
if %OptionWalletMenu3%==fs goto :FileSetStatus
if %OptionWalletMenu3%==df goto :FileDownload
if %OptionWalletMenu3%==ef goto :FileDelete
if %OptionWalletMenu3%==ac goto :AddressAssociated
if %OptionWalletMenu3%==sc goto :URIStreamCostEstimate
if %OptionWalletMenu3%==rc goto :ChannelResovleName
if %OptionWalletMenu3%==p goto :URIPublish
if %OptionWalletMenu3%==b goto :WalletMenu2
if %OptionWalletMenu3%==e goto :Open
if not "%OptionWalletMenu3%"=="cc" if not "%OptionWalletMenu3%"=="cl" if not "%OptionWalletMenu3%"=="r" if not "%OptionWalletMenu3%"=="fs" if not "%OptionWalletMenu3%"=="df" if not "%OptionWalletMenu3%"=="ef" if not "%OptionWalletMenu3%"=="ac" if not "%OptionWalletMenu3%"=="sc" if not "%OptionWalletMenu3%"=="rc" if not "%OptionWalletMenu3%"=="p" if not "%OptionWalletMenu3%"=="b" if not "%OptionWalletMenu3%"=="e" (
echo invalid selection %logg%
ping localhost -n 3 >nul
goto :WalletMenu3
)

Rem Info and Help Menu
:InfoMenu
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo          ///////////////////////////////////////////////////////// %logg%
echo         //                 Lbry Info/Help Menu                 // %logg%
echo        ///////////////////////////////////////////////////////// %logg%
echo       //n - Important Notes!      //                         // %logg%
echo      //s - Lbry Status           //e - System Specs Info    // %logg%
echo     //v - Lbry Version info     //                         // %logg%
echo    //d - Get Daemon Settings   //b - Report Bug           // %logg%
echo   //                          //w - Wallet Menu          // %logg%
echo  //                          //m - Main Menu            // %logg%
echo ///////////////////////////////////////////////////////// %logg%
set /p OptionInfoMenu= Menu Selection: ||set OptionInfoMenu=invalid
if %OptionInfoMenu%==n goto :ImportantNotes
if %OptionInfoMenu%==w goto :WalletMenu1
if %OptionInfoMenu%==m goto :Open
if %OptionInfoMenu%==s goto :LbryStatus
if %OptionInfoMenu%==v goto :LbryVersion
if %OptionInfoMenu%==d goto :DaemonSettings
if %OptionInfoMenu%==b goto :ReportBug
if %OptionInfoMenu%==e goto :SystemEnvironment
if not "%OptionInfoMenu%"=="n" if not "%OptionInfoMenu%"=="w" if not "%OptionInfoMenu%"=="m" if not "%OptionInfoMenu%"=="s" if not "%OptionInfoMenu%"=="v" if not "%OptionInfoMenu%"=="d" if not "%OptionInfoMenu%"=="b" (
echo invalid selection %logg%
ping localhost -n 3 >nul
goto :InfoMenu
)

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
ping localhost -n 2 >nul
echo starting %LBRYname%... %logg%
cd "%LBRYexeLocation%"
start %LBRYname%
ping localhost -n 2 >nul
echo LBRY-App Started %logg%
ping localhost -n 5 >nul
goto :ExitMenu

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
echo Note: Let This Run For Atleast a minute Before Starting The App(LBRY.exe) %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Check Lbry Status
:LbryStatus
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking Lbry Status Please Wait a Moment... %logg%
echo Status: %logg%
cd "%DaemonCLIexeLocation%" 
%CLIname% status %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Check Lbry Version
:LbryVersion
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking Lbry Version Please Wait a Moment... %logg%
echo Version: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% version %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Gets Daemon Settings
:DaemonSettings
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Getting Daemon Settings... %logg%
echo Daemon Settings: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% settings_get %logg%
ping localhost -n 7 >nul
goto :ExitMenu

Rem Report bug
:ReportBug
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo enter the message to send to slack for report %logg%
set /p BugMessage= 
ping localhost -n 2 >nul
echo Reporting Bug... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% report_bug %BugMessage% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

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
echo              //////////////////////////////////////////////////////////////// %logg%
echo             // Important Notes:                                           // %logg%
echo            //  1) If App Started Before Daemon This CMD Will Become      // %logg%
echo           //      The Daemon Host Window                                // %logg%
echo          //  2) If the Lbry-App(LBRY.exe) Errors out it will cover     // %logg%
echo         //      menu but is still usable                              // %logg%
echo        //  3) Upon Closing This CMD Window Will Close The LBRY.exe   // %logg%
echo       //      if Launched With This App                             // %logg%
echo      //  4) If Starting Daemon Before LBRY-App wait atleast        // %logg%
echo     //      1 minute before starting the app                      // %logg%
echo    //       (it may cause the app to crash if launhced to early) // %logg%
echo   //  5) All CLI Outputs for account info and more is           // %logg%
echo  //      in the Log file(LbryMenuLog.txt)                      // %logg%
echo //////////////////////////////////////////////////////////////// %logg%
ping localhost -n 6 >nul
goto :ExitMenu

Rem Check Wallet List
:AddressList
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking All Wallets Associated With Account... %logg%
echo Wallets: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_list %logg%
ping localhost -n 7 >nul
goto :ExitMenu

Rem Check If Address Is Associated With Your Wallet
:AddressAssociated
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Check If Address Is Associated With Your Wallet %logg%
set /p AssociatedAddress= Address : 
ping localhost -n 2 >nul
echo Checking If Address(%AssociatedAddress%) is Associated with Your Wallet... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_is_address_mine %AssociatedAddress% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Check Wallet Balance
:AddressBalanceYours
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking Balance Please Wait a Moment... %logg%
echo Balance: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_balance %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Check Wallet Balance Of User Defined Address
:AddressBalanceOther
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Check Balance Of External Address %logg%
set /p CheckBalance= Address: 
ping localhost -n 2 >nul
echo Checking Balance Please Wait a Moment... %logg%
echo Balance: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_balance %CheckBalance% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Unused Wallet Address
:AddressUnused
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Finding address containing no balance, will create a new address if there is none... %logg%
ping localhost -n 2 >nul
echo Wallet Address: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_unused_address %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Generate New Wallet Address
:AddressGenerateNew
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Generating New Wallet Address... %logg%
ping localhost -n 2 >nul
echo Wallet Address: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_new_address %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Wallets Public Key
:AddressPublicKey
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Get Public Key For Address %logg%
set /p PublicKeyAddress= Address: 
ping localhost -n 2 >nul
echo Getting Public Key for Address(%PublicKeyAddress%)... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% wallet_public_key %PublicKeyAddress% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem All Your URI Claims
:ClaimList
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking All Claims Associated With Account... %logg%
echo My Claims: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% claim_list_mine %logg%
ping localhost -n 7 >nul
goto :ExitMenu

Rem Abandon Claim
:ClaimAbandon
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Abandon a Claim and Get your credits Back %logg%
set /p AbandonClaimID= Claim ID: 
ping localhost -n 2 >nul
echo Abonding Claim With ID(%AbandonClaimID%)... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% claim_abandon %AbandonClaimID% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem List of Your Transactions
:TransactionList
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Checking All Transactions Associated With Account... %logg%
echo My Transactions: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% transaction_list %logg%
ping localhost -n 7 >nul
goto :ExitMenu

Rem Get Transaction by txid
:TransactionDetails
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Get Details For Transaction From txid %logg%
set /p Transactiontxid= txid: 
ping localhost -n 2 >nul
echo Getting Transaction... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% transaction_show %Transactiontxid% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Send LBC to Address
:TransactionSendLBC
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Send LBC to Another Address. %logg%
set /p SendAmount= Amount(LBC): 
ping localhost -n 2 >nul
echo Provide a Address to Send (%SendAmount%)LBC to %logg%
set /p SendAddress= Address: 
echo if it returns (true) transaction completed %logg%
echo Sending (%SendAmount%)LBC To Address(%SendAddress%)... %logg%
ping localhost -n 2 >nul
cd "%DaemonCLIexeLocation%"
%CLIname% send_amount_to_address %SendAmount% %SendAddress% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

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
echo Checking All Channels Associated With Account... %logg%
echo My Channels: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% channel_list_mine %logg%
ping localhost -n 7 >nul
goto :ExitMenu

Rem Generate New Channel
:ChannelGenerateNew
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Generate New Channel %logg%
ping localhost -n 2 >nul
set /p NewChannelName= Channel Name: 
ping localhost -n 2 >nul
set /p NewChannelNameLBC= Amount(LBC): 
ping localhost -n 2 >nul
echo Generating New Channel (%NewChannelName%) with claim amount (%NewChannelNameLBC%)LBC... %logg%
echo New Channel: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% channel_new %NewChannelName% %NewChannelNameLBC% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Stream Cost Estimate
:ChannelResovleName
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Resovle Channel Name To Get Data %logg%
set /p ResovleChannel= Channel Name : 
ping localhost -n 2 >nul
echo Resovling Channel(%ResovleChannel%)... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% resolve_name %ResovleChannel% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Blob Hashes All
:BlobHashAll
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Get Blob File Hashes %logg%
ping localhost -n 2 >nul
echo Getting Hashes For All Blobs... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% blob_list %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Blob Hashes Needed
:BlobHashNeeded
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Get Needed Blob File Hashes %logg%
ping localhost -n 2 >nul
echo Getting Hashes For Needed Blobs... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% blob_list -n %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Blob Hashes Finished
:BlobHashFinished
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Get Finished Blob File Hashes %logg%
ping localhost -n 2 >nul
echo Getting Hashes For Finished Blobs... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% blob_list -f %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Blob Announce
:BlobAnnounce
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Announce A Blob %logg%
set /p AnnounceBlobHash= Blob Hash: 
ping localhost -n 2 >nul
echo Announcing Blob To DHT... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% blob_announce %AnnounceBlobHash% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Blob Announce All
:BlobAnnounceAll
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Announcing All Blobs To DHT... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% blob_announce_all %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Reflect File Blobs
:BlobReflect
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Reflect Blobs For a File %logg%
set /p ReflectBlob= File Name or Claim ID : 
ping localhost -n 2 >nul
echo Getting Blobs From (%ReflectBlob%)... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% file_reflect %ReflectBlob% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Delete Blob
:BlobDelete
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Delete Blob from List %logg%
set /p DeleteBlobHash= Blob Hash: 
ping localhost -n 2 >nul
echo Deleting Blob... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% blob_delete %DeleteBlobHash% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem ExitMenu after stuff
:ExitMenu
echo Press (m) for Main Menu,(w) for Wallet Menu,(h) for Help and Info Menu, and (q) to quit CMD. %logg%
set /p OptionStart= Option: ||set OptionStart=invalid
if %OptionStart%==q goto :exitCMD
if %OptionStart%==m goto :MainMenu
if %OptionStart%==w goto :WalletMenu1
if %OptionStart%==h goto :InfoMenu
if not "%OptionStart%"=="g" if not "%OptionStart%"=="m" if not "%OptionStart%"=="w" if not "%OptionStart%"=="h" (
echo Invalid Selection Returning To Main Menu
goto :MainMenu
)

Rem File List
:FileList
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Getting Files Downloaded And Stored... %logg%
ping localhost -n 2 >nul
echo Files: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% file_list -f %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem File Availability
:FileAvailability
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Get File Availability %logg%
echo Example: (lbry://burstcoin) %logg%
set /p FileAvailability= URI: 
ping localhost -n 2 >nul
echo Getting File Avalability Please Wait 60 Seconds... %logg%
echo Result will show like this (Peers per blob / total blobs) %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% get_availability --uri=%FileAvailability% --peer_timeout=60 --sd_timeout=60 %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Peers List
:FilePeersList
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Get Peers For Blob Hash %logg%
set /p PeersListBlobHash= Blob Hash: 
ping localhost -n 2 >nul
echo Getting Peers List... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% peer_list %PeersListBlobHash% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Set File Status
:FileSetStatus
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Start Or Stop Downloading File %logg%
set /p SetFileStatus1= File Name or Claim ID : 
ping localhost -n 2 >nul
set /p SetFileStatus2= Status:  
ping localhost -n 2 >nul
echo Attempting To (%SetFileStatus2%)(%SetFileStatus1%)... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% file_set_status %SetFileStatus2% %SetFileStatus1% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Download File
:FileDownload
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Download File from URI %logg%
echo Example: (lbry://burstcoin) %logg%
set /p DownloadFileURI= URI: 
ping localhost -n 2 >nul
echo Downloading File(%DownloadFileURI%)... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% get %DownloadFileURI% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Delete File
:FileDelete
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Delete File from Donwnloads %logg%
set /p DeleteFileName= File Name: 
ping localhost -n 2 >nul
echo Deleting File(%DeleteFileName%)... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% file_delete --file_name=%DeleteFileName% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Resolve Data From URI
:URIResolve
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Resove Data From URI %logg%
echo Example: (lbry://burstcoin) %logg%
set /p ResolveURI= URI: 
ping localhost -n 2 >nul
echo Resolving Data From (%ResovleURI%)... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% resolve %ResolveURI% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Stream Cost Estimate
:URIStreamCostEstimate
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Check Estimated Cost For LBRY Stream URI %logg%
echo Example: (lbry://burstcoin) %logg%
set /p EstimateCostURI= URI : 
ping localhost -n 2 >nul
echo Checking Estimated Cost Of URI(%EstimateCostURI%) ... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% stream_cost_estimate %EstimateCostURI% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Publish
:URIPublish
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Coming Soon!
ping localhost -n 3 >nul
goto :ExitMenu

Rem Custom Command runner
:CustomCommand
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo enter the custom command as you would normally for the cli %logg%
echo just continue where "%CLIname%" leaves off for command %logg%
set /p UserCommand=%CLIname% 
ping localhost -n 2 >nul
echo Sending Command to CLI... %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% %UserCommand% %logg%
ping localhost -n 5 >nul
goto :ExitMenu

Rem Custom Commands List for CLI
:CommandList
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo List is from CLI API docs %logg%
echo Loading Custom Commands List... %logg%
ping localhost -n 3 >nul
echo Commands: %logg%
cd "%DaemonCLIexeLocation%"
%CLIname% commands %logg%
ping localhost -n 7 >nul
goto :ExitMenu

::Rem Computer Inviroment Info
:SystemEnvironment
cls
setlocal ENABLEDELAYEDEXPANSION
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Loading Bios Data ... %logg%
FOR /F "tokens=2 delims='='" %%A in ('wmic BIOS Get Name /value') do SET biosname=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic BIOS Get Manufacturer /value') do SET biosmanufacturer=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic BIOS Get Version /value') do SET biosversion=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic Bios Get SerialNumber /value') do SET csserialnumber=%%A
ping localhost -n 3 >nul
cls 
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Loading System Data ... %logg%
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Manufacturer /value') do SET csmanufacturer=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Model /value') do SET csmodel=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic cpu Get loadpercentage /value') do SET cpuload=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic memorychip Get Manufacturer /value') do SET memmanufacturer=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic memorychip Get speed /value') do SET memspeed=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic memorychip Get installdate /value') do SET ramdt=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic memorychip Get serialnumber /value') do SET ramserial=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os get Name /value') do SET osname=%%A
FOR /F "tokens=1 delims='|'" %%A in ("%osname%") do SET osname=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os Get Version /value') do SET osversion=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os Get NumberOfProcesses /value') do SET cpuprocesses=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os Get BuildNumber /value') do SET osbuildnumber=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os Get BuildType /value') do SET osbuildtype=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os Get SystemDrive /value') do SET osdrive=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os get OSArchitecture /value') do SET osarch=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os get InstallDate /value') do SET osdt=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os get LastBootUpTime /value') do SET bootdt=%%A
ping localhost -n 3 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Loading Video Card Data ... %logg%
FOR /F "tokens=2 delims='='" %%A in ('wmic path win32_VideoController get name /value') do SET videocard=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic path win32_VideoController get VideoProcessor /value') do SET videocardprocessor=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic path win32_VideoController get CurrentRefreshRate /value') do SET videocardrefreshrate=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic path win32_VideoController get DriverVersion /value') do SET videocarddriverversion=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic path win32_VideoController get InstallDate /value') do SET videocardinstalldt=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic path win32_VideoController get DriverDate /value') do SET videocarddt=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic path win32_VideoController get VideoMemoryType /value') do SET videocardramtype=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic path win32_VideoController get AdapterRAM /value') do SET videocardram=%%A
ping localhost -n 3 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Loading Drive Data ... %logg%
ping localhost -n 3 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
FOR /F "tokens=4" %%a in ('systeminfo ^| findstr Physical') do if defined totalMem (set availableMem=%%a) else (set totalMem=%%a) %logg%
FOR /f "skip=1 tokens=2 delims==" %%A in ('wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature /value') do SET /a "HunDegCel=(%%~A*10)-27315"
set totalMem=%totalMem:,=%
set availableMem=%availableMem:,=%
set /a usedMem=totalMem-availableMem
set /a videocardtotalram=videocardram/1073741824
set cputempc=%HunDegCel:~0,-2%.%HunDegCel:~-2%
set /a cputempf=cputempc*9/5+32
set "videocardinstallYY=%videocardinstalldt:~2,2%" & set "videocardinstallYYYY=%videocardinstalldt:~0,4%" & set "videocardinstallMM=%videocardinstalldt:~4,2%" & set "videocardinstallDD=%videocardinstalldt:~6,2%"
set "videocardinstallHH=%videocardinstalldt:~8,2%" & set "videocardinstallMin=%videocardinstalldt:~10,2%" & set "videocardinstallSec=%videocardinstalldt:~12,2%"
set "videocardinstalldate=%videocardinstallMM%/%videocardinstallDD%/%videocardinstallYYYY%_%videocardinstallHH%:%videocardinstallMin%:%videocardinstallSec%"
set "videocarddriverYY=%videocarddt:~2,2%" & set "videocarddriverYYYY=%videocarddt:~0,4%" & set "videocarddriverMM=%videocarddt:~4,2%" & set "videocarddriverDD=%videocarddt:~6,2%"
set "videocarddriverHH=%videocarddt:~8,2%" & set "videocarddriverMin=%videocarddt:~10,2%" & set "videocarddriverSec=%videocarddt:~12,2%"
set "videocarddriverdate=%videocarddriverMM%/%videocarddriverDD%/%videocarddriverYYYY%_%videocarddriverHH%:%videocarddriverMin%:%videocarddriverSec%"
set "osYY=%osdt:~2,2%" & set "osYYYY=%osdt:~0,4%" & set "osMM=%osdt:~4,2%" & set "osDD=%osdt:~6,2%"
set "osHH=%osdt:~8,2%" & set "osMin=%osdt:~10,2%" & set "osSec=%osdt:~12,2%"
set "osinstalldate=%osMM%/%osDD%/%osYYYY%_%osHH%:%osMin%:%osSec%"
set "bootYY=%bootdt:~2,2%" & set "bootYYYY=%bootdt:~0,4%" & set "bootMM=%bootdt:~4,2%" & set "bootDD=%bootdt:~6,2%"
set "bootHH=%bootdt:~8,2%" & set "bootMin=%bootdt:~10,2%" & set "bootSec=%bootdt:~12,2%"
set "osboottime=%bootMM%/%bootDD%/%bootYYYY%_%bootHH%:%bootMin%:%bootSec%"
set "ramYY=%ramdt:~2,2%" & set "ramYYYY=%ramdt:~0,4%" & set "ramMM=%ramdt:~4,2%" & set "ramDD=%ramdt:~6,2%"
set "ramHH=%ramdt:~8,2%" & set "ramMin=%ramdt:~10,2%" & set "ramSec=%ramdt:~12,2%"
set "meminstall=%ramMM%/%ramDD%/%ramYYYY%_%ramHH%:%ramMin%:%ramSec%"
if %videocardramtype%==1 set videocardramtype=Other
if %videocardramtype%==2 set videocardramtype=Unkown
if %videocardramtype%==3 set videocardramtype=VRAM
if %videocardramtype%==4 set videocardramtype=DRAM
if %videocardramtype%==5 set videocardramtype=SRAM
if %videocardramtype%==6 set videocardramtype=WRAM
if %videocardramtype%==7 set videocardramtype=EDO RAM
if %videocardramtype%==8 set videocardramtype=Burst Synchronous DRAM
if %videocardramtype%==9 set videocardramtype=Pipelined Burst SRAM
if %videocardramtype%==10 set videocardramtype=CDRAM
if %videocardramtype%==11 set videocardramtype=3DRAM
if %videocardramtype%==12 set videocardramtype=SDRAM
if %videocardramtype%==13 set videocardramtype=SGRAM
if %videocardinstalldate%==//_:: set videocardinstalldate=Null
if %meminstall%==//_:: set meminstall=Null
set "DRIVELETTERSFREE=Z Y X W V U T S R Q P O N M L K J I H G F E D C B A "
for /f "skip=1 tokens=1,2 delims=: " %%a in ('wmic logicaldisk get deviceid^') do (
   set "DRIVELETTERSUSED=!DRIVELETTERSUSED!"%%a:\", %%b"
   set "DRIVELETTERSFREE=!DRIVELETTERSFREE:%%a =!"
)
set DRIVELETTERSUSED=%DRIVELETTERSUSED:~0,-2%
set DRIVELETTERSUSED=%DRIVELETTERSUSED:,@=, %
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Organizing List ... %logg%
ping localhost -n 3 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo . %logg%
echo                   System Info: %logg%
echo                       Model: %csmodel% %logg%
echo                       Manufacturer: %csmanufacturer% %logg%
echo                       Serial Number: %csserialnumber% %logg%
echo . %logg%
echo                       Video Card Name: %videocard% %logg%
echo                       Video Card Processor: %videocardprocessor% %logg%
echo                       Video Card Install Date: %videocardinstalldate% %logg%
echo                       Video Card Driver Version: %videocarddriverversion% %logg%
echo                       Video Card Driver Installed: %videocarddriverdate% %logg%
echo                       Video Card Ram Type: %videocardramtype% %logg%
echo                       Video Card Ram: %videocardtotalram% GB %logg%
echo                       Video Card Refresh Rate: %videocardrefreshrate% FPS %logg%
echo . %logg%
echo                       Bios Manufacturer: %biosmanufacturer% %logg%
echo                       Bios Name: %biosname% %logg%
echo                       Bios Version: %biosversion% %logg%
echo . %logg%
echo                       PC Name: %COMPUTERNAME% %logg%
echo                       OS Name: %osname% %logg%
echo                       OS Build Type: %osbuildtype% %logg%
echo                       OS Build Number: %osbuildnumber% %logg%
echo                       OS Version: %osversion% %logg%
echo                       OS Architecture: %osarch% %logg%
echo                       OS Installation Date: %osinstalldate% %logg%
echo                       OS Last Boot-up Time: %osboottime% %logg%
echo                       OS Directory: "%osdrive%\" %logg%
echo . %logg%
echo                       CPU Type: %PROCESSOR_IDENTIFIER% %logg%
echo                       CPU Revision: %PROCESSOR_REVISION% %logg%
echo                       CPU Physical Cores: %NUMBER_OF_PROCESSORS% %logg%
echo                       CPU Model Number: %PROCESSOR_LEVEL% %logg%
echo                       CPU Architecture: %PROCESSOR_ARCHITECTURE% %logg%
echo                       CPU Processes: %cpuprocesses% %logg%
echo                       CPU Load: %cpuload%%% %logg%
echo                       CPU Temp C: %cputempc:~0,-3% %logg%
echo                       CPU Temp F: %cputempf% %logg%
echo . %logg%
echo                       Memory Manufacturer: %memmanufacturer% %logg%
echo                       Memory Serial Number: %ramserial% %logg%
echo                       Memory Install Date: %meminstall% %logg%
echo                       Memory Speed: %memspeed% %logg%
echo                       Memory Total: %totalMem% MB %logg%
echo                       Memory  Used: %usedMem% MB %logg%
echo                       Memory  Free: %availableMem% MB %logg%
echo . %logg%
IF EXIST A:\ (
set drivea="A:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree A:\') DO (
    SET "adiskfree=!adisktotal!"
    SET "adisktotal=!adiskavail!"
    SET "adiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%adisktotal% %adiskavail%") DO SET "adisktotal=%%i"& SET "adiskavail=%%j"
)
IF EXIST B:\ (
set driveb="B:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree B:\') DO (
    SET "bdiskfree=!bdisktotal!"
    SET "bdisktotal=!bdiskavail!"
    SET "bdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%bdisktotal% %bdiskavail%") DO SET "bdisktotal=%%i"& SET "bdiskavail=%%j"
)
IF EXIST C:\ (
set drivec="C:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree C:\') DO (
    SET "cdiskfree=!cdisktotal!"
    SET "cdisktotal=!cdiskavail!"
    SET "cdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%cdisktotal% %cdiskavail%") DO SET "cdisktotal=%%i"& SET "cdiskavail=%%j"
)
IF EXIST D:\ (
set drived="D:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree D:\') DO (
    SET "ddiskfree=!ddisktotal!"
    SET "ddisktotal=!ddiskavail!"
    SET "addiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%ddisktotal% %ddiskavail%") DO SET "ddisktotal=%%i"& SET "ddiskavail=%%j"
)
IF EXIST E:\ (
set drivee="E:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree E:\') DO (
    SET "ediskfree=!edisktotal!"
    SET "edisktotal=!ediskavail!"
    SET "ediskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%edisktotal% %ediskavail%") DO SET "edisktotal=%%i"& SET "ediskavail=%%j"
)
IF EXIST F:\ (
set drivef="F:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree F:\') DO (
    SET "fdiskfree=!fdisktotal!"
    SET "fdisktotal=!fdiskavail!"
    SET "fdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%fdisktotal% %fdiskavail%") DO SET "fdisktotal=%%i"& SET "fdiskavail=%%j"
)
IF EXIST G:\ (
set driveg="G:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree G:\') DO (
    SET "gdiskfree=!gdisktotal!"
    SET "gdisktotal=!gdiskavail!"
    SET "gdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%gdisktotal% %gdiskavail%") DO SET "gdisktotal=%%i"& SET "gdiskavail=%%j"
)
IF EXIST H:\ (
set driveh="H:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree H:\') DO (
    SET "hdiskfree=!hdisktotal!"
    SET "hdisktotal=!hdiskavail!"
    SET "hdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%hdisktotal% %hdiskavail%") DO SET "hdisktotal=%%i"& SET "hdiskavail=%%j"
)
IF EXIST I:\ (
set drivei="I:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree I:\') DO (
    SET "idiskfree=!idisktotal!"
    SET "idisktotal=!idiskavail!"
    SET "idiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%idisktotal% %idiskavail%") DO SET "idisktotal=%%i"& SET "idiskavail=%%j"
)
IF EXIST J:\ (
set drivej="J:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree J:\') DO (
    SET "jdiskfree=!jdisktotal!"
    SET "jdisktotal=!jdiskavail!"
    SET "jdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%jdisktotal% %jdiskavail%") DO SET "jdisktotal=%%i"& SET "jdiskavail=%%j"
)
IF EXIST K:\ (
set drivek="K:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree K:\') DO (
    SET "kdiskfree=!kdisktotal!"
    SET "kdisktotal=!kdiskavail!"
    SET "kdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%kdisktotal% %kdiskavail%") DO SET "kdisktotal=%%i"& SET "kdiskavail=%%j"
)
IF EXIST L:\ (
set drivel="L:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree L:\') DO (
    SET "ldiskfree=!ldisktotal!"
    SET "ldisktotal=!ldiskavail!"
    SET "ldiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%ldisktotal% %ldiskavail%") DO SET "ldisktotal=%%i"& SET "ldiskavail=%%j"
)
IF EXIST M:\ (
set drivem="M:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree M:\') DO (
    SET "mdiskfree=!mdisktotal!"
    SET "mdisktotal=!mdiskavail!"
    SET "mdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%mdisktotal% %mdiskavail%") DO SET "mdisktotal=%%i"& SET "mdiskavail=%%j"
)
IF EXIST N:\ (
set driven="N:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree N:\') DO (
    SET "ndiskfree=!ndisktotal!"
    SET "ndisktotal=!ndiskavail!"
    SET "ndiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%ndisktotal% %ndiskavail%") DO SET "ndisktotal=%%i"& SET "ndiskavail=%%j"
)
IF EXIST O:\ (
set driveo="O:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree AO:\') DO (
    SET "odiskfree=!odisktotal!"
    SET "odisktotal=!odiskavail!"
    SET "odiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%odisktotal% %odiskavail%") DO SET "odisktotal=%%i"& SET "odiskavail=%%j"
)
IF EXIST P:\ (
set drivep="P:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree P:\') DO (
    SET "pdiskfree=!pdisktotal!"
    SET "pdisktotal=!pdiskavail!"
    SET "pdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%pdisktotal% %pdiskavail%") DO SET "pdisktotal=%%i"& SET "pdiskavail=%%j"
)
IF EXIST Q:\ (
set driveq="Q:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree Q:\') DO (
    SET "qdiskfree=!qdisktotal!"
    SET "qdisktotal=!qdiskavail!"
    SET "qdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%qdisktotal% %qdiskavail%") DO SET "qdisktotal=%%i"& SET "qdiskavail=%%j"
)
IF EXIST R:\ (
set driver="R:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree R:\') DO (
    SET "rdiskfree=!rdisktotal!"
    SET "rdisktotal=!rdiskavail!"
    SET "rdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%rdisktotal% %rdiskavail%") DO SET "rdisktotal=%%i"& SET "rdiskavail=%%j"
)
IF EXIST S:\ (
set drives="S:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree S:\') DO (
    SET "sdiskfree=!sdisktotal!"
    SET "sdisktotal=!sdiskavail!"
    SET "sdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%sdisktotal% %sdiskavail%") DO SET "sdisktotal=%%i"& SET "sdiskavail=%%j"
)
IF EXIST T:\ (
set drivet="T:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree T:\') DO (
    SET "tdiskfree=!tdisktotal!"
    SET "tdisktotal=!tdiskavail!"
    SET "tdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%tdisktotal% %tdiskavail%") DO SET "tdisktotal=%%i"& SET "tdiskavail=%%j"
)
IF EXIST U:\ (
set driveu="U:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree U:\') DO (
    SET "udiskfree=!udisktotal!"
    SET "udisktotal=!udiskavail!"
    SET "udiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%udisktotal% %udiskavail%") DO SET "udisktotal=%%i"& SET "udiskavail=%%j"
)
IF EXIST V:\ (
set drivev="V:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree V:\') DO (
    SET "vdiskfree=!vdisktotal!"
    SET "vdisktotal=!vdiskavail!"
    SET "vdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%vdisktotal% %vdiskavail%") DO SET "vdisktotal=%%i"& SET "vdiskavail=%%j"
)
IF EXIST W:\ (
set drivew="W:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree W:\') DO (
    SET "wdiskfree=!wdisktotal!"
    SET "wdisktotal=!wdiskavail!"
    SET "wdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%wdisktotal% %wdiskavail%") DO SET "wdisktotal=%%i"& SET "wdiskavail=%%j"
)
IF EXIST X:\ (
set drivex="X:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree X:\') DO (
    SET "xdiskfree=!xdisktotal!"
    SET "xdisktotal=!xdiskavail!"
    SET "xdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%xdisktotal% %xdiskavail%") DO SET "xdisktotal=%%i"& SET "xdiskavail=%%j"
)
IF EXIST Y:\ (
set drivey="Y:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree Y:\') DO (
    SET "ydiskfree=!ydisktotal!"
    SET "ydisktotal=!ydiskavail!"
    SET "ydiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%ydisktotal% %ydiskavail%") DO SET "ydisktotal=%%i"& SET "ydiskavail=%%j"
)
IF EXIST Z:\ (
set drivez="Z:\", 
FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree Z:\') DO (
    SET "zdiskfree=!zdisktotal!"
    SET "zdisktotal=!zdiskavail!"
    SET "zdiskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%zdisktotal% %zdiskavail%") DO SET "zdisktotal=%%i"& SET "zdiskavail=%%j"
)
set driveexist=%drivea%%driveb%%drivec%%drived%%drivee%%drivef%%driveg%%driveh%%drivei%%drivej%%drivek%%drivel%%drivem%%driven%%driveo%%drivep%%driveq%%driver%%drives%%drivet%%driveu%%drivev%%drivew%%drivex%%drivey%%drivez%
echo                       Connected Drives: %DRIVELETTERSUSED:~0,-6% %logg%
echo                       Writable Drives: %driveexist:~0,-2% %logg%
If EXIST A:\ (
echo                       A:\ Total Space: %adisktotal:~0,-9% GB %logg%
echo                       A:\ Free  Space: %adiskavail:~0,-9% GB %logg%
)
If EXIST B:\ (
echo                       B:\ Total Space: %bdisktotal:~0,-9% GB %logg%
echo                       B:\ Free  Space: %bdiskavail:~0,-9% GB %logg%
)
If EXIST C:\ (
echo                       C:\ Total Space: %cdisktotal:~0,-9% GB %logg%
echo                       C:\ Free  Space: %cdiskavail:~0,-9% GB %logg%
)
If EXIST D:\ (
echo                       D:\ Total Space: %ddisktotal:~0,-9% GB %logg%
echo                       D:\ Free  Space: %ddiskavail:~0,-9% GB %logg%
)
If EXIST E:\ (
echo                       E:\ Total Space: %edisktotal:~0,-9% GB %logg%
echo                       E:\ Free  Space: %ediskavail:~0,-9% GB %logg%
)
If EXIST F:\ (
echo                       F:\ Total Space: %fdisktotal:~0,-9% GB %logg%
echo                       F:\ Free  Space: %fdiskavail:~0,-9% GB %logg%
)
If EXIST G:\ (
echo                       G:\ Total Space: %gdisktotal:~0,-9% GB %logg%
echo                       G:\ Free  Space: %gdiskavail:~0,-9% GB %logg%
)
If EXIST H:\ (
echo                       H:\ Total Space: %hdisktotal:~0,-9% GB %logg%
echo                       H:\ Free  Space: %hdiskavail:~0,-9% GB %logg%
)
If EXIST I:\ (
echo                       I:\ Total Space: %idisktotal:~0,-9% GB %logg%
echo                       I:\ Free  Space: %idiskavail:~0,-9% GB %logg%
)
If EXIST J:\ (
echo                       J:\ Total Space: %jdisktotal:~0,-9% GB %logg%
echo                       J:\ Free  Space: %jdiskavail:~0,-9% GB %logg%
)
If EXIST K:\ (
echo                       K:\ Total Space: %kdisktotal:~0,-9% GB %logg%
echo                       K:\ Free  Space: %kdiskavail:~0,-9% GB %logg%
)
If EXIST L:\ (
echo                       L:\ Total Space: %ldisktotal:~0,-9% GB %logg%
echo                       L:\ Free  Space: %ldiskavail:~0,-9% GB %logg%
)
If EXIST M:\ (
echo                       M:\ Total Space: %mdisktotal:~0,-9% GB %logg%
echo                       M:\ Free  Space: %mdiskavail:~0,-9% GB %logg%
)
If EXIST N:\ (
echo                       N:\ Total Space: %ndisktotal:~0,-9% GB %logg%
echo                       N:\ Free  Space: %ndiskavail:~0,-9% GB %logg%
)
If EXIST O:\ (
echo                       O:\ Total Space: %odisktotal:~0,-9% GB %logg%
echo                       O:\ Free  Space: %odiskavail:~0,-9% GB %logg%
)
If EXIST P:\ (
echo                       P:\ Total Space: %pdisktotal:~0,-9% GB %logg%
echo                       P:\ Free  Space: %pdiskavail:~0,-9% GB %logg%
)
If EXIST Q:\ (
echo                       Q:\ Total Space: %qdisktotal:~0,-9% GB %logg%
echo                       Q:\ Free  Space: %qdiskavail:~0,-9% GB %logg%
)
If EXIST R:\ (
echo                       R:\ Total Space: %rdisktotal:~0,-9% GB %logg%
echo                       R:\ Free  Space: %rdiskavail:~0,-9% GB %logg%
)
If EXIST S:\ (
echo                       S:\ Total Space: %sdisktotal:~0,-9% GB %logg%
echo                       S:\ Free  Space: %sdiskavail:~0,-9% GB %logg%
)
If EXIST T:\ (
echo                       T:\ Total Space: %tdisktotal:~0,-9% GB %logg%
echo                       T:\ Free  Space: %tdiskavail:~0,-9% GB %logg%
)
If EXIST U:\ (
echo                       U:\ Total Space: %udisktotal:~0,-9% GB %logg%
echo                       U:\ Free  Space: %udiskavail:~0,-9% GB %logg%
)
If EXIST V:\ (
echo                       V:\ Total Space: %vdisktotal:~0,-9% GB %logg%
echo                       V:\ Free  Space: %vdiskavail:~0,-9% GB %logg%
)
If EXIST W:\ (
echo                       W:\ Total Space: %wdisktotal:~0,-9% GB %logg%
echo                       W:\ Free  Space: %wdiskavail:~0,-9% GB %logg%
)
If EXIST X:\ (
echo                       X:\ Total Space: %xdisktotal:~0,-9% GB %logg%
echo                       X:\ Free  Space: %xdiskavail:~0,-9% GB %logg%
)
If EXIST Y:\ (
echo                       Y:\ Total Space: %ydisktotal:~0,-9% GB %logg%
echo                       Y:\ Free  Space: %ydiskavail:~0,-9% GB %logg%
)
If EXIST Z:\ (
echo                       Z:\ Total Space: %zdisktotal:~0,-9% GB %logg%
echo                       Z:\ Free  Space: %zdiskavail:~0,-9% GB %logg%
)
echo . %logg%
ping localhost -n 7 >nul
goto :ExitMenu

Rem ExitMenu after stuff
:ExitMenu
echo Press (m) for Main Menu,(w) for Wallet Menu,(h) for Help and Info Menu, and (q) to quit CMD. %logg%
set /p OptionStart= Option: ||set OptionStart=invalid
if %OptionStart%==q goto :exitCMD
if %OptionStart%==m goto :MainMenu
if %OptionStart%==w goto :WalletMenu1
if %OptionStart%==h goto :InfoMenu
if not "%OptionStart%"=="g" if not "%OptionStart%"=="m" if not "%OptionStart%"=="w" if not "%OptionStart%"=="h" (
echo Invalid Selection Returning To Main Menu
goto :MainMenu
)

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
echo Exiting CMD(1)... %logg%
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
echo Sending Daemon ShutDown Command(4)... %logg%
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
echo Exiting Daemon(3)... %logg%
ping localhost -n 4 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Incase Daemon Doesnt Close Sending Force Close(2)... %logg%
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
echo Exiting Daemon(Complete)... %logg%
echo Note: Upon Closing This CMD Window Will Close The LBRY.exe if Launched With This App
ping localhost -n 4 >nul
goto :ExitMenu

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
echo Exiting APP(2)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Stopping APP Now(1)... %logg%
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
echo Note: Daemon Window Will Still Run After App Shutdown %logg%
ping localhost -n 4 >nul
goto :ExitMenu

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
echo Exiting APP Now (3)... %logg%
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
echo Exiting Daemon(2)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Sending Daemon ShutDown Command(1)... %logg%
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
goto :ExitMenu

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
echo Exiting APP Now (3)... %logg%
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
echo Exiting Daemon(2)... %logg%
ping localhost -n 2 >nul
cls
echo %Logoline1%
echo %Logoline2%
echo %Logoline3%
echo %Logoline4%
echo %Logoline5%
echo %Logoline6%
echo %Logoline7%
echo Sending Daemon ShutDown Command(1)... %logg%
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
echo Exiting CMD(1)... %logg%
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
