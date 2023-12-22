#!/bin/bash

# GLOBAL VARIABLES
CONTINUE=1

# Display
clear
cat << \EOF

  +--------------------------+
  |                          |
  |      XIAOMI DEBLOAT      |
  |                          |
  | Author: Naum Ivanovski   |
  +--------------------------+
  
  Note: You need to have ADB (Android Debug Bridge) installed on your PC
        and USB debugging enabled on you phone.
EOF

# Display Menu
Menu (){
    echo ""
    echo "Choose from the options: "
    echo "   1) Check device."
    echo "   2) Remove Google Bloatware. "
    echo "   3) Remove Xiaomi Bloatware."
    echo "   4) Remove 3rd Party Bloatware."
    echo "   5) List installed packages."
    echo "   q) Quit."
    echo ""
    read -p "Your Option: " OPTION;
    case $OPTION in
        1) CheckDevice ;;
        2) RemoveGoogle ;;
        3) RemoveXiaomi ;;
        4) RemoveOther ;;
        5) ListInstalledPackages ;;
        q) CONTINUE=0 ;;
        *) clear ;;
    esac
}

# FUNCTIONS
CheckDevice (){
    adb devices
}

ListInstalledPackages () {
    adb shell pm list packages
}

RemoveGoogle () {
    adb shell pm uninstall --user 0 com.google.android.youtube
    adb shell pm uninstall --user 0 com.google.android.apps.docs
    adb shell pm uninstall --user 0 com.google.android.apps.safetyhub
    adb shell pm uninstall --user 0 com.google.android.apps.healthdata
    adb shell pm uninstall --user 0 com.google.android.projection.gearhead
    adb shell pm uninstall --user 0 com.google.android.apps.googleassistant
    adb shell pm uninstall --user 0 com.google.android.apps.photos
    adb shell pm uninstall --user 0 com.google.android.apps.subscriptions.red
    adb shell pm uninstall --user 0 com.google.android.googlequicksearchbox
    adb shell pm uninstall --user 0 com.google.android.music
    adb shell pm uninstall --user 0 com.google.android.videos
    adb shell pm uninstall --user 0 com.google.ar.lens
    adb shell pm uninstall --user 0 com.google.android.apps.wellbeing
    adb shell pm uninstall --user 0 com.google.android.apps.tachyon
    adb shell pm uninstall --user 0 com.google.android.apps.walletnfcrel
    # Android
    adb shell pm uninstall --user 0 com.android.soundrecorder
    adb shell pm uninstall --user 0 com.android.stk
    adb shell pm uninstall --user 0 com.android.chrome
}

RemoveXiaomi () {
    adb shell pm uninstall --user 0 com.miui.fm
    adb shell pm uninstall --user 0 com.miui.fmservice
    adb shell pm uninstall --user 0 com.xiaomi.midrop
    adb shell pm uninstall --user 0 com.miui.weather2
    adb shell pm uninstall --user 0 com.miui.player
    adb shell pm uninstall --user 0 com.miui.videoplayer
    adb shell pm uninstall --user 0 com.mi.globalbrowser
    adb shell pm uninstall --user 0 com.miui.compass
    adb shell pm uninstall --user 0 com.xiaomi.glgm
    adb shell pm uninstall --user 0 com.miui.mishare.connectivity
    adb shell pm uninstall --user 0 com.xiaomi.bluetooth
    adb shell pm uninstall --user 0 com.xiaomi.bluetooth.overlay
    adb shell pm uninstall --user 0 com.miui.enbbs
    adb shell pm uninstall --user 0 com.mi.android.globalminusscreen
    adb shell pm uninstall --user 0 com.mi.globalminusscreen
    adb shell pm uninstall --user 0 com.miui.yellowpage
    adb shell pm uninstall --user 0 com.miui.miservice # MI Feedback
    adb shell pm uninstall --user 0 com.xiaomi.payment # Xiaomi Payment
    adb shell pm uninstall --user 0 com.micredit.in
    adb shell pm uninstall --user 0 com.mipay.wallet.in
}

RemoveOther () {
    # WPS Office suite
    adb shell pm uninstall --user 0 cn.wps.xiaomi.abroad.lite
    # MI Remote Controller
    adb shell pm uninstall --user 0 com.duokan.phone.remotecontroller
    adb shell pm uninstall --user 0 com.duokan.phone.remotecontroller.peel.plugin
    # FACEBOOK
    adb shell pm uninstall --user 0 com.facebook.katana
    adb shell pm uninstall --user 0 com.facebook.appmanager
    adb shell pm uninstall --user 0 com.facebook.services
    adb shell pm uninstall --user 0 com.facebook.system
}

# START MENU
while [ $CONTINUE ]
do
    Menu
    if [ $CONTINUE -eq 0 ];then
        echo "Goodbye.";
        break
    fi
done

exit