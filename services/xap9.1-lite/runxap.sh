
XAPBINDIR=$1

CLASSPATH=
bootclasspath=
CLASS=
COMMAND=
CP=
EXT_JARS=
EXT_JAVA_OPTIONS=
GS_JARS=
GS_LIB=
GS_LOGGING_CONFIG_FILE=
GS_LOGGING_CONFIG_FILE_PROP=
JAVA_OPTIONS=
JSHOMEDIR=
LOOKUPGROUPS=
LOOKUPLOCATORS=
SIGAR_JARS=
PRE_CLASSPATH=
POST_CLASSPATH=
AGENT_ID=
GSA_SERVICE_ID=
ENABLE_DYNAMIC_LOCATORS=
RMI_OPTIONS=
LOOKUP_LOCATORS_PROP=
LOOKUP_GROUPS_PROP=
command_line=
startParm=
launchTarget=
options=

BINDIR=install/gigaspaces-xap-9.1-lite/gigaspaces-xap-premium-9.1.0-ga/bin

$BINDIR/gs-agent.sh gsa.gsm 1 gsa.gsc 1 &
sleep 10
$BINDIR/gs-webui.sh
