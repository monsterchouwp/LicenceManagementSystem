<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link rel="stylesheet" href="./static/css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="./static/css/font-awesome.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- online-fonts -->
	<link href="//fonts.googleapis.com/css?family=PT+Serif:400,400i,700,700i" rel="stylesheet">
	<!-- //online-fonts -->
	<style type="text/css">
	@charset "utf-8";
/*--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
--*/
/* reset */
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,dl,dt,dd,ol,nav ul,nav li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
article, aside, details, figcaption, figure,footer, header, hgroup, menu, nav, section {display: block;}
ol,ul{list-style:none;margin:0px;padding:0px;}
blockquote,q{quotes:none;}
blockquote:before,blockquote:after,q:before,q:after{content:'';content:none;}
table{border-collapse:collapse;border-spacing:0;}
/* start editing from here */
a{text-decoration:none;}
.txt-rt{text-align:right;}/* text align right */
.txt-lt{text-align:left;}/* text align left */
.txt-center{text-align:center;}/* text align center */
.float-rt{float:right;}/* float right */
.float-lt{float:left;}/* float left */
.clear{clear:both;}/* clear float */
.pos-relative{position:relative;}/* Position Relative */
.pos-absolute{position:absolute;}/* Position Absolute */
.vertical-base{	vertical-align:baseline;}/* vertical align baseline */
.vertical-top{	vertical-align:top;}/* vertical align top */
nav.vertical ul li{	display:block;}/* vertical menu */
nav.horizontal ul li{	display: inline-block;}/* horizontal menu */
img{max-width:100%;}
/*end reset*/
body {
	background: #0296bc;
    background-position: center;
    text-align: center;
     font-family: 'PT Serif', serif;
	height: 100vh;
}
/*--header--*/
.header-w3l {
    padding-top: 2em;
}
.header-w3l h1 {
    font-size: 3.5em;
    color: #fff;
    letter-spacing: 10px;
    font-weight: 300;
    text-shadow: 4px 5px 8px #101010;
}
.header-w3l h1 span {
    color: #fb6906;
}
/*--//header--*/
/*--main--*/
.sub-main-w3 {
    width: 29%;
    margin: 125px auto;
   background:#eaf4f659;
    padding: 50px;
}
.sub-main-w3 h2 {
    color: #fff;
    font-size: 1.8em;
    letter-spacing: 1px;
    margin-bottom: 1em;
    font-weight: 300;
}
.pom-agile {
    padding: 12px 15px;
    border-bottom:2px solid #eaf4f659;
    background: #fff;
}
.pom-agile:nth-child(1){
    margin-bottom: 15px;
}
.pom-agile input[type="text"], .pom-agile input[type="password"] {
    outline: none;
    font-size: .9em;
    border: none;
    background: transparent;
    width: 93%;
    color: #000;
    letter-spacing: 1px;
}
.right-w3l input[type="submit"] {
    color: #fff;
    background:#09a5cd;
    border: none;
    padding: 12px 45px;
    outline: none;
    font-size: .9em;
    cursor: pointer;
    letter-spacing: 1px;
    -webkit-transition: 0.5s all;
    -o-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -ms-transition: 0.5s all;
    transition: 0.5s all;
}
.right-w3l input[type="submit"]:hover {
    background: #fff;
    color: black;
	-webkit-transition: 0.5s all;
    -o-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -ms-transition: 0.5s all;
	transition: 0.5s all;
}
span.fa {
    float: left;
    color: #000;
    margin: 0.2em 0 0 0;
}
.sub-w3l {
    padding: 20px 0 30px;
}
.sub-agile {
    float: left;
}
.sub-agile input[type="checkbox"] {
    display: none;
}
.sub-agile input[type="checkbox"]+label {
    position: relative;
    padding-left: 25px;
    display: inline-block;
    font-size: .9em;
    color: #fff;
    cursor: pointer;
}
.sub-agile input[type="checkbox"]+label span:first-child {
    width: 13px;
    height: 13px;
    display: inline-block;
    border: 1px solid #fff;
    position: absolute;
    top: 1px;
    left: 2px;
}
.sub-agile input[type="checkbox"]:checked+label span:first-child:before {
    content: "";
    background: url(../images/tick.png) no-repeat;
    position: absolute;
    left: 2px;
    top: 1px;
    font-size: 10px;
    width: 10px;
    height: 10px;
}
.sub-w3l a {
    float: right;
    font-size: .9em;
    color: #fff;
}
/*--placeholder-color--*
::-webkit-input-placeholder{
	color:#fff;
}
:-moz-placeholder { /* Firefox 18- *
   color: #fff; 
}
::-moz-placeholder {  /* Firefox 19+ *
   color: #fff;  
}
:-ms-input-placeholder {  
   color: #fff;  
}
/*--//placeholder-color--*/
/*--//main--*/
/*--footer--*/
.footer {
    margin: 2em 0;
}
.footer p {
    font-size: .9em;
    color:#fff;
    letter-spacing: 2px;
}
.footer p a {
    color: #fff;
	-webkit-transition: 0.5s all;
    -o-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -ms-transition: 0.5s all;
	transition: 0.5s all;
}
.footer p a:hover {
    color: #fff;
	-webkit-transition: 0.5s all;
    -o-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -ms-transition: 0.5s all;
	transition: 0.5s all;
}
/*--//footer--*/

