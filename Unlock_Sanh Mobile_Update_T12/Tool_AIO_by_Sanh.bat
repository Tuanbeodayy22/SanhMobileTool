::cam sua 
@echo off
chcp 65001 >nul
cls
COLOR E0
echo Đang khởi động, vui lòng chờ...
timeout /t 1 >nul

echo [1/4] Đang tải các tệp cần thiết...
timeout /t 1 >nul

echo [2/4] Kiểm tra cấu hình hệ thống...
timeout /t 1 >nul

echo [3/4] Kết nối ...
timeout /t 1 >nul

echo [4/4] Hoàn tất khởi động.
timeout /t 1 >nul

setlocal enabledelayedexpansion
for /L %%n in (1,1,1) do (
    set "spin=| / - \\"
    for %%i in (!spin!) do (
        <nul set /p "=%%i"
        timeout /t 0.2 >nul
        <nul set /p "="
    )
)
echo.
echo Phần mềm đã sẵn sàng!

:: @start "" https://sanhmobile.com/huong-dan-unlock-adb-cho-google-pixel-moi-nhat-2024/
@echo off
chcp 65001
cls
COLOR E0
echo =========================================================================================
echo =                                                                                       =
echo =                     +++      Sành - Google Pixel Tool +++                             =
echo =                                                                                       =
echo =                                                                                       =
echo =                   Tin Tức, Update mới nhất tại: https://sanhmobile.com/               =
echo =                          Nguồn tham khảo:     by Google_OTA                           =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =========================================================================================
echo.
:CHOICE0
:: Menu chính
@echo off
COLOR E0
@echo Chọn file:
@echo 1) Cài Đặt DRIVER
@echo 2) Kiểm Tra Kết Nối
@echo 3) Bắt Đầu UNLOCK PIXEL
@echo 4) Cài rom OTA qua Recovery
@echo 5) Cài rom COOK
@echo 6) Kiểm Tra Dung Lượng Pin
@echo 7) Fix MDM
@echo 0) EXIT
set /p type=Xin mời chọn:
if %type% geq 1 if %type% leq 7 (
    call :SHOW_LOADING "Đang xử lý, vui lòng chờ..."
    cls
)


if %type% == 1 GOTO DRIVER
if %type% == 2 GOTO TEST 
if %type% == 3 GOTO UNL
if %type% == 4 GOTO OTA
if %type% == 5 GOTO COOK
if %type% == 6 GOTO BAT
if %type% == 7 GOTO CHOICEU  
if %type% == 0 GOTO EXT

echo.
@echo chon (1..7 or 0)
echo.
GOTO CHOICE0

:SHOW_LOADING
cls
setlocal enabledelayedexpansion
set "message=%~1"
echo %message%
set "spin=| / - \\"
for /L %%n in (1,1,1) do (
    for %%i in (!spin!) do (
        <nul set /p "=%%i"
        timeout /t 1 >nul
        <nul set /p "="
    )
)
echo.
exit /b

:CHOICEU
@echo off
COLOR E0
@echo Chọn
@echo 1) MDM + UNLOCK Cách Cũ (user 10)
@echo 2) MDM + UNLOCK Cách Mới (android 14 update)
@echo 3) UNLOCK MDM NEW (ANDROID 14, 15)
@echo 0) Quay lại

set /p type=Xin mời chọn:

if %type% == 1 (
    call:SHOW_LOADING "Đang vào unlock MDM user 10..."
    cls
    GOTO MDMS
)

if %type% == 2 (
    call:SHOW_LOADING "Đang vào unlock MDM android 14..."
    cls
    GOTO NEWMDM)
if %type% == 3 (
    call:SHOW_LOADING "Đang vào unlock android 15...."
    cls
    GOTO MDM15)
if %type% == 0 GOTO CHOICE0

echo.
@echo Vui lòng chọn (1, 2, 3 hoặc 0).
echo.
GOTO CHOICEU


:COOK
@echo Chọn
@echo 1) Vào Fastboot
@echo 2) Mở BOOTLOADER
@echo 3) Up rom
@echo 0) Tro Ve Menu 
set /p type=Xin mời chọn:
if %type% == 1 GOTO FLHS
if %type% == 2 GOTO RBLD_1
if %type% == 3 GOTO RBLD 
if %type% == 0 GOTO CHOICE0

