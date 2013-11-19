@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		381989864
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
at-lt	600	A	119.252.247.58
at-any	600	A	113.105.172.32
at	600	GLB:MM	at-any	:unknown
at-dx	600	A	113.105.172.32
at	600	GLB:MM	at-lt	heilongjianglt	1.0	:rrgood
at	600	GLB:MM	at-lt	yunnanlt	1.0	:rrgood
at	600	GLB:MM	at-lt	chongqinglt	1.0	:rrgood
at	600	GLB:MM	at-lt	guangdonglt	1.0	:rrgood
at	600	GLB:MM	at-lt	xizanglt	1.0	:rrgood
at	600	GLB:MM	at-lt	shanghailt	1.0	:rrgood
at	600	GLB:MM	at-lt	shandonglt	1.0	:rrgood
at	600	GLB:MM	at-lt	anhuilt	1.0	:rrgood
at	600	GLB:MM	at-lt	fujianlt	1.0	:rrgood
at	600	GLB:MM	at-lt	liaoninglt	1.0	:rrgood
at	600	GLB:MM	at-lt	hunanlt	1.0	:rrgood
at	600	GLB:MM	at-lt	ningxialt	1.0	:rrgood
at	600	GLB:MM	at-lt	henanlt	1.0	:rrgood
at	600	GLB:MM	at-lt	jiangsult	1.0	:rrgood
at	600	GLB:MM	at-lt	guizhoult	1.0	:rrgood
at	600	GLB:MM	at-lt	jiangxilt	1.0	:rrgood
at	600	GLB:MM	at-lt	hubeilt	1.0	:rrgood
at	600	GLB:MM	at-lt	jilinlt	1.0	:rrgood
at	600	GLB:MM	at-lt	hebeilt	1.0	:rrgood
at	600	GLB:MM	at-lt	gansult	1.0	:rrgood
at	600	GLB:MM	at-lt	hainanlt	1.0	:rrgood
at	600	GLB:MM	at-lt	xinjianglt	1.0	:rrgood
at	600	GLB:MM	at-lt	tianjinlt	1.0	:rrgood
at	600	GLB:MM	at-lt	shanxilt	1.0	:rrgood
at	600	GLB:MM	at-lt	beijinglt	1.0	:rrgood
at	600	GLB:MM	at-lt	guangxilt	1.0	:rrgood
at	600	GLB:MM	at-lt	qinghailt	1.0	:rrgood
at	600	GLB:MM	at-lt	zhejianglt	1.0	:rrgood
at	600	GLB:MM	at-lt	sichuanlt	1.0	:rrgood
at	600	GLB:MM	at-lt	neimenggult	1.0	:rrgood
at	600	GLB:MM	at-lt	sanxilt	1.0	:rrgood
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
www-lt	600	A	119.252.247.58
www-any	600	A	113.105.172.32
www	600	GLB:MM	www-any	:unknown
www-dx	600	A	113.105.172.32
www	600	GLB:MM	www-lt	heilongjianglt	1.0	:rrgood
www	600	GLB:MM	www-lt	yunnanlt	1.0	:rrgood
www	600	GLB:MM	www-lt	chongqinglt	1.0	:rrgood
www	600	GLB:MM	www-lt	guangdonglt	1.0	:rrgood
www	600	GLB:MM	www-lt	xizanglt	1.0	:rrgood
www	600	GLB:MM	www-lt	shanghailt	1.0	:rrgood
www	600	GLB:MM	www-lt	shandonglt	1.0	:rrgood
www	600	GLB:MM	www-lt	anhuilt	1.0	:rrgood
www	600	GLB:MM	www-lt	fujianlt	1.0	:rrgood
www	600	GLB:MM	www-lt	liaoninglt	1.0	:rrgood
www	600	GLB:MM	www-lt	hunanlt	1.0	:rrgood
www	600	GLB:MM	www-lt	ningxialt	1.0	:rrgood
www	600	GLB:MM	www-lt	henanlt	1.0	:rrgood
www	600	GLB:MM	www-lt	jiangsult	1.0	:rrgood
www	600	GLB:MM	www-lt	guizhoult	1.0	:rrgood
www	600	GLB:MM	www-lt	jiangxilt	1.0	:rrgood
www	600	GLB:MM	www-lt	hubeilt	1.0	:rrgood
www	600	GLB:MM	www-lt	jilinlt	1.0	:rrgood
www	600	GLB:MM	www-lt	hebeilt	1.0	:rrgood
www	600	GLB:MM	www-lt	gansult	1.0	:rrgood
www	600	GLB:MM	www-lt	hainanlt	1.0	:rrgood
www	600	GLB:MM	www-lt	xinjianglt	1.0	:rrgood
www	600	GLB:MM	www-lt	tianjinlt	1.0	:rrgood
www	600	GLB:MM	www-lt	shanxilt	1.0	:rrgood
www	600	GLB:MM	www-lt	beijinglt	1.0	:rrgood
www	600	GLB:MM	www-lt	guangxilt	1.0	:rrgood
www	600	GLB:MM	www-lt	qinghailt	1.0	:rrgood
www	600	GLB:MM	www-lt	zhejianglt	1.0	:rrgood
www	600	GLB:MM	www-lt	sichuanlt	1.0	:rrgood
www	600	GLB:MM	www-lt	neimenggult	1.0	:rrgood
www	600	GLB:MM	www-lt	sanxilt	1.0	:rrgood
www	600	GLB:MM	www-dx	guangdongdx	1.0	:rrgood
www	600	GLB:MM	www-dx	guizhoudx	1.0	:rrgood
www	600	GLB:MM	www-dx	ningxiadx	1.0	:rrgood
www	600	GLB:MM	www-dx	shanxidx	1.0	:rrgood
www	600	GLB:MM	www-dx	henandx	1.0	:rrgood
www	600	GLB:MM	www-dx	beijingdx	1.0	:rrgood
www	600	GLB:MM	www-dx	chongqingdx	1.0	:rrgood
www	600	GLB:MM	www-dx	hubeidx	1.0	:rrgood
www	600	GLB:MM	www-dx	hebeidx	1.0	:rrgood
www	600	GLB:MM	www-dx	zhejiangdx	1.0	:rrgood
www	600	GLB:MM	www-dx	jilindx	1.0	:rrgood
www	600	GLB:MM	www-dx	tianjindx	1.0	:rrgood
www	600	GLB:MM	www-dx	heilongjiangdx	1.0	:rrgood
www	600	GLB:MM	www-dx	liaoningdx	1.0	:rrgood
www	600	GLB:MM	www-dx	yunnandx	1.0	:rrgood
www	600	GLB:MM	www-dx	jiangsudx	1.0	:rrgood
www	600	GLB:MM	www-dx	shanghaidx	1.0	:rrgood
www	600	GLB:MM	www-dx	hunandx	1.0	:rrgood
www	600	GLB:MM	www-dx	shandongdx	1.0	:rrgood
www	600	GLB:MM	www-dx	guangxidx	1.0	:rrgood
www	600	GLB:MM	www-dx	hainandx	1.0	:rrgood
www	600	GLB:MM	www-dx	jiangxidx	1.0	:rrgood
www	600	GLB:MM	www-dx	sichuandx	1.0	:rrgood
www	600	GLB:MM	www-dx	xizangdx	1.0	:rrgood
www	600	GLB:MM	www-dx	fujiandx	1.0	:rrgood
www	600	GLB:MM	www-dx	gansudx	1.0	:rrgood
www	600	GLB:MM	www-dx	anhuidx	1.0	:rrgood
www	600	GLB:MM	www-dx	xinjiangdx	1.0	:rrgood
www	600	GLB:MM	www-dx	qinghaidx	1.0	:rrgood
www	600	GLB:MM	www-dx	sanxidx	1.0	:rrgood
www	600	GLB:MM	www-dx	neimenggudx	1.0	:rrgood
@	ALIAS	at
