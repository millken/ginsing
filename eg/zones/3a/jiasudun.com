@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		381989862
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
ns1	300	CNAME	ns1.seccdn.com.
ns2	300	CNAME	ns2.seccdn.com.
vipns1	300	CNAME	ns1.seccdn.com.
vipns2	300	CNAME	ns2.seccdn.com.