@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		381989866
		86400
		15M;
		1W;
		10 )
		NS		cloudns1.seccdn.com.
		NS		cloudns2.seccdn.com.
		NS		cloudns6.seccdn.com.
		NS		cloudns34.seccdn.com.
		NS		cloudns35.seccdn.com.
		NS		cloudns74.seccdn.com.
		NS		cloudns37.seccdn.com.
		NS		cloudns38.seccdn.com.
		NS		cloudns31.seccdn.com.
		NS		cloudns30.seccdn.com.
		NS		ns4.seccdn.com.
		NS		cloudns3.seccdn.com.
		NS		cloudns32.seccdn.com.
		NS		cloudns33.seccdn.com.
@	300	TXT	v=spf1 include:spf.163.com ~all
@	300	MX	5	mx.mail.ym.163.com.
@	300	A	103.19.85.231
bbs	300	A	103.19.85.231
m	300	A	103.19.85.231
mysql	300	A	103.19.85.231
www	300	A	103.19.85.231
calendar	300	CNAME	login.secureserver.net.
email	300	CNAME	email.secureserver.net.
fax	300	CNAME	login.secureserver.net.
files	300	CNAME	login.secureserver.net.
ftp	300	CNAME	goldwebly.com.
imap	300	CNAME	imap.secureserver.net.
mail	300	CNAME	ym.163.com.
mobilemail	300	CNAME	mobilemail-v01.prod.mesa1.secureserver.net.
pop	300	CNAME	pop.secureserver.net.
smtp	300	CNAME	smtp.secureserver.net.
