# Jellybean 4.2.1 (CM10.1) Device for Kindle Fire (1st Gen)

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
mkdir android
cd android
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/repo
chmod a+x ~/repo
repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1
wget -O .repo/local_manifest.xml https://raw.github.com/KFire-Android/android_local_manifest/cm-10.1/local_manifest.xml 
repo sync -j16
```

### Compile

```bash
. build/envsetup.sh
lunch cm_otter-userdebug
. vendor/cm/get-prebuilts
mka bacon
```