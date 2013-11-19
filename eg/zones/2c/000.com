@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		381989863
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
www-dx	300	A	1.2.1.1
www-any	300	A	2.2.2.2
www	300	GLB:MM	www-any	:unknown
www-hebeidx	300	A	1.1.1.1
www	300	GLB:MM	www-dx	guangdongdx	1.0	:rrgood
www	300	GLB:MM	www-dx	guizhoudx	1.0	:rrgood
www	300	GLB:MM	www-dx	ningxiadx	1.0	:rrgood
www	300	GLB:MM	www-dx	shanxidx	1.0	:rrgood
www	300	GLB:MM	www-dx	henandx	1.0	:rrgood
www	300	GLB:MM	www-dx	beijingdx	1.0	:rrgood
www	300	GLB:MM	www-dx	chongqingdx	1.0	:rrgood
www	300	GLB:MM	www-dx	hubeidx	1.0	:rrgood
www	300	GLB:MM	www-hebeidx	hebeidx	1.0	:rrgood
www	300	GLB:MM	www-dx	zhejiangdx	1.0	:rrgood
www	300	GLB:MM	www-dx	jilindx	1.0	:rrgood
www	300	GLB:MM	www-dx	tianjindx	1.0	:rrgood
www	300	GLB:MM	www-dx	heilongjiangdx	1.0	:rrgood
www	300	GLB:MM	www-dx	liaoningdx	1.0	:rrgood
www	300	GLB:MM	www-dx	yunnandx	1.0	:rrgood
www	300	GLB:MM	www-dx	jiangsudx	1.0	:rrgood
www	300	GLB:MM	www-dx	shanghaidx	1.0	:rrgood
www	300	GLB:MM	www-dx	hunandx	1.0	:rrgood
www	300	GLB:MM	www-dx	shandongdx	1.0	:rrgood
www	300	GLB:MM	www-dx	guangxidx	1.0	:rrgood
www	300	GLB:MM	www-dx	hainandx	1.0	:rrgood
www	300	GLB:MM	www-dx	jiangxidx	1.0	:rrgood
www	300	GLB:MM	www-dx	sichuandx	1.0	:rrgood
www	300	GLB:MM	www-dx	xizangdx	1.0	:rrgood
www	300	GLB:MM	www-dx	fujiandx	1.0	:rrgood
www	300	GLB:MM	www-dx	gansudx	1.0	:rrgood
www	300	GLB:MM	www-dx	anhuidx	1.0	:rrgood
www	300	GLB:MM	www-dx	xinjiangdx	1.0	:rrgood
www	300	GLB:MM	www-dx	qinghaidx	1.0	:rrgood
www	300	GLB:MM	www-dx	sanxidx	1.0	:rrgood
www	300	GLB:MM	www-dx	neimenggudx	1.0	:rrgood
www-sanxidx	300	CNAME	www.aba.com.
www	300	GLB:MM	www-sanxidx	sanxidx	1.0	:rrgood
