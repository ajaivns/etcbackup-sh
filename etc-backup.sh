#!/bin/bash
        BKPDIRNAME="neoweb7-fs"
        SRVNAME="NEOWEB7"
        DTK=7
        ADMINADDR="kurian@neotericuk.co.uk"
        TOADDR="backup-report@neotericuk.com"
            SRCD="/etc"
            TGTD="/backup/$BKPDIRNAME/etc-bck/"
            mkdir -p $TGTD
            OF=etc-$(date +%Y%m%d).tgz
        cd $TGTD
        find $TGTD -type f -mtime +"$DTK" -iname "*.tgz" -exec rm -vf {} \;
            tar -czf $TGTD$OF $SRCD
            [ $? = 0 ] && echo "Backup done." | mail -s "/etc backup $SRVNAME" "$TOADDR" || echo "Backup not done." | mail -s "ERROR /etc - $SRVNAME" "$ADMINADDR" "$TOADDR"

cd /backup/$BKPDIRNAME