echo.
@echo chon (1, 2, 3 or 0)
echo.
GOTO COOK


:FLHS
adb kill-server
echo =========================================================================================
echo =                                                                                       =
echo =     Man Hinh Ma Den La Dien Thoai Dang Khong DUoc Ket Noi! ...                        =
echo =    Kiem tra may tinh cua ban da du DRIVER, chat luong cap USB de tranh co loi         =
echo =                                                                                       =
echo =         neu co ket noi moi qua trinh se tu dong                                       =
echo =========================================================================================
adb wait-for-device
echo =========================================================================================
echo =                                                                                       =
echo =                    Kich hoat USB Debugging bang Che Do Nha Phat Trien,                =
echo =                     ' Cho Phep ' go loi qua USB tren dien thoai                       =
echo =                                                                                       =
echo =========================================================================================
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                            An phim bat ki de " Bat Dau "                              =
echo =                                                                                       =
echo =========================================================================================
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
adb reboot bootloader
echo =========================================================================================
echo =                                                                                       =
ECHO =                                  Hoan Thanh!                                          =
echo =                                                                                       =
echo =========================================================================================
echo.
GOTO COOK

:RBLD_1
cls
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                     +++      Sanh - Google Pixel Tool +++                             =
echo =                                                                                       =
echo =                                                                                       =
echo =                   Tin Tuc, Update moi nhat tai: https://sanhmobile.com/               =
echo =                          Nguon tham khao:     by Google_OTA                           =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =========================================================================================
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo on
fastboot flashsing unlock
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo.
GOTO COOK


:RBLD
cls
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                     +++      Sanh - Google Pixel Tool +++                             =
echo =                                                                                       =
echo =                                                                                       =
echo =                   Tin Tuc, Update moi nhat tai: https://sanhmobile.com/               =
echo =                          Nguon tham khao:     by Google_OTA                           =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =========================================================================================
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo on
fastboot flash boot boot.img
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo on
fastboot flash dtbo dtbo.img
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo on
fastboot flash vendor_kernel_boot vendor_kernel_boot.img
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo on
fastboot flash vendor_boot vendor_boot.img
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo on
fastboot reboot recovery
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo on
adb sideload rom.zip
echo.
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo.
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
:TEST
cls
echo =========================================================================================
echo =                                                                                       =
echo =                             Kiem Tra Dien Thoai Ket Noi Voi PC...                     =
echo =                                                                                       =
echo =========================================================================================
adb devices
echo product_model:
adb shell getprop ro.product.model
echo android_build_version:
adb shell getprop ro.build.version.release
adb kill-server
echo.
GOTO CHOICE0

:UNL
cls
echo =========================================================================================
echo =                                                                                       =
echo =                     +++      Sành - Google Pixel Tool +++                             =
echo =                                                                                       =
echo =                                                                                       =
echo =                   Tin Tức, Update mới nhất tại: https://sanhmobile.com/               =
echo =                          Nguồn tham khảo:     by Google_OTA                           =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =========================================================================================
@echo Lựa chọn unlock:
@echo 1) UNLOCK CHO ANDROID (10, 11, 12)
@echo 2) UNLOCK CHO ANDROID 15 
@echo 3) UNLOCK CHO ANDROID 14 ( DÙNG 2 SIM )
@echo 0) Tro Ve Menu 
set /p type=Xin mời chọn:
if %type% == 1 (
    call :SHOW_LOADING "Đang xử lý UNLOCK CHO ANDROID (10, 11, 12), vui lòng chờ..."
    cls
    GOTO UNL1_1
)
if %type% == 2 (
    call :SHOW_LOADING "Đang xử lý UNLOCK CHO ANDROID 15, vui lòng chờ..."
    cls
    GOTO UNL1_2
)
if %type% == 3 (
    call :SHOW_LOADING "Đang xử lý UNLOCK CHO ANDROID 14 (DÙNG 2 SIM), vui lòng chờ..."
    cls
    GOTO UNL1_3
)
if %type% == 0 GOTO CHOICE0
:UNL1_3
echo =========================================================================================
echo =                                                                                       =
echo =                     +++      Sành - Google Pixel Tool +++                             =
echo =                                                                                       =
echo =                                                                                       =
echo =                   Tin Tức, Update mới nhất tại: https://sanhmobile.com/               =
echo =                          Nguồn tham khảo:     by Google_OTA                           =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =========================================================================================
adb wait-for-device
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =========================================================================================
echo.
adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  DeviceSetup.APK khi ma cai thanh cong [must be "deny"]:                                     =
echo =                                                                                       =
echo =========================================================================================
echo.
adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
adb kill-server
echo.
echo =========================================================================================
echo =                                                                                       =
echo =   Neu cac Pixel doi cu loi thong bao [Error: Unknown ....] thi se khong sao           =
echo =                                                                                       =
echo =  Vo hieu hoa quyen truy cap internet và du lieu trong "DeviceSetup"                   =
echo =  (xem video huong dan)                                                                =
echo =                                                                                       =
echo =========================================================================================
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  Dang cai dat NetGuard_v2.327_MOD *apk                                                =
echo =                                                                                       =
echo =========================================================================================
adb install NetGuard_v2.327_MOD.apk
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo =========================================================================================
echo =                                                                                       =
echo =  Su dung NetGuard_v2.327_MOD de tat cai dat mang                                      =
echo =                                                                                       =
echo =========================================================================================
echo.
:Q1
ECHO(
SET /P ANSWER=Do you want to start the video tutorial? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO Q2)
 IF /i {%ANSWER%}=={yes} (GOTO Q2)
 IF /i {%ANSWER%}=={n} (GOTO Q3)
 IF /i {%ANSWER%}=={no} (GOTO Q3)
