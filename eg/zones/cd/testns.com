@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		381989873
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
testmx	3000	MX	5	abc.com.
testmx	4000	MX	6	dwad.com.
testa	1000	A	1.1.1.1
testa	2000	A	2.2.2.2
testa	3000	A	3.3.3.3
testcname	3000	CNAME	abac.co.
testcname	3000	CNAME 	lsdjf.cl.
