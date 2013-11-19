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
at-dx	600	A	118.244.152.131
at-lt	600	A	118.244.152.131
at-searchengine	600	A	118.244.152.131
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
at	600	GLB:MM	at-searchengine	searchengine	1.0	:rrgood
bbs-lt	600	A	118.244.152.131
bbs-any	600	A	118.244.152.131
bbs	600	GLB:MM	bbs-any	:unknown
bbs-dx	600	A	118.244.152.131
bbs-searchengine	600	A	118.244.152.131
bbs	600	GLB:MM	bbs-lt	heilongjianglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	yunnanlt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	chongqinglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	guangdonglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	xizanglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	shanghailt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	shandonglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	anhuilt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	fujianlt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	liaoninglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	hunanlt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	ningxialt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	henanlt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	jiangsult	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	guizhoult	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	jiangxilt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	hubeilt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	jilinlt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	hebeilt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	gansult	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	hainanlt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	xinjianglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	tianjinlt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	shanxilt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	beijinglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	guangxilt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	qinghailt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	zhejianglt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	sichuanlt	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	neimenggult	1.0	:rrgood
bbs	600	GLB:MM	bbs-lt	sanxilt	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	guangdongdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	guizhoudx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	ningxiadx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	shanxidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	henandx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	beijingdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	chongqingdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	hubeidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	hebeidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	zhejiangdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	jilindx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	tianjindx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	heilongjiangdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	liaoningdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	yunnandx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	jiangsudx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	shanghaidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	hunandx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	shandongdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	guangxidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	hainandx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	jiangxidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	sichuandx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	xizangdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	fujiandx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	gansudx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	anhuidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	xinjiangdx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	qinghaidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	sanxidx	1.0	:rrgood
bbs	600	GLB:MM	bbs-dx	neimenggudx	1.0	:rrgood
bbs	600	GLB:MM	bbs-searchengine	searchengine	1.0	:rrgood
@	ALIAS	at