ECHO(
ECHO Bad answer! Use only Y/N or Yes/No
GOTO Q1
:Q2
huong_dan.mp4
:Q3
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
COLOR 6F
echo SLAVA UKRAINI
adb kill-server
echo =========================================================================================
echo =                                                                                       =
echo =                    ĐỂ ỔN ĐỊNH CÁC BẠN NÊN TẮT UPDATE LUÔN NHÉ!...                     =
echo =                                                                                       =
echo =========================================================================================
echo.
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
GOTO CHOICEU
:UNL1_1
echo =========================================================================================
echo =                                                                                       =
echo =                     +++      Sành - Google Pixel Tool +++                             =
echo =                                                                                       =
echo =                                                                                       =
echo =                   Tin Tức, Update mới nhất tại: https://sanhmobile.com/               =
echo =                          Nguồn tham khảo:     by Google_OTA                           =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =========================================================================================
echo =========================================================================================
echo =                                                                                       =
echo =    Kiem tra may tinh cua ban da du DRIVER, chat luong cap USB de tranh co loi         =
echo =                                                                                       =
echo =         neu co ket noi moi qua trinh se tu dong                                       =
echo =========================================================================================
adb wait-for-device
echo.
adb shell pm uninstall -k --user 0 com.google.android.apps.work.oobconfig
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                    ĐỂ ỔN ĐỊNH CÁC BẠN NÊN TẮT UPDATE LUÔN NHÉ!...                     =
echo =                                                                                       =
echo =========================================================================================
echo.


:UNL1_2
echo =========================================================================================
echo =                                                                                       =
echo =                     +++      Sành - Google Pixel Tool +++                             =
echo =                                                                                       =
echo =                                                                                       =
echo =                   Tin Tức, Update mới nhất tại: https://sanhmobile.com/               =
echo =                          Nguồn tham khảo:     by Google_OTA                           =
echo =                                                                                       =
echo =                                                                                       =
echo =                                                                                       =
echo =========================================================================================
echo =========================================================================================
echo =                                                                                       =
echo =    Kiem tra may tinh cua ban da du DRIVER, chat luong cap USB de tranh co loi         =
echo =                                                                                       =
echo =         neu co ket noi moi qua trinh se tu dong                                       =
echo =========================================================================================
adb wait-for-device
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  DeviceSetup.APK file tu dong cai dat:                                                =
echo =                                                                                       =
echo =========================================================================================
echo.


echo.
adb shell device_config put oslo mcc_whitelist ua
adb shell device_config set_sync_disabled_for_tests persistent
adb shell device_config set_sync_disabled_for_tests none
adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
adb shell pm disable-user -user 0 com.google.android.factoryota
echo.
::adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
::adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
::adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
::adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
::adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
::adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
::adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
::adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
::adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
::adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
::adb kill-server
echo.
echo =========================================================================================
echo =                                                                                       =
echo =   Neu cac Pixel doi cu loi thong bao [Error: Unknown ....] thi se khong sao           =
echo =                                                                                       =
echo =  Vo hieu hoa quyen truy cap internet va du lieu trong "DeviceSetup"                   =
echo =  (xem video huong dan)                                                                =
echo =                                                                                       =
echo =========================================================================================
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                                 Hoan Thanh.....                                       =
echo =                                                                                       =
echo =========================================================================================
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                    ĐỂ ỔN ĐỊNH CÁC BẠN NÊN TẮT UPDATE LUÔN NHÉ!...                     =
echo =                                                                                       =
echo =========================================================================================
:Q01
ECHO(
SET /P ANSWER=Do you want to start the video tutorial? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO Q02)
 IF /i {%ANSWER%}=={yes} (GOTO Q02)
 IF /i {%ANSWER%}=={n} (GOTO Q03)
 IF /i {%ANSWER%}=={no} (GOTO Q03)
ECHO(
ECHO Bad answer! Use only Y/N or Yes/No
GOTO Q01
:Q02
huong_dan.mp4
:Q03
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo.
COLOR 6F
echo SLAVA UKRAINI
GOTO CHOICE0

:DRIVER
cls
IF DEFINED programfiles(x86) GOTO X86
:X86
ECHO(
ECHO Tien Hanh Cai Dat Driver...
ECHO ...........................
PING localhost -n 1 >NUL
START /wait driver\ADB_Installer /f 2
GOTO FIN

:FIN
ECHO(
ECHO Da Cai Dat Xong!
GOTO CHOICE0

:OTA
cls
@echo off
echo =========================================================================================
echo =                                                                                       =
echo =          OTA tu trang chu GOOGLE: https://developers.google.com/android/ota           =
echo =         Tai xuong FIRMWARE OTA moi nhat hoac giong ban cua ban bay gio                =
echo =                                                                                       =
echo =                         !!!!! Khong Phai La Ha Android  !!!!!                         =
echo =                                                                                       =
echo =                                 Ma La Update Android                                  =
echo =                                                                                       =
echo =========================================================================================

@echo Chọn
@echo 1) adb reboot recovery
@echo 2) Up rom Ota qua recovery
@echo 0) Tro Ve Menu 
set /p type=Xin mời chọn:
if %type% == 1 GOTO RECOV
if %type% == 2 GOTO FLS 
if %type% == 0 GOTO CHOICE0

echo.
@echo Please Enter a valid number (1, 2 or 0)
echo.
GOTO OTA

:RECOV
adb kill-server
echo =========================================================================================
echo =                                                                                       =
echo =     Man Hinh Ma Den La Dien Thoai Dang Khong DUoc Ket Noi! ...                        =
echo =    Kiem tra may tinh cua ban da du DRIVER, chat luong cap USB de tranh co loi         =
echo =                                                                                       =
echo =         neu co ket noi moi qua trinh se tu dong                                       =
echo =========================================================================================
adb wait-for-device
echo =========================================================================================
echo =                                                                                       =
echo =                    Kich hoat USB Debugging bang Che Do Nha Phat Trien,                =
echo =                     ' Cho Phep ' go loi qua USB tren dien thoai                       =
echo =                                                                                       =
echo =========================================================================================
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                            An phim bat ki de " Bat Dau "                              =
echo =                                                                                       =
echo =========================================================================================
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
adb reboot recovery
echo =========================================================================================
echo =                                                                                       =
ECHO =                                  Hoan Thanh!                                          =
echo =                                                                                       =
echo =========================================================================================
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
adb kill-server
GOTO OTA

:FLS
echo =========================================================================================
echo =                                                                                       =
echo =                       Tren dien thoai su dung phim "volume"                           =
echo =                       tim den tuy chon "Apply update from ADB"                        =
echo =                         xac nhan bang cach an nut "Power"                             =
echo =                                                                                       =
echo =========================================================================================
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                        Doi ten firmware da tai ve thanh "1"                           =
echo =                     va di chuyen thu muc vao file chuong trinh                        =
echo =                           ----- ten thu muc: "1.zip" -----                            =
echo =                                (xem video huong dan)                                  =
echo =                                                                                       =
echo =========================================================================================
echo.
SET /P ANSWER=Ban co muon xem video huong dan khong? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO Q02)
 IF /i {%ANSWER%}=={yes} (GOTO Q02)
 IF /i {%ANSWER%}=={n} (GOTO Q03)
 IF /i {%ANSWER%}=={no} (GOTO Q03)
