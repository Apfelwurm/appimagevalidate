#!/bin/bash
set -ex
[ -z "$PUBKEYASC" ] && echo "Public Key not set, you have to specify it in the PUBKEYASC environment variable!" && exit
[ -z "$APPIMAGEFILE" ] && echo "Appimage filename missing, you have to specify it in APPIMAGEFILE!" && exit

[ ! -f /work/$PUBKEYASC ] && echo "/work/$PUBKEYASC does not exist." && exit
[ ! -f /work/$APPIMAGEFILE ] && echo "/work/$APPIMAGEFILE does not exist." && exit



gpg2 --import /work/$PUBKEYASC
validate /work/$APPIMAGEFILE
