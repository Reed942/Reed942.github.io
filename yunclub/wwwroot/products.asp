<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="./common/start.asp"--><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection" />
<title><%=web_siteName%></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?1e0b87645b91440bb60cbc77d11b548d";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</head>

<body>

<header>
	<!--<a href="./"><img src="images/logo.jpg"></a>
    <div class="search_btn"><!--<a href="#"><img src="images/search_btn.jpg"></a>--></div>
<!--    <div class="menu"><a href="#"><img src="images/menu.jpg"></a></div>-->
</header>
<div class="pageTitle clearfix"><a href="products.asp"><img src="images/more.jpg"></a><div class="title">云空间</div></div>
<div class="product">
	<ul>
    	<%
		set rs = get_menu(1,"product")
		if not rs.eof then
			do until rs.eof
		%>
    	<li class="clearfix">
        	<div class="fl img"><a href="productsList.asp?cid=<%=rs(0)%>"><img src=".<%=rs("pic")%>" width="145" height="100"></a></div>
            <div class="con fl">
            	<h2><a href="productsList.asp?cid=<%=rs(0)%>"><%=rs(1)%></a></h2>
            </div>
        </li>
    	<%
			rs.movenext
			loop
		end if
		closeRd()
		closeConn()
		%>
    </ul>
</div>

<!--#include file="footer.asp"-->
</body>
</html>
