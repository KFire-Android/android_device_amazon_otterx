# CM9 for Kindle Fire

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
mkdir cm9
cd cm9/
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/repo
chmod a+x ~/repo
repo init -u git://github.com/CyanogenMod/android.git -b ics
wget -O .repo/local_manifest.xml https://raw.github.com/KFire-Android/android_local_manifest/ics/local_manifest.xml 
repo sync -j16
./vendor/cm/get-prebuilts
```

### Compile

```bash
source build/envsetup.sh
brunch otter -j$(grep -c processor /proc/cpuinfo)
```
