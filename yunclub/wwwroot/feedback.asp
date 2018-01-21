<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><!--#include file="./common/start.asp"--><%
clearCache()
dim rnd_num : rnd_num = gp("rnd_num",0)
if rnd_num <>"" then
    CheckPost()	
    dim x1,x2,x3,x4,x5,x6,demo1
        x1 = gp("x1",0)
        x2 = gp("x2",0)
        x3 = gp("x3",0)
        x4 = gp("x4",0)
        x5 = gp("x5",0)
        x6 = gp("x6",0)
        demo1 = gp("demo1",0)
    
    if x1<>"" and x2<>"" and x4<>"" and x6<>"" and demo1<>"" then
        sql="select top 1 * from [form_message] where saved ='"& rnd_num &"'"
        Set rs=Server.CreateObject(sys_rsObj)
              rs.open Sql,Conn,1,3
        if  rs.eof then
            rs.AddNew()
            rs("x1") = x1
            rs("x2") = x2
            rs("x3") = x3
            rs("x4") = x4
            rs("x5") = x5
            rs("x6") = x6
            rs("demo1") = demo1
            rs("saved")  = rnd_num
            rs("addDate")=now() 
            rs.update
            closeRd()
            closeConn()
            response.Redirect("feedback.asp?f=ok&t="& rnd()*10)
        end if
    else
        call Alert ("星号处不能为空!","")
    end if
    response.Redirect("feedback.asp?f=err&t="& rnd()*10)
    response.End()
end if
%><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection" />
<title><%=web_siteName%></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="./js/jQuery.js"></script>
<script type="text/javascript" src="js/jquery-latest.min.js"></script>
<script type="text/javascript">
function chkmsg(){
    if ($.trim($('#u_1').val())==""){alert("姓名不能为空，请输入！"); return false;}
    if ($.trim($('#u_2').val())==""){alert("电话不能为空，请输入！"); return false;}
    if ($.trim($('#u_4').val())==""){alert("邮箱不能为空，请输入！"); return false;}
    if ($.trim($('#u_6').val())==""){alert("标题不能为空，请输入！"); return false;}
    if ($.trim($('#u_demo1').val())==""){alert("内容不能为空，请输入！"); return false;}
    $('.submit_button').prop('disabled',true);
    return true;
}
window.history.forward();
</script>
<script type="text/javascript" src="./js/jQuery.js"></script>
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
    <!--<div class="menu"><a href="#"><img src="images/menu.jpg"></a></div>-->
</header>
<div class="pageTitle clearfix"><!--<a href="products.asp"><img src="images/more.jpg"></a>--><div class="title">在线留言</div></div>
<div id="feedback">
<%if request.QueryString("f") = "ok" then%>
<p style="font-size:14px;color:#F63;"><img src="uploadFile/sys/success.png" align="absmiddle">   您的留言己发送, 我们会尽快和您联系!</p>
<%elseif request.QueryString("f") = "err" then%>
<p style="font-size:14px;color:#f00;"><img src="uploadFile/sys/error.png" align="absmiddle">   您的留言发送失败!</p>
<%else%>
<form name="t_Lxr" class="feedback" method="post" action="feedback.asp" id="mform" onsubmit="return chkmsg()">
<input type="hidden" name="rnd_num" value="<%=RndNumber()%>">
<table border="0" cellpadding="5" cellspacing="10" class="feedback" align="center">
    <tbody>
    <tr>
    <td height="37" colspan="2">带<span style="color:red;">*</span>为必填项</td>
    </tr>
    <tr>
    <td width="48" align="right">姓名：</td>
    <td width="266"><input type="text" name="x1" id="u_1" class="feedback_input" > <span style="color:red;">*</span></td>
    </tr>
    <tr>
    <td align="right">电话：</td>
    <td><input name="x2" id="u_2" type="text" class="feedback_input" > <span style="color:red;">*</span></td>
    </tr>
    <tr>
    <td align="right">手机：</td>
    <td><input type="text" name="x3" id="u_3" class="feedback_input" ></td>
    </tr>
    <tr>
    <td align="right">邮箱：</td>
    <td><input type="text" name="x4" id="u_4" class="feedback_input" > <span style="color:red;">*</span></td>
    </tr>
    <tr>
    <td align="right">地址：</td>
    <td><input name="x5" id="u_5" type="text" class="feedback_input" ></td>
    </tr>
    <tr>
    <td align="right">标题：</td>
    <td><input type="text" name="x6" id="u_6" class="feedback_input" > <span style="color:red;">*</span></td>
    </tr>
    <tr>
    <td align="right">内容：</td>
    <td>
    <textarea name="demo1" id="u_demo1" cols="40" rows="5" class="feedback_textarea" ></textarea> <font color="ff0000">*</font></td>
    </tr>
    <tr>
    <td></td>
    <td align="left" valign="middle">
    <input type="submit" class="feedback_submit" value=" 提交 ">
    </td>
    </tr>
    </tbody>
</table>
</form> 
<%end if%>
</div>
<!--#include file="footer.asp"-->
</body>
</html>
