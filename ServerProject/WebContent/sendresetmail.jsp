<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="first.User"%>
<%@page import="first.login"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<jsp:useBean id="db" class="first.Database"/> 
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>

 
<meta charset="ISO-8859-1">
<title>Robot Değilim</title>
  <link href="https://fonts.googleapis.com/css?family=Asap" rel="stylesheet"><link rel="stylesheet" href="./style.css">

<style>
body{height:100vh;margin:0;display:flex;justify-content:center;align-items:center;outline:0}
input{padding:5px}</style>
<style>
html,body {height:100%;}
body {
	margin:0;
	background-image:url(https://images.wallpapersden.com/image/download/astro-bot-rescue-mission-robot_bGtlbGeUmZqaraWkpJRmbmdlrWZlbWU.jpg);
	background-size:cover;
	background-position:center;
	display:flex;
	justify-content:center;
	align-items:center;
	font-family: 'Roboto', sans-serif;
}
.captcha {
	background-color:#f9f9f9;
	border:2px solid #d3d3d3;
	border-radius:5px;
	color:#4c4a4b;
	display:flex;
	justify-content:center;
	align-items:center;
}

@media screen and (max-width: 500px) {
	.captcha {
		flex-direction:column;
	}
	.text {
		margin:.5em!important;
		text-align:center;
	}
	.logo {
		align-self: center!important;
	}
	.spinner {
		margin:2em .5em .5em .5em!important;
	}
}

.text {
	font-size:1.75em;
	font-weight:500;
	margin-right:1em;
}
.spinner {
	position:relative;
	width:2em;
	height:2em;
	display:flex;
	margin:2em 1em;
	align-items:center;
	justify-content:center;
}
input[type="checkbox"] { position: absolute; opacity: 0; z-index: -1; }
input[type="checkbox"]+.checkmark {
	display:inline-block;
	width:2em;
	height:2em;
	background-color:#fcfcfc;
	border:2.5px solid #c3c3c3;
	border-radius:3px;
	display:flex;
	justify-content:center;
	align-items:center;
	cursor: pointer;
}
input[type="checkbox"]+.checkmark span {
	content:'';
	position:relative;/*
	position:absolute;
	border-bottom:3px solid;
	border-right:3px solid;
	border-color:#029f56;*/
	margin-top:-3px;
	transform:rotate(45deg);
	width:.75em;
	height:1.2em;
	opacity:0;
}
input[type="checkbox"]+.checkmark>span:after {
	content:'';
	position:absolute;
	display:block;
	height:3px;
	bottom:0;left:0;
	background-color:#029f56;
}
input[type="checkbox"]+.checkmark>span:before {
	content:'';
	position:absolute;
	display:block;
	width:3px;
	bottom:0;right:0;
	background-color:#029f56;
}
input[type="checkbox"]:checked+.checkmark { 
	animation:2s spin forwards;
}
input[type="checkbox"]:checked+.checkmark>span { 
	animation:1s fadein 1.9s forwards;
}
input[type="checkbox"]:checked+.checkmark>span:after {animation:.3s bottomslide 2s forwards;}
input[type="checkbox"]:checked+.checkmark>span:before {animation:.5s rightslide 2.2s forwards;}
@keyframes fadein {
	0% {opacity:0;}
	100% {opacity:1;}
}
@keyframes bottomslide {
	0% {width:0;}
	100% {width:100%;}
}
@keyframes rightslide {
	0% {height:0;}
	100% {height:100%;}
}
.logo {
	display:flex;
	flex-direction:column;
	align-items:center;
	height:100%;
	align-self:flex-end;
	margin:0.5em 1em;
}
.logo img {
	height:2em;
	width:2em;
}
.logo p {
	color:#9d9ba7;
	margin:0;
	font-size:1em;
	font-weight:700;
	margin:.4em 0 .2em 0;
}
.logo small {
	color:#9d9ba7;
	margin:0;
	font-size:.8em;
}
@keyframes spin {
	10% {
		width:0;
		height:0;
		border-width:6px;
	}
	30% {
		width:0;
		height:0;
		border-radius:50%;
		border-width:1em;
		transform: rotate(0deg);
		border-color:rgb(199,218,245);
	}
	50% {
		width:2em;
		height:2em;
		border-radius:50%;
		border-width:4px;
		border-color:rgb(199,218,245);
		border-right-color:rgb(89,152,239);
	}
	70% {
		border-width:4px;
		border-color:rgb(199,218,245);
		border-right-color:rgb(89,152,239);
	}
	90% {
		border-width:4px;
	}
	100% {
		width:2em;
		height:2em;
		border-radius:50%;
		transform: rotate(720deg);
		border-color:transparent;
	}
}
::selection {
	background-color:transparent;
	color:teal;
}
::-moz-selection {
	background-color:transparent;
	color:teal;
}</style>
<script>
function boslukEngelle() {
    if (event.keyCode == 32) {
        return false;
    }
}</script>
</head>
<body>
<%if(request.getParameter("sonuc")!=null && request.getParameter("sonuc").equals("1")) { %>
					<div class="alert-success">
					  <span class="closebtn" onclick="this.parentElement.style.display='none';"> ! </span> 
					Lütfen Maillerinizi Kontrol Ediniz !
					</div>
					<%}else if(request.getParameter("sonuc")!=null && request.getParameter("sonuc").equals("0")) { %>
					<div class="alert-unsuccess">
					 <span class="closebtn" onclick="this.parentElement.style.display='none';"> ! </span> 
					Bir Sorun Oluştu !
					</div>
					<%} %>
					
<div class="captcha">

	<div class="spinner">
		<label>
			<input type="checkbox" onclick="$(this).attr('disabled','disabled');">
			<span class="checkmark"><span>&nbsp;</span></span>
		</label>
	</div>
	<div class="text">
		I'm not a robot
	</div>
	<div class="logo">
		<img src="https://forum.nox.tv/core/index.php?media/9-recaptcha-png/"/>
		<p>reCAPTCHA</p>
		<small>Privacy - Terms</small>
  <form action="sendResetMailDb.jsp" method="post">
        <input onkeypress="return boslukEngelle()"  type="text" id="fname" name="to" value="<%String username=(String)session.getAttribute("username"); %>
                <%=username%>" style="display:none;">
                
                 <input id="myInput" name="message" type="text" value="Swag" style="display:none;"/>
  
    <div class="row">
      <input type="submit" value="Gönder">
    </div>
  </form>
	</div>
</div>
<script>

var MD5 = function(d){result = M(V(Y(X(d),8*d.length)));return result.toLowerCase()};function M(d){for(var _,m="0123456789ABCDEF",f="",r=0;r<d.length;r++)_=d.charCodeAt(r),f+=m.charAt(_>>>4&15)+m.charAt(15&_);return f}function X(d){for(var _=Array(d.length>>2),m=0;m<_.length;m++)_[m]=0;for(m=0;m<8*d.length;m+=8)_[m>>5]|=(255&d.charCodeAt(m/8))<<m%32;return _}function V(d){for(var _="",m=0;m<32*d.length;m+=8)_+=String.fromCharCode(d[m>>5]>>>m%32&255);return _}function Y(d,_){d[_>>5]|=128<<_%32,d[14+(_+64>>>9<<4)]=_;for(var m=1732584193,f=-271733879,r=-1732584194,i=271733878,n=0;n<d.length;n+=16){var h=m,t=f,g=r,e=i;f=md5_ii(f=md5_ii(f=md5_ii(f=md5_ii(f=md5_hh(f=md5_hh(f=md5_hh(f=md5_hh(f=md5_gg(f=md5_gg(f=md5_gg(f=md5_gg(f=md5_ff(f=md5_ff(f=md5_ff(f=md5_ff(f,r=md5_ff(r,i=md5_ff(i,m=md5_ff(m,f,r,i,d[n+0],7,-680876936),f,r,d[n+1],12,-389564586),m,f,d[n+2],17,606105819),i,m,d[n+3],22,-1044525330),r=md5_ff(r,i=md5_ff(i,m=md5_ff(m,f,r,i,d[n+4],7,-176418897),f,r,d[n+5],12,1200080426),m,f,d[n+6],17,-1473231341),i,m,d[n+7],22,-45705983),r=md5_ff(r,i=md5_ff(i,m=md5_ff(m,f,r,i,d[n+8],7,1770035416),f,r,d[n+9],12,-1958414417),m,f,d[n+10],17,-42063),i,m,d[n+11],22,-1990404162),r=md5_ff(r,i=md5_ff(i,m=md5_ff(m,f,r,i,d[n+12],7,1804603682),f,r,d[n+13],12,-40341101),m,f,d[n+14],17,-1502002290),i,m,d[n+15],22,1236535329),r=md5_gg(r,i=md5_gg(i,m=md5_gg(m,f,r,i,d[n+1],5,-165796510),f,r,d[n+6],9,-1069501632),m,f,d[n+11],14,643717713),i,m,d[n+0],20,-373897302),r=md5_gg(r,i=md5_gg(i,m=md5_gg(m,f,r,i,d[n+5],5,-701558691),f,r,d[n+10],9,38016083),m,f,d[n+15],14,-660478335),i,m,d[n+4],20,-405537848),r=md5_gg(r,i=md5_gg(i,m=md5_gg(m,f,r,i,d[n+9],5,568446438),f,r,d[n+14],9,-1019803690),m,f,d[n+3],14,-187363961),i,m,d[n+8],20,1163531501),r=md5_gg(r,i=md5_gg(i,m=md5_gg(m,f,r,i,d[n+13],5,-1444681467),f,r,d[n+2],9,-51403784),m,f,d[n+7],14,1735328473),i,m,d[n+12],20,-1926607734),r=md5_hh(r,i=md5_hh(i,m=md5_hh(m,f,r,i,d[n+5],4,-378558),f,r,d[n+8],11,-2022574463),m,f,d[n+11],16,1839030562),i,m,d[n+14],23,-35309556),r=md5_hh(r,i=md5_hh(i,m=md5_hh(m,f,r,i,d[n+1],4,-1530992060),f,r,d[n+4],11,1272893353),m,f,d[n+7],16,-155497632),i,m,d[n+10],23,-1094730640),r=md5_hh(r,i=md5_hh(i,m=md5_hh(m,f,r,i,d[n+13],4,681279174),f,r,d[n+0],11,-358537222),m,f,d[n+3],16,-722521979),i,m,d[n+6],23,76029189),r=md5_hh(r,i=md5_hh(i,m=md5_hh(m,f,r,i,d[n+9],4,-640364487),f,r,d[n+12],11,-421815835),m,f,d[n+15],16,530742520),i,m,d[n+2],23,-995338651),r=md5_ii(r,i=md5_ii(i,m=md5_ii(m,f,r,i,d[n+0],6,-198630844),f,r,d[n+7],10,1126891415),m,f,d[n+14],15,-1416354905),i,m,d[n+5],21,-57434055),r=md5_ii(r,i=md5_ii(i,m=md5_ii(m,f,r,i,d[n+12],6,1700485571),f,r,d[n+3],10,-1894986606),m,f,d[n+10],15,-1051523),i,m,d[n+1],21,-2054922799),r=md5_ii(r,i=md5_ii(i,m=md5_ii(m,f,r,i,d[n+8],6,1873313359),f,r,d[n+15],10,-30611744),m,f,d[n+6],15,-1560198380),i,m,d[n+13],21,1309151649),r=md5_ii(r,i=md5_ii(i,m=md5_ii(m,f,r,i,d[n+4],6,-145523070),f,r,d[n+11],10,-1120210379),m,f,d[n+2],15,718787259),i,m,d[n+9],21,-343485551),m=safe_add(m,h),f=safe_add(f,t),r=safe_add(r,g),i=safe_add(i,e)}return Array(m,f,r,i)}function md5_cmn(d,_,m,f,r,i){return safe_add(bit_rol(safe_add(safe_add(_,d),safe_add(f,i)),r),m)}function md5_ff(d,_,m,f,r,i,n){return md5_cmn(_&m|~_&f,d,_,r,i,n)}function md5_gg(d,_,m,f,r,i,n){return md5_cmn(_&f|m&~f,d,_,r,i,n)}function md5_hh(d,_,m,f,r,i,n){return md5_cmn(_^m^f,d,_,r,i,n)}function md5_ii(d,_,m,f,r,i,n){return md5_cmn(m^(_|~f),d,_,r,i,n)}function safe_add(d,_){var m=(65535&d)+(65535&_);return(d>>16)+(_>>16)+(m>>16)<<16|65535&m}function bit_rol(d,_){return d<<_|d>>>32-_}

/** NORMAL words**/
var value = 'http://localhost:8088/ServerProject/index.jsp';

var result = MD5(value);
 
//document.body.innerHTML = 'hash -  normal words: ' + result;
 
document.getElementById("myInput").value = "http://localhost:8088/ServerProject/index.jsp"+ result;


/** NON ENGLISH words**/
value = 'מבחן'
 
 </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
 </script><script src="jquery-3.5.1.min.js"></script>
</body>
</html>