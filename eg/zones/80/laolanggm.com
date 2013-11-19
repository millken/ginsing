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
at-dx	600	A	115.239.225.191
at	600	GLB:MM	at-dx	guangdongdx	1.0	:rrgood
at	600	GLB:MM	at-dx	guizhoudx	1.0	:rrgood
at	600	GLB:MM	at-dx	ningxiadx	1.0	:rrgood
at	600	GLB:MM	at-dx	shanxidx	1.0	:rrgood
at	600	GLB:MM	at-dx	henandx	1.0	:rrgood
at	600	GLB:MM	at-dx	beijingdx	1.0	:rrgood
at	600	GLB:MM	at-dx	chongqingdx	1.0	:rrgood
at	600	GLB:MM	at-dx	hubeidx	1.0	:rrgood
at	600	GLB:MM	at-dx	hebeidx	1.0	:rrgood
at	600	GLB:MM	at-dx	zhejiangdx	1.0	:rrgood
at	600	GLB:MM	at-dx	jilindx	1.0	:rrgood
at	600	GLB:MM	at-dx	tianjindx	1.0	:rrgood
at	600	GLB:MM	at-dx	heilongjiangdx	1.0	:rrgood
at	600	GLB:MM	at-dx	liaoningdx	1.0	:rrgood
at	600	GLB:MM	at-dx	yunnandx	1.0	:rrgood
at	600	GLB:MM	at-dx	jiangsudx	1.0	:rrgood
at	600	GLB:MM	at-dx	shanghaidx	1.0	:rrgood
at	600	GLB:MM	at-dx	hunandx	1.0	:rrgood
at	600	GLB:MM	at-dx	shandongdx	1.0	:rrgood
at	600	GLB:MM	at-dx	guangxidx	1.0	:rrgood
at	600	GLB:MM	at-dx	hainandx	1.0	:rrgood
at	600	GLB:MM	at-dx	jiangxidx	1.0	:rrgood
at	600	GLB:MM	at-dx	sichuandx	1.0	:rrgood
at	600	GLB:MM	at-dx	xizangdx	1.0	:rrgood
at	600	GLB:MM	at-dx	fujiandx	1.0	:rrgood
at	600	GLB:MM	at-dx	gansudx	1.0	:rrgood
at	600	GLB:MM	at-dx	anhuidx	1.0	:rrgood
at	600	GLB:MM	at-dx	xinjiangdx	1.0	:rrgood
at	600	GLB:MM	at-dx	qinghaidx	1.0	:rrgood
at	600	GLB:MM	at-dx	sanxidx	1.0	:rrgood
at	600	GLB:MM	at-dx	neimenggudx	1.0	:rrgood
www	600	A	115.239.225.191
@	ALIAS	at
