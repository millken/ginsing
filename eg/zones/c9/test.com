@	3600	SOA      cloudns1.seccdn.com. dns-admin.seccdn.com. (
		383713617
		86400
		15M;
		1W;
		10 )
		NS		cloudns1.seccdn.com.
		NS		cloudns2.seccdn.com.
		NS		cloudns1.seccdn.net.
		NS		cloudns2.seccdn.net.
	
1	300 A  1.1.1.1
1	300 A 2.2.2.2
test.switch2	300	A	42.120.20.245
www-any	600	A	1.1.1.3
www	600	GLB:MM	www-any	:unknown
www-beijingdx	600	A	2.3.4.5
dx-1 300 A 1.1.1.1
dx-1 300 CNAME 12.com.
dx-2 300 A 2.2.2.2
dx-2 300 CNAME test.com.sdf.
fujiandx-dx 300 A 43.12.1.1
guizhoudx-dx 300 A 4.1.12.12
beijingdx-dx 300 A 3.2.2.2
guangdongdx-dx 300 A 2.2.2.2

shanghailt-lt 300 A 8.7.6.5
sichuanlt-lt 300 A 4.3.21.1
jiangsult-lt 300 A 2.20.12.12
any-lt 300 A 1.2.1.1

sch  300  A  43.34.2.1

xianggang-wire  300 A 66.66.66.66
aomen-wire  300 A 77.77.77.77
taiwan-wire  300 A 88.88.88.88
overseas-wire  300 A 99.99.99.99

any-liaoningdx 300 A 10.10.10.10
@	600	GLB:MM	dx-2	:unknown
@	600	GLB:MM	dx-2	shanghaidx	1.0	:rrgood
@  600	GLB:MM	dx-1	zhejiangdx	1.0	:rrgood
@  600	GLB:MM	fujiandx-dx	 fujiandx	1.0	:rrgood
@  600	GLB:MM	guizhoudx-dx	 guizhoudx	1.0	:rrgood
@  600	GLB:MM	beijingdx-dx	  beijingdx	1.0	:rrgood
@  600	GLB:MM	guangdongdx-dx	  guangdongdx	1.0	:rrgood
@  600	GLB:MM	1	dx	1.0	:rrgood

@  600	GLB:MM	shanghailt-lt	shanghailt	1.0	:rrgood
@  600	GLB:MM	sichuanlt-lt	sichuanlt	1.0	:rrgood
@  600	GLB:MM	jiangsult-lt	jiangsult	1.0	:rrgood
@  600	GLB:MM	any-lt	lt	1.0	:rrgood
@ 300 MX 5 asdf.cc.
@ 300 A   3.4.5.6



@  600	GLB:MM	sch	 searchengine	1.0	:rrgood

@  600	GLB:MM	xianggang-wire	 xianggang	1.0	:rrgood
@  600	GLB:MM	aomen-wire	 aomen	1.0	:rrgood
@  600	GLB:MM	taiwan-wire	 taiwan	1.0	:rrgood
@  600	GLB:MM	overseas-wire	 overseas	1.0	:rrgood

*  600	GLB:MM	any-liaoningdx	 liaoningdx	1.0	:rrgood