/*--responsive--*/
@media(max-width: 1440px){
    .footer {
        margin-bottom: 40px;
    }
    .sub-main-w3 {
        margin: 100px auto;
    }
}
@media(max-width: 1366px){
    .sub-main-w3 {
        width: 31%;
    }
}
@media(max-width: 1280px){
    .header-w3l h1 {
        font-size: 3.4em;
        letter-spacing: 9px;
    }
    .sub-main-w3 {
        width: 34%;
    }
}
@media(max-width: 1080px){
    .header-w3l h1 {
        font-size: 3.2em;
    }
    .sub-main-w3 {
        width: 38%;
        padding: 40px 50px;
    }
}
@media(max-width: 1024px){
    .sub-main-w3 {
        width: 42%;
    }
}
@media(max-width: 900px){
    .header-w3l h1 {
        font-size: 3em;
        letter-spacing: 8px;
    }
    .sub-main-w3 h2 {
        font-size: 1.7em;
    }
    .sub-main-w3 {
        width: 47%;
        margin: 70px auto;
    }
}
@media(max-width: 800px){
    .header-w3l {
        padding-top: 1em;
    }
}
@media(max-width: 768px){
    .header-w3l {
        padding-top: 3em;
    }
	.sub-main-w3 {
    margin: 61px auto;
    width: 50%;
	}
}
@media(max-width: 736px){
    .sub-main-w3 {
        width: 56%;
    }
    .header-w3l {
        padding-top: 1em;
    }
    .sub-main-w3 {
        margin: 70px auto;
    }
}
@media(max-width: 667px){
    .header-w3l h1 {
        letter-spacing: 6px;
    }
    .pom-agile {
        padding: 10px 15px;
    }
    .sub-main-w3 {
        width: 61%;
        padding: 35px 40px;
    }
    .footer {
        margin-bottom: 28px;
    }
}
@media(max-width: 600px){
    .footer p {
        font-size: .8em;
    }
    .header-w3l h1 {
        font-size: 2.9em;
    }
}
@media(max-width: 568px){
    .header-w3l h1 {
        font-size: 2.7em;
    }
    .sub-main-w3 {
        width: 64%;
    }
    .pom-agile input[type="text"], .pom-agile input[type="password"] {
        width: 91%;
    }
}
@media(max-width: 480px){
    .header-w3l h1 {
        font-size: 2.3em;
        letter-spacing: 5px;
    }
    .sub-main-w3 h2 {
        font-size: 1.5em;
    }
    .sub-main-w3 {
        width: 69%;
    }
    .footer p {
        line-height: 1.9;
        letter-spacing: 1px
    }
}
@media(max-width: 440px){

}
@media(max-width: 414px){
    .header-w3l h1 {
        letter-spacing: 3px;
    }
    .header-w3l {
        padding-top: 1.5em;
    }
    .sub-main-w3 {
        width: 75%;
        padding: 30px 35px;
        margin: 80px auto;
    }
}
@media(max-width: 384px){
    .header-w3l h1 {
        letter-spacing: 2px;
        font-size: 2.2em;
    }
    .right-w3l input[type="submit"] {
        padding: 10px 38px;
    }
    .sub-main-w3 {
        margin: 60px auto;
    }
    .pom-agile input[type="text"], .pom-agile input[type="password"] {
        width: 89%;
    }
}
@media(max-width: 375px){

}
@media(max-width: 320px){
    .header-w3l h1 {
        letter-spacing: 2px;
        font-size: 1.7em;
    }
    .sub-main-w3 h2 {
        font-size: 1.3em;
    }
    .sub-agile input[type="checkbox"]+label {
        padding-left: 22px;
        font-size: .8em;
    }
    .sub-w3l a {
        font-size: .8em;
    }
    .pom-agile input[type="text"], .pom-agile input[type="password"] {
        font-size: .8em;
        width: 87%;
    }
    .pom-agile {
        padding: 10px 10px;
    }
    .sub-main-w3 {
        margin: 37px auto;
        width: 76%;
        padding: 23px 25px;
    }
    .right-w3l input[type="submit"] {
        font-size: .8em;
    }
    span.fa {
        line-height: 1.2;
    }
}
/*--//responsive--*/
	</style>
</head>
<body>
<!--header-->
	<div class="header-w3l">
		<h1>用户注册页面</h1>
	</div>
	<!--//header-->
	<div class="main-content-agile" >
		<div class="sub-main-w3" style="border-radius:25px;">
			<h2>Register Here</h2>
			<form action="RegisterServlet" method="post">
				<div class="pom-agile" style="border-radius:25px;">
					<span class="fa fa-user" aria-hidden="true"></span>
					<input placeholder="Account" name="UserName" class="user" type="text" required="">
				</div>
				<div class="pom-agile" style="margin-bottom: 15px; border-radius:25px;">
					<span class="fa fa-key" aria-hidden="true"></span>
					<input placeholder="Password" name="Password" class="pass" type="text" required="">
				</div>
				<div class="pom-agile" style="border-radius:25px;">
					<span class="fa fa-phone" aria-hidden="true"></span>
					<input placeholder="Phone Number" name="phoneNum" class="user" type="text" required="">
				</div>
				<div class="sub-w3l">
					<div class="sub-agile">
					<%
						if(request.getAttribute("reg")!=null){		
							String str=(String)request.getAttribute("reg");
						 	if(str.equals("error"))
					%>
							<label>注册失败</label>
					<%
					   };
					%>
			    	</div>
					<a href="index.jsp">Login</a>
					<div class="clear"></div>
				</div>
				<div class="right-w3l" style="border-radius:25px;">
					<input type="submit" value="Sign In">
				</div>
			</form>
		</div>
	</div>
	<!--//main-->
	<!--footer-->
	<div class="footer">
		<p>javaweb design</p>
	</div>
	<!--//footer-->
</body>
</html>