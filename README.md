# AOSP-Jellybean for Kindle Fire

## Info

|||
|-----------------------------------:|:--------------------------|
|**Discussion thread**: | http://forum.xda-developers.com/showthread.php?t=1765288
|**IRC Channel**:   	| #kindlefire-dev on freenode


## Building 

### Initialize
[Get started](https://github.com/KFire-Android/android_local_manifest/wiki)

### Download sources

```bash
mkdir jb-aosp
cd jb-aosp/
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/repo
chmod a+x ~/repo
repo init -u git://github.com/CyanogenMod/android.git -b jellybean
wget -O .repo/local_manifest.xml https://raw.github.com/KFire-Android/android_local_manifest/jb-cm/local_manifest.xml 
repo sync -j16
```

### Compile

```bash
. build/envsetup.sh
lunch full_otter-userdebug
make otapackage (can add -j# for cores to use: make -j32 otapackage)
```
