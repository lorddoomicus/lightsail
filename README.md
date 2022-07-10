# A script to fetch mime files from S3 and deliver them.

This script will get mime files saved by SES in an S3 bucket and deliver them.  It has many prequirements:

- A Lightsail server with Lamp Stack running
- A domain name managed by Amazon and linked to the Lightsail server
- The domain has to be verified with S3
- A recive rule that sends incoming email to an S3 bucket
- sendmail on the lightsale server configured to send email using SES
- the _aws_ command installed

__NOTE:__ As of now, this only supports sendmail. sendmail MUST be installed and configured correctly for it to work!  

Pointers to the necessary instructions and some notes can be found at this blog post:

https://www.doomd.net/an-email-server-in-lightsail-its-harder-than-it-sounds.html

## License

All files are covered under the GNU General Public License v2.

(c) 2017 Derrik Walker v2.0, dwalker@doomd.net
