@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		381989872
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
123	300	CNAME	ddcomic.com.diyseccdn.seccdn3.com.
at-any	300	CNAME	ddcomic.com.diyseccdn.seccdn3.com.
at	300	GLB:MM	at-any	:unknown
www-any	300	CNAME	ddcomic.com.diyseccdn.seccdn3.com.
www	300	GLB:MM	www-any	:unknown
at-searchengine	300	A	121.165.95.175
at	300	GLB:MM	at-searchengine	searchengine	1.0	:rrgood
www-searchengine	300	A	121.165.95.175
www	300	GLB:MM	www-searchengine	searchengine	1.0	:rrgood
@	ALIAS	at
