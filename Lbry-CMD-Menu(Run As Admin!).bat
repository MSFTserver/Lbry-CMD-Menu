Rem CMD Options Size & Logs (Dont Touch Please)
@echo off
Mode 105, 30
set logg=^> _^&^& type _^&^&type _^>^>%~dp0\LbryMenuLog.txt

Rem Settings & Configs (Devs This You May Edit)
set MenuVersion=1.7
set CodeLevel=Development
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
if %OptionWalletMenu2%==b goto :BlobAnnounce
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
echo      //s - Lbry Status           //                         // %logg%
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
