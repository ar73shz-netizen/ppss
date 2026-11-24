set -e
P=android/app/src/main/java/com/mihan/personalmanager
R=android/app/src/main/res
M=android/app/src/main/AndroidManifest.xml
cp native/*.java $P/
mkdir -p $R/layout $R/xml $R/drawable
cp native/agenda_widget.xml $R/layout/
cp native/agenda_widget_info.xml $R/xml/
cp native/widget_bg.xml $R/drawable/
sed -i 's#</application>#<receiver android:name=".AgendaWidgetProvider" android:exported="true"><intent-filter><action android:name="android.appwidget.action.APPWIDGET_UPDATE"/></intent-filter><meta-data android:name="android.appwidget.provider" android:resource="@xml/agenda_widget_info"/></receiver></application>#' $M
sed -i 's#</manifest>#<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/><uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/><uses-permission android:name="android.permission.USE_EXACT_ALARM"/><uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/><uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" android:maxSdkVersion="32"/></manifest>#' $M
