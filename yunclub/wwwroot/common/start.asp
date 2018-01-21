<!--#include file="conn.asp"-->
<%
response.Charset="utf-8"
session.CodePage=65001

DIM web_name,web_key,web_des,web_url
DIM web_tel,web_fax,web_address,web_email,web_zip
DIM web_copyright,web_icp,web_user,web_mobile,web_400,web_msn,web_qq
DIM page_name,page_content,page_content_zy,page_pic

sql = "select webname,webkeys,webdes,copyright,url,tel,fax,email,zip,address,icp,text1,text2,text3,text4,text5 From [web_config] where id=1"
set rs = conn.execute(sql)
if not rs.eof then
	web_sitename = rs("webname")
	web_key = rs("webkeys")
	web_des = repCHR(rs("webdes"))
	web_url = rs("url")
	web_tel = rs("tel")
	web_fax = rs("fax")
	web_address = rs("address")
	web_email	= rs("email")
	web_zip		= rs("zip")
	web_copyright = rs("copyright")
	web_icp	 = rs("icp")
	web_user = rs("text1")
	web_mobile = rs("text2")
	web_400 = rs("text3")
	web_msn = rs("text4")
	web_qq	= rs("text5")
	if web_url<>"" then web_url = lcase(web_url) : web_url = replace(web_url,"http://","")
	if web_icp<>"" then web_icp = "<a href=""http://www.miibeian.gov.cn/"" target=""_blank"" style=""text-decoration:none;"">"& web_icp &"</a>"
end if
rs.close

'// 单篇信息
sub pageInfo(id)
	dim key,des
	sql = "select className,keywords,descriptions,content,content_zy,pic from [web_page] where id="& id
	set rs = data(sql,"getOne")
	if  not rs.eof then
		key = rs("keywords")
		des = repCHR(rs("descriptions"))
		page_name = rs("className")
		page_content = rs("content")
		page_content_zy = rs("content_zy")
		page_pic = rs("pic")
		if key <>"" then web_key = key
		if des <>"" then web_des = des
	end if
	closeRd()
end sub

'//子级菜单
function get_menu(id, flag)
	select case flag
	case "page":
		sql = "select id,className,pic,content from web_page where classID="& id &" and isShow=true order by px"
	case "info":
		sql = "select id,className,pic,content from category_info where classID="& id &" and isShow=true order by px"
	case "product"
		sql = "select id,className,pic,content from category_product where classID="& id &" and isShow=true order by px"
	case else
		response.Write("Get_menu error!")
	end select
	set get_menu = conn.execute(sql)
end function

'//取得(数量)列表的推荐
function get_top(cid, num, tab_ext)
	if cid > 0 then
		sql = "select top "& num &" id,infoTitle,pic,ext_text1,content,addDate from info_"& tab_ext &" where classID="& cid &" and isTop=true and isShow=true order by px desc,id desc"
	else
		sql = "select top "& num &" id,infoTitle,pic,ext_text1,content,addDate from info_"& tab_ext &" where isShow=true and isTop=true order by px desc,id desc"
	end if
	set get_top = conn.execute(sql)
end function
%>