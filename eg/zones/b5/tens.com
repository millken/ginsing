@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		381989876
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
ac	300	A	1.1.1.1
ac	400	A	2.2.2.2
ac	500	A	3.3.3.3
test	400	A	2.2.2.2
test	5000	A	3.3.3.3
www	5000	A	1.1.1.1
www2	500	A	2.2.2.2
