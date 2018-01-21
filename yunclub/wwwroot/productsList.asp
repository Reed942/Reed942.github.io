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
<!--#include file="include/page/page_utf8.asp"-->
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
   <!-- <div class="menu"><a href="#"><img src="images/menu.jpg"></a></div>-->
</header>
<div class="pageTitle clearfix"><!--<a href="products.asp"><img src="images/more.jpg"></a>--><div class="title"> 云空间</div></div>
<div class="productlist">
	<ul>
<%
'//列表页 
'dim cid : cid = isNum(gp("cid",1))
sql="select id,infoTitle,pic from [info_product] where isShow=true "
'if cid>0 then sql=sql&" and classID ="& cid
sql=sql&" order by px desc,id desc"

set rs=data(sql,"list")
if not rs.eof then
    pages rs,6
    for i=1 to Records
%>    	<li><!--<a href="products_detail.asp?id=<%=rs(0)%>">--><img src=".<%=rs("pic")%>" ><!--</a>--><h2><!--<a href="products_detail.asp?id=<%=rs(0)%>">--><%=leftString(rs(1),6)%><!--</a>--></h2></li>
<%
    rs.movenext
    next
end if
closeRd()
%>    </ul>
    <div class="clear"></div>
    <br>
    <%if totalpages > 1 then call PageList1("&cid="&cid)%>
    <br><br>
     </br>
      </br>
       </br>
       
</div>
<!--#include file="footer.asp"-->
</body>
</html>