#!/bin/bash
#
#  (c) 2017 Derrik Walker v2.0
#  deliver_ses_mail.sh
# 
# Fetches mime files from an s3 bucket, and uses sendmail to deliver them
#  
#  NOTES: 
# 	1) The SES_BUCKET env varible must be set for this to work right: *
#  		SES_BUCKET="<s3_bucket>/<prefix>" ./deliver_ses_mail.sh
# 
#  	2) All accountes referenced in the "To:" for the mime file MUST
# 	   have a local account or be in the aliases file
# 
# 	3) This absoultely requires sendmail to be installed.
# 	   Don't like sendmail? Add support for your favorite MTA, and
# 	   send me the updates - I'll include them!
#  
#  For more information, see this blog post:
#  http://www.doomd.net/2017/08/an-email-server-in-lightsail-its-harder-than-it-sounds.html
# 
#  This is licensed for use under the GNU General Pulbic License v2
# 
#  2017-08-13	dw2	Initial Version                                                         
#                                                                                              

dir=$(mktemp -d) 

bucket="s3://${SES_BUCKET}/"

if [ ! -n "$SES_BUCKET" ]
then
	echo "ERRR!!! bucket not set"
	exit 1
fi
	
cd $dir

for msg in $( aws s3 ls $bucket | awk '{print $4}' )
do
	aws s3 mv ${bucket}${msg} .
	/usr/sbin/sendmail -i -t < $msg 
done	

cd 
rm -r $dir

