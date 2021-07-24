sudo vim /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="acpi_osi='Windows 2018' acpi_backlight=vendor"  
sudo update-grub

also suspend and resume to make keyboard fn keys work
--in order to fix screen brightness bar 

Boot up stats:
systemd-analyze

Aliases:
alias -p
echo 'alias ls="ls -l"' >> ~/.bashrc 
. ~/.bashrc

#!Redefined functions 
cd() {
    if [[ $@ == "projects" ]]; then
        command cd "/home/ab/workspace/projects"
    else
        command cd "$@"
    fi
}

unalias ls

SCP: 
scp foobar.txt your_username@remotehost.edu:/some/remote/directory 

SSH:
ssh username@hostname -i "path/to/private/key"

make ssh send heart bits:
ServerAliveInterval 15
ServerAliveCount 3
~/.ssh/config

GPU:
add to use discrete gpu
export DRI_PRIME=1 to ~/.profile

check - 
DRI_PRIME=1 glxinfo | grep "OpenGL renderer"

VMWare:
cd /usr/lib/vmware/modules/source
tar xf vmmon.tar
tar xf vmnet.tar
cd vmmon-only
make
cd ../vmnet-only
make
cd ..
mkdir /lib/modules/`uname -r`/misc
cp vmmon.o /lib/modules/`uname -r`/misc/vmmon.ko
cp vmnet.o /lib/modules/`uname -r`/misc/vmnet.ko
depmod -a
/etc/init.d/vmware restart 

mks.gl.allowBlacklistedDrivers = "TRUE"


GNOME smaller bars:
.titlebar, headerbar {
    min-height: 0px;
    padding: 0px;
    margin: 0px;
}
headerbar entry,
headerbar spinbutton,
headerbar button,
headerbar separator {
    min-height: 0px;
    padding: 0px;
    margin: 1px;
}
/*
more or less normal
write this in ~\.config\gtk-3.0\gtk.css
use slashes instead of backslashes
slashes just terrifyin my nano (:
*/


GPU passthrough vbox:
https://davidyat.es/2016/09/08/gpu-passthrough/#part-1-setting-up-passthrough


Firefox performance improvements:
about:config
browser.cache.disk.enable -> false
browser.cache.memory.enable -> true

e. Then you're going to determine how much memory can be used as RAM cache. Copy/paste this into the filter bar (search bar):
browser.cache.memory.capacity
That entry should exist already (if not, create it now).
The current integer value will probably be -1, which automates the maximum size of the RAM cache dependent on the available amount of RAM. So far so good, but this automation usually creates a cache that's far too small....
So set it to 524288 (KB, which equals a maximum of 512 MB). That's usually enough for all amounts of RAM. But if you have RAM to spare, I recommend 1048576, which equals a maximum of 1 GB.


Prints load times:
systemd-analyze
systemd-analyze blame

Disable GNOME CTRL+ALFT+LEFT/RIGHT hotkeys for switching the desktops
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['']"


IntellijIdea:
IntellijIdea reset trial:
rm -rf ~/.config/JetBrains/IntelliJIdea*/eval
rm -rf ~/.config/JetBrains/PyCharm*/options/other.xml (if exists)
sed -i -E 's/<property name=\"evl.*\".*\/>//' ~/.config/JetBrains/IntelliJIdea*/options/other.xml
rm -rf ~/.java/.userPrefs/jetbrains/idea


--fix scaling
-Dsun.java2d.uiScale.enabled=false

old VM Options
-Xms4096m
-Xmx4096m
-XX:ReservedCodeCacheSize=512m
-XX:+UseConcMarkSweepGC
-XX:SoftRefLRUPolicyMSPerMB=50
-XX:CICompilerCount=2
-XX:+HeapDumpOnOutOfMemoryError
-XX:-OmitStackTraceInFastThrow
-ea
-Dsun.io.useCanonCaches=false
-Djdk.http.auth.tunneling.disabledSchemes=""
-Djdk.attach.allowAttachSelf=true
-Djdk.module.illegalAccess.silent=true
-Dkotlinx.coroutines.debug=off
-Dsun.tools.attach.tmp.only=true
-Dsun.java2d.uiScale.enabled=false

new VM Options
-Xms4096m
-Xmx4096m
-Xss64m
-XX:ReservedCodeCacheSize=512m
-XX:+UseCompressedOops
-XX:NewRatio=2
-Dfile.encoding=UTF-8
-XX:SoftRefLRUPolicyMSPerMB=250
-XX:NewSize=512m
-XX:MaxNewSize=512m
-XX:ParallelGCThreads=8
-XX:MaxTenuringThreshold=1
-XX:SurvivorRatio=8
-XX:+UseCodeCacheFlushing
-XX:+CMSClassUnloadingEnabled
-XX:+CMSParallelRemarkEnabled
-XX:CMSInitiatingOccupancyFraction=65
-XX:+CMSScavengeBeforeRemark
-XX:+UseCMSInitiatingOccupancyOnly
-XX:-TraceClassUnloading
-XX:+AlwaysPreTouch
-XX:+TieredCompilation
-XX:+DoEscapeAnalysis
-XX:+UnlockExperimentalVMOptions
-XX:LargePageSizeInBytes=256m
-XX:+DisableExplicitGC
-XX:+ExplicitGCInvokesConcurrent
-XX:+PrintFlagsFinal
-XX:+UseAdaptiveGCBoundary
-XX:CompileThreshold=10000
-XX:+OptimizeStringConcat
-XX:+UnlockDiagnosticVMOptions
-ea
-Dsun.io.useCanonCaches=false
-Djava.net.preferIPv4Stack=true
-XX:-OmitStackTraceInFastThrow
-Xverify:none
-XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log
-XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof
-Dide.no.platform.update=true
-Dsun.java2d.uiScale.enabled=false
