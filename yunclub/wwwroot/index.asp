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

<body id="home">
<div class="banner"></div>
<header><img src="images/logo.png"></header>
<menu>
	<ul>
    <li class="a1"><a href="about.asp"><img src="images/index1.png">关于我们</a></li>
      <li class="a5"><a href="jieshao.asp"><img src="images/js.png">课程介绍</a></li>
      <li class="a5"><a href="productsList.asp"><img src="images/cp.png">云空间</a></li>
    <li class="a2"><a href="zizhi.asp"><img src="images/pro.png">师资介绍</a></li>
  <!--  <li class="a4"><a href="meiti.asp"><img src="images/case.png">媒体推荐</a></li>-->
   <!-- <li class="a3"><a href="feedback.asp"><img src="images/mes.png">在线留言</a></li>-->
    <li class="a5"><a href="contact.asp"><img src="images/lx.png">联系我们</a></li>
    </ul>
</menu>
<footer>版权所有 <%=web_copyright%></footer>
</body>
</html>