@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		381989871
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
xing-lt	300	A	103.246.155.245
xing-any	300	A	61.164.248.53
*	300	GLB:MM	xing-any	:unknown
*	300	GLB:MM	xing-lt	heilongjianglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	yunnanlt	1.0	:rrgood
*	300	GLB:MM	xing-lt	chongqinglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	guangdonglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	xizanglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	shanghailt	1.0	:rrgood
*	300	GLB:MM	xing-lt	shandonglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	anhuilt	1.0	:rrgood
*	300	GLB:MM	xing-lt	fujianlt	1.0	:rrgood
*	300	GLB:MM	xing-lt	liaoninglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	hunanlt	1.0	:rrgood
*	300	GLB:MM	xing-lt	ningxialt	1.0	:rrgood
*	300	GLB:MM	xing-lt	henanlt	1.0	:rrgood
*	300	GLB:MM	xing-lt	jiangsult	1.0	:rrgood
*	300	GLB:MM	xing-lt	guizhoult	1.0	:rrgood
*	300	GLB:MM	xing-lt	jiangxilt	1.0	:rrgood
*	300	GLB:MM	xing-lt	hubeilt	1.0	:rrgood
*	300	GLB:MM	xing-lt	jilinlt	1.0	:rrgood
*	300	GLB:MM	xing-lt	hebeilt	1.0	:rrgood
*	300	GLB:MM	xing-lt	gansult	1.0	:rrgood
*	300	GLB:MM	xing-lt	hainanlt	1.0	:rrgood
*	300	GLB:MM	xing-lt	xinjianglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	tianjinlt	1.0	:rrgood
*	300	GLB:MM	xing-lt	shanxilt	1.0	:rrgood
*	300	GLB:MM	xing-lt	beijinglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	guangxilt	1.0	:rrgood
*	300	GLB:MM	xing-lt	qinghailt	1.0	:rrgood
*	300	GLB:MM	xing-lt	zhejianglt	1.0	:rrgood
*	300	GLB:MM	xing-lt	sichuanlt	1.0	:rrgood
*	300	GLB:MM	xing-lt	neimenggult	1.0	:rrgood
*	300	GLB:MM	xing-lt	sanxilt	1.0	:rrgood
www-lt	300	A	103.246.155.245
www-any	300	A	61.164.248.53
www	300	GLB:MM	www-any	:unknown
www	300	GLB:MM	www-lt	heilongjianglt	1.0	:rrgood
www	300	GLB:MM	www-lt	yunnanlt	1.0	:rrgood
www	300	GLB:MM	www-lt	chongqinglt	1.0	:rrgood
www	300	GLB:MM	www-lt	guangdonglt	1.0	:rrgood
www	300	GLB:MM	www-lt	xizanglt	1.0	:rrgood
www	300	GLB:MM	www-lt	shanghailt	1.0	:rrgood
www	300	GLB:MM	www-lt	shandonglt	1.0	:rrgood
www	300	GLB:MM	www-lt	anhuilt	1.0	:rrgood
www	300	GLB:MM	www-lt	fujianlt	1.0	:rrgood
www	300	GLB:MM	www-lt	liaoninglt	1.0	:rrgood
www	300	GLB:MM	www-lt	hunanlt	1.0	:rrgood
www	300	GLB:MM	www-lt	ningxialt	1.0	:rrgood
www	300	GLB:MM	www-lt	henanlt	1.0	:rrgood
www	300	GLB:MM	www-lt	jiangsult	1.0	:rrgood
www	300	GLB:MM	www-lt	guizhoult	1.0	:rrgood
www	300	GLB:MM	www-lt	jiangxilt	1.0	:rrgood
www	300	GLB:MM	www-lt	hubeilt	1.0	:rrgood
www	300	GLB:MM	www-lt	jilinlt	1.0	:rrgood
www	300	GLB:MM	www-lt	hebeilt	1.0	:rrgood
www	300	GLB:MM	www-lt	gansult	1.0	:rrgood
www	300	GLB:MM	www-lt	hainanlt	1.0	:rrgood
www	300	GLB:MM	www-lt	xinjianglt	1.0	:rrgood
www	300	GLB:MM	www-lt	tianjinlt	1.0	:rrgood
www	300	GLB:MM	www-lt	shanxilt	1.0	:rrgood
www	300	GLB:MM	www-lt	beijinglt	1.0	:rrgood
www	300	GLB:MM	www-lt	guangxilt	1.0	:rrgood
www	300	GLB:MM	www-lt	qinghailt	1.0	:rrgood
www	300	GLB:MM	www-lt	zhejianglt	1.0	:rrgood
www	300	GLB:MM	www-lt	sichuanlt	1.0	:rrgood
www	300	GLB:MM	www-lt	neimenggult	1.0	:rrgood
www	300	GLB:MM	www-lt	sanxilt	1.0	:rrgood
