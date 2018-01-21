<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="./common/start.asp"--><%
'//详细页
dim id : id=gp("id",1)
if Not gp_check(id,"numeric") then Alert "ID值非法!","" : response.end()
sql = "select top 1 * From info_case where isShow=true and id="& id

dim dic
set dic = Server.createObject(sys_dicObj)
set rs = server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
    if rs.eof then Alert "记录不存在或己被删除!",""  : response.end()
    for i = 0 to rs.Fields.count-1
        dic.Add rs.Fields(i).Name , rs.Fields(i).value
    next
    dic("hits")=dic("hits")+1
    rs("hits") = dic("hits")
    rs.update()
    closeRd()
	closeConn()

'if dic("classID")> 0 then className = conn.execute("select classname from category_info where id="& dic("classID"))(0)
if dic("keywords") <>"" then web_key = dic("keywords")
if dic("descriptions") <>"" then web_des = dic("descriptions")
' cid = dic("classID")

%><!DOCTYPE html>
<html>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?1e0b87645b91440bb60cbc77d11b548d";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection" />
<title><%=web_siteName%></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>

<body>

<header>
<!--	<a href="./"><img src="images/logo.jpg"></a>
    <div class="search_btn"><!--<a href="#"><img src="images/search_btn.jpg"></a>--></div>
<!--    <div class="menu"><a href="#"><img src="images/menu.jpg"></a></div>-->
</header>
<div class="pageTitle clearfix"><a href="products.asp"><img src="images/more.jpg"></a><div class="title">案例展示</div></div>
<div class="pageName"><%=dic("infoTitle") %></div>
<div class="proImg"><img src=".<%=dic("pic") %>"></div>
<article>
	<%=dic("content") %><br>
</article>

<!--#include file="footer.asp"-->
</body>
</html>