### android emulator api 30
#### install play store
1. 下载镜像
x86 Image选项卡>API Level 30 ABIx86_64
下载完成后,确认system-images\android-30\目录下有google_apis_playstore
2. 修改配置文件
vim ~/.android/avd/$emulator_name/config.ini
PlayStore.enabled = true
image.sysdir.1 = system-images\android-30\google_apis_playstore\x86_64\
tag.display = Google PlayStore
tag.id = google_playstore