ECHO(
ECHO Bad answer! Use only Y/N or Yes/No
GOTO Q01
:Q02
huong_dan.mp4
:Q03
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo =========================================================================================
ech0 =                                                                                       =
echo =                            An phim bat ki de " Bat Dau "                              =
echo =                                                                                       =
echo =========================================================================================
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo on
adb sideload 1.zip
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
adb kill-server
GOTO OTA

:MDMS
echo =========================================================================================
echo =                                                                                       =
echo =     Man Hinh Ma Den La Dien Thoai Dang Khong DUoc Ket Noi! ...                        =
echo =    Kiem tra may tinh cua ban da du DRIVER, chat luong cap USB de tranh co loi         =
echo =                                                                                       =
echo =         neu co ket noi moi qua trinh se tu dong                                       =
echo =========================================================================================
adb wait-for-device
echo =========================================================================================
echo =                                                                                       =
echo =  Xoa GOOGLE PLAY SERVICES:                                                            =
echo =                                                                                       =
echo =========================================================================================
adb shell pm uninstall -k --user 0 com.google.android.gms
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  DeviceSetup.APK parameters before magic:                                             =
echo =                                                                                       =
echo =========================================================================================
echo.
adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  DeviceSetup.APK killing result [must be "deny"]:                                     =
echo =                                                                                       =
echo =========================================================================================
echo.
adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
adb kill-server
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  Neu thong bao [Error: Unknown ....] thi OK voi ca dien thoai doi cu                  =
echo =                                                                                       =
echo =========================================================================================
echo.
echo =========================================================================================
echo =                                                                                       =
echo =               Thiet lap nguo dung cho "USER10",                                       =
echo =                     "device setup" tat WiFi va Pin                                    =
echo =     Doi voi user "OWNER" vao "device setup" tat WiFi and Battery                      =
echo =                                                                                       =
echo =                                                                                       =
echo =                         Bam phim bat ki de tiep tuc                                   =
echo =                                                                                       =
echo =========================================================================================
adb shell pm create-user 10
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo =========================================================================================
echo =                                                                                       =
echo =   DeviceSetup.APK killing result for USER10 [must be "deny"]:                         =
echo =                                                                                       =
echo =========================================================================================
adb shell cmd appops set --user 10 com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell appops get --user 10 com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell cmd appops set --user 10 com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell appops get --user 10 com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell cmd appops set --user 10 com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell appops get --user 10 com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell cmd appops set  --user 10 com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell appops get  --user 10 com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell cmd appops set  --user 10 com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
adb shell appops get  --user 10 com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
adb shell cmd appops write-settings
adb kill-server
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  if some [Error: Unknown ....] its OK for old Android devices. Its not a problem!     =
echo =                                                                                       =
echo =========================================================================================
echo.
echo.
COLOR 6F
echo SLAVA UKRAINI
adb kill-server
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
GOTO CHOICEU

:BAT
cls
@echo off
COLOR E0
echo.
echo =========================================================================================
echo =                                                                                       =
echo =                        +++   Sanh - Google Pixel Tool   +++                           =
echo =                                                                                       =
echo =                                                                                       =
echo =                   Tin Tuc, Update moi nhat tai: https://sanhmobile.com/               =
echo =                                                                                       =
echo =========================================================================================
echo.
echo product_model:
adb shell getprop ro.product.model
echo.
echo android_build_version:
adb shell getprop ro.build.version.release
echo.
echo serial_number:
adb get-serialno
echo.
echo cycle_count
adb shell cat sys/class/power_supply/battery/cycle_count

echo "0" >file1.tmp
echo "0" >file2.tmp
echo "0" >file3.tmp
adb shell getprop ro.product.model >file1.tmp
<file1.tmp set /p "model="
adb shell cat /sys/class/power_supply/battery/charge_full >file2.tmp
<file2.tmp set /p "charge="
adb shell cat sys/class/power_supply/battery/charge_full_design >file3.tmp
<file3.tmp set /p "charge="

set /a "full="0
if "%model%"=="Pixel" echo Pixel thông số pin thiết kế 2770mah
if "%model%"=="Pixel XL" echo Pixel XL thông số pin thiết kế 3450mah
if "%model%"=="Pixel 2" echo Pixel 2 thông số pin thiết kế 2700mah
if "%model%"=="Pixel 2 XL" echo Pixel 2 XL thông số pin thiết kế 3520mah
if "%model%"=="Pixel 3" echo Pixel 3 thông số pin thiết kế 2915mah
if "%model%"=="Pixel 3 XL" echo Pixel 3 XL thông số pin thiết kế 3430mah
if "%model%"=="Pixel 3a" echo Pixel 3a thông số pin thiết kế 3000mah
if "%model%"=="Pixel 3a XL" echo Pixel 3a XL thông số pin thiết kế 3700mah
if "%model%"=="Pixel 4" echo Pixel 4 thông số pin thiết kế 2800mah
if "%model%"=="Pixel 4 XL" echo Pixel 4 XL thông số pin thiết kế 3700mah
if "%model%"=="Pixel 4a" echo Pixel 4a thông số pin thiết kế 3140mah
if "%model%"=="Pixel 4a (5G)" echo Pixel 4a (5G) thông số pin thiết kế 3885mah
if "%model%"=="Pixel 5" echo Pixel 5 thông số pin thiết kế 4080mah
if "%model%"=="Pixel 5a" echo Pixel 5a thông số pin thiết kế 4680mah
if "%model%"=="Pixel 6" echo Pixel 6 thông số pin thiết kế 4614mah
if "%model%"=="Pixel 6 Pro" echo Pixel 6 Pro thông số pin thiết kế 5003mah
if "%model%"=="Pixel 6a" echo Pixel 6a thông số pin thiết kế 4410mah
if "%model%"=="Pixel 7" echo Pixel 7 thông số pin thiết kế 4355mah
if "%model%"=="Pixel 7 Pro" echo Pixel 7 Pro thông số pin thiết kế 5000mah
if "%model%"=="Pixel 7a" echo Pixel 7a thông số pin thiết kế 4385mah
if "%model%"=="Pixel 8" echo Pixel 8 thông số pin thiết kế 4575mah
if "%model%"=="Pixel 8 Pro" echo Pixel 8 Pro thông số pin thiết kế 5050mah
if "%model%"=="Pixel 8a" echo Pixel 8a thông số pin thiết kế 4486mah
if "%model%"=="Pixel 9" echo Pixel 9 thông số pin thiết kế 4700mah
if "%model%"=="Pixel 9 Pro" echo Pixel 9 Pro thông số pin thiết kế 4700mah
if "%model%"=="Pixel 9 Pro XL" echo Pixel 9 Pro XL thông số pin thiết kế 5060mah
if "%model%"=="Pixel 9 Pro Fold" echo Pixel 9 thông số pin thiết kế 5060mah





echo %model% thông số pin còn lại %charge%%%

set /a "percent="0
if "%model%"=="Pixel" set /a "percent="(%charge%/27700)
if "%model%"=="Pixel XL" set /a "percent="(%charge%/34500)
if "%model%"=="Pixel 2" set /a "percent="(%charge%/27000)
if "%model%"=="Pixel 2 XL" set /a "percent="(%charge%/35200)
if "%model%"=="Pixel 3" set /a "percent="(%charge%/29150)
if "%model%"=="Pixel 3 XL" set /a "percent="(%charge%/34300)
if "%model%"=="Pixel 3a" set /a "percent="(%charge%/30000)
if "%model%"=="Pixel 3a XL" set /a "percent="(%charge%/37000)
if "%model%"=="Pixel 4" set /a "percent="(%charge%/28000)
if "%model%"=="Pixel 4 XL" set /a "percent="(%charge%/37000)
if "%model%"=="Pixel 4a" set /a "percent="(%charge%/31400)
if "%model%"=="Pixel 4a (5G)" set /a "percent="(%charge%/38850)
if "%model%"=="Pixel 5" set /a "percent="(%charge%/40800)
if "%model%"=="Pixel 5a" set /a "percent="(%charge%/46800)
if "%model%"=="Pixel 6" set /a "percent="(%charge%/46140)
if "%model%"=="Pixel 6 Pro" set /a "percent="(%charge%/50030)
if "%model%"=="Pixel 6a" set /a "percent="(%charge%/44100)
if "%model%"=="Pixel 7" set /a "percent="(%charge%/43550)
if "%model%"=="Pixel 7 Pro" set /a "percent="(%charge%/50000)
if "%model%"=="Pixel 7a" set /a "percent="(%charge%/43850)
if "%model%"=="Pixel 8" set /a "percent="(%charge%/45750)
if "%model%"=="Pixel 8 Pro" set /a "percent="(%charge%/50500)
if "%model%"=="Pixel 8a" set /a "percent="(%charge%/44860)
if "%model%"=="Pixel 9" set /a "percent="(%charge%/47000)
if "%model%"=="Pixel 9 Pro" set /a "percent="(%charge%/47000)
if "%model%"=="Pixel 9 Pro XL" set /a "percent="(%charge%/50600)
if "%model%"=="Pixel 9 Pro Fold" set /a "percent="(%charge%/50600)


echo %model% còn được %percent%%% pin

echo.
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
adb kill-server
echo.
COLOR 6F

GOTO CHOICE0

:NEWMDM
echo =========================================================================================
echo =                                                                                       =
echo =     If you see a blank screen for a long time, your phone is not connected! ...       =
echo =    check the drivers, the quality of the USB cable, and other possible malfunctions   =
echo =                                                                                       =
echo =         if the connection is restored, the process will continue automatically        =
echo =========================================================================================
adb wait-for-device
echo =========================================================================================
echo =                                                                                       =
echo =  UNINSTALL PLAY MARKET:    (for MDM bypass)                                           =
echo =                                                                                       =
echo =========================================================================================
adb shell pm uninstall -k --user 0 com.android.vending
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  Disable carrier lock                                                                 =
echo =                                                                                       =
echo =  DeviceSetup.APK parameters before magic:                                             =
echo =                                                                                       =
echo =========================================================================================
echo.
adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  DeviceSetup.APK khi ma cai thanh cong [must be "deny"]:                                     =
echo =                                                                                       =
echo =========================================================================================
echo.
adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
adb kill-server
echo.
echo =========================================================================================
echo =                                                                                       =
echo =   Neu cac Pixel doi cu loi thong bao [Error: Unknown ....] thi se khong sao           =
echo =                                                                                       =
echo =  Vo hieu hoa quyen truy cap internet và du lieu trong "DeviceSetup"                   =
echo =  (xem video huong dan)                                                                =
echo =                                                                                       =
echo =========================================================================================
echo.
:Q1
ECHO(
SET /P ANSWER=Do you want to start the video tutorial? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO Q2)
 IF /i {%ANSWER%}=={yes} (GOTO Q2)
 IF /i {%ANSWER%}=={n} (GOTO Q3)
 IF /i {%ANSWER%}=={no} (GOTO Q3)
ECHO(
ECHO Bad answer! Use only Y/N or Yes/No
GOTO Q1
:Q2
huong_dan.mp4
:Q3
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo =========================================================================================
echo =                                                                                       =
echo =  Dang cai dat aurora market 4.5.1 *apk                                                =
echo =                                                                                       =
echo =========================================================================================
adb install aurora451.apk
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
echo =========================================================================================
echo =                                                                                       =
echo =  Su dung aurora market de cai dat                                                     =
echo =                                                                                       =
echo =========================================================================================
echo.
COLOR 6F
echo  SanhMobile - Số 1 về Google Pixel
adb kill-server
pause >nul | echo Bấm phím bất kỳ để tiếp tục...
GOTO CHOICEU

:MDM15
cls
echo =========================================================================================
echo =                                                                                       =
echo =     Trước khi bắt đầu mở khóa, hãy làm các bước sau:                                  =
echo =     - Tháo SIM                                                                        =
echo =     - Khôi phục cài đặt gốc                                                           =
echo =     - Tắt các kết nối mạng                                                            =
echo =     - Bật tính năng Gỡ lỗi USB                                                        =
echo =                                                                                       =
echo =========================================================================================
pause >nul | echo Bấm phím bất kỳ để tiếp tục... >nul | echo Bấm phím bất kỳ để tiếp tục...
echo =========================================================================================
echo =                                                                                       =
echo =     Nếu màn hình trống trong thời gian dài, điện thoại chưa được kết nối!             =
echo =             Hãy kiểm tra Gỡ lỗi USB, driver, chất lượng cáp USB                       =
echo =                          và các vấn đề khác có thể xảy ra                             =
echo =         Khi kết nối thành công, quá trình sẽ tự động tiếp tục                         =
echo =========================================================================================
adb wait-for-device
echo =========================================================================================
echo =                                                                                       =
echo =  DISABLE OTA:                                                                         =
echo =                                                                                       =
echo =========================================================================================
adb shell device_config put oslo mcc_whitelist ua
adb shell device_config set_sync_disabled_for_tests persistent
adb shell device_config set_sync_disabled_for_tests none
adb shell pm disable-user --user 0 com.google.android.factoryota
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  GỠ BỎ CÁC PHẦN MỀM CẦN THIẾT:                                                        =
echo =                                                                                       =
echo =========================================================================================
adb shell pm uninstall -k --user 0 com.google.android.carriersetup
adb shell pm uninstall -k --user 0 com.google.android.pixel.setupwizard
adb shell pm uninstall -k --user 0 com.google.android.setupwizard
adb shell pm uninstall -k --user 0 com.google.android.pixel.setupwizard.auto_generated_rro_product__
adb shell pm uninstall -k --user 0 com.google.android.partnersetup
adb shell pm uninstall -k --user 0 com.google.android.pixel.setupwizard.overlay
adb shell pm uninstall -k --user 0 com.google.android.pixel.setupwizard.overlay2019
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  GỠ BỎ CỬA HÀNG GOOGLE PLAY:                                                          =
echo =                                                                                       =
echo =========================================================================================
adb shell pm uninstall -k --user 0 com.android.vending
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  ĐANG CÀI ĐẶT CÁC CỬA HÀNG ỨNG DỤNG THAY THẾ                                          =
echo =  Thời gian: 	5 phút                                                                   =
echo =                                                                                       =
echo =========================================================================================

adb install aurora451.apk
adb install AppGallery.apk
echo =========================================================================================
echo =                                                                                       =
echo =  SỬ DỤNG CỬA HÀNG ỨNG DỤNG THAY THẾ THAY CHO GOOGLE PLAY                              =
echo =  (để cài đặt và cập nhật ứng dụng)                                                    =
echo =                                                                                       =
echo =========================================================================================
echo.
pause >nul | echo Bấm phím bất kỳ để tiếp tục... >nul | echo Bấm phím bất kỳ để tiếp tục...
echo =========================================================================================
echo =                                                                                       =
echo =  ĐANG CHỈNH SỬA QUYỀN CHO ỨNG DỤNG "DeviceSetup"                                      =
echo =                                                                                       =
echo =  Thông tin quyền hiện tại của DeviceSetup.APK:                                        =
echo =                                                                                       =
echo =========================================================================================
echo.
adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  DeviceSetup.APK change permission result [must be "deny"]:                           =
echo =                                                                                       =
echo =========================================================================================
echo.
adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell appops get com.google.android.apps.work.oobconfig WAKE_LOCK
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell appops get com.google.android.apps.work.oobconfig START_FOREGROUND
adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
adb shell appops get com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS
adb kill-server
echo.
echo =========================================================================================
echo =                                                                                       =
echo =  Bây giờ hãy tắt quyền truy cập mạng và dữ liệu nền cho "DeviceSetup"                 =
echo =                                                                                       =
echo =  BẠN CẦN THỰC HIỆN THAO TÁC NÀY THỦ CÔNG TRONG CÀI ĐẶT ĐIỆN THOẠI                     =
echo =                                                                                       =
echo =  (Xem video hướng dẫn huong_dan.mp4)                                                  =
echo =                                                                                       =
echo =                     Tin Tức, Update mới nhất tại: https://sanhmobile.com              =
echo =                                                                                       =
echo =========================================================================================
echo.
:Q01
ECHO(
SET /P ANSWER=Bạn có muốn mở video hướng dẫn không? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO Q02)
 IF /i {%ANSWER%}=={n} (GOTO Q03)
ECHO(
ECHO Câu trả lời không hợp lệ! Chỉ nhập Y/N
GOTO Q01
:Q02
huong_dan.mp4
:Q03
pause >nul | echo Bấm phím bất kỳ để tiếp tục... >nul | echo Bấm phím bất kỳ để tiếp tục...
echo.
COLOR 6F
echo  SanhMobile - Số 1 về Google Pixel
GOTO CHOICEU




pause >nul | echo Bấm phím bất kỳ để tiếp tục...


:EXT


