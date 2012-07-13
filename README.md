# AOSP-Jellybean for Kindle Fire

## Info

|||
|-----------------------------------:|:--------------------------|
|**Discussion thread**: | http://forum.xda-developers.com/showthread.php?t=1411895
|**Building thread**:   | http://forum.xda-developers.com/showthread.php?p=20844007#post20844007
|**IRC Channel**:   	| #kindlefire-dev on freenode
|**Bug List**:	    	| https://docs.google.com/spreadsheet/ccc?key=0AqxTqi6CPt-RdEtHbFhHNDdjZGVONld1OGFEYmRiWUE#gid=0


## Building 

### Initialize
[Get started](https://github.com/KFire-Android/android_local_manifest/wiki)

### Download sources

```bash
mkdir jb-aosp
cd jb-aosp/
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/repo
chmod a+x ~/repo
repo init -u https://android.googlesource.com/platform/manifest -b android-4.1.1_r1
wget -O .repo/local_manifest.xml https://raw.github.com/KFire-Android/android_local_manifest/jb-aosp/local_manifest.xml 
repo sync -j16
```

### Compile

```bash
. build/envsetup.sh
lunch full_otter-userdebug
make otapackage (can add -j# for cores to use: make -j32 otapackage)
```
