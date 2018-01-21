<%	
Response.Buffer = True
Server.ScriptTimeOut = 60

sub closeRd()
	rs.close : set rs = nothing
end sub

sub closeConn()
	if isObject(conn) then
		conn.close
		set conn = nothing
	end if
end sub

function data(sql,flag)
	if flag = "" then 
		response.End()
	else
		flag = lcase(flag)
	end if

	dim temp_Rs	
	select case flag
	case "getone" '//得到一条记录信息
		set temp_Rs = conn.execute(sql)
	case "list" '//得到多条记录信息
		set temp_Rs = server.CreateObject(sys_rsObj)
		temp_Rs.open sql,conn,1,1
	case "save" '//插入/更新记录信息
		set temp_Rs = server.CreateObject(sys_rsObj)
		temp_Rs.open sql,conn,1,3
	case "exec"
		conn.execute(sql) '//直接执行记录信息,且退出函数体
		exit function
	end select

	set data = temp_Rs
	set temp_Rs = nothing
end function

sub clearCache()
	response.expires = 0
	response.expiresabsolute = now() - 1 
	response.addHeader "pragma","no-cache" 
	response.addHeader "cache-control","private" 
	Response.cachecontrol = "no-cache" 
end sub

Function CheckPost()
	Dim server_v1, server_v2
	CheckPost = False
	server_v1 = CStr(Request.ServerVariables("HTTP_REFERER"))
	server_v2 = CStr(Request.ServerVariables("SERVER_NAME"))
	If Mid(server_v1, 8, Len(server_v2)) = server_v2 Then
		CheckPost = True
	End If
	if CheckPost = False then response.Write("不许站外提交!") : response.End()
End Function

Function regReplace(str,patrn,replStr,Ignor)
	'=========================================
	'参数解释:
	'str 原来的字符串
	'patrn 要替换的字符串（正则表达式）
	'replStr 要替换成的字符串
	'Ignor 是否区分大小写(1不区分,0区分)
	'=========================================
	Dim regEx ' 建立变量。
	Set regEx = New RegExp ' 建立正则表达式。
	regEx.Pattern = patrn ' 设置模式。
	regEx.IgnoreCase = Ignor ' 设置是否区分大小写。
	regEx.Global = True
	regReplace = regEx.Replace(str,replStr) '作替换。
End Function

Function regCheck(str,reg)
	dim RegEx
	Set RegEx = New RegExp
	RegEx.IgnoreCase =True 
	RegEx.Pattern = reg  
	regCheck=RegEx.test(str)
End Function

'================================================
'过程名：GetSiteUrl
'作  用：取得带端口的URL
'================================================
Function GetSiteUrl()
	If Request.ServerVariables("SERVER_PORT") = "80" Then
		GetSiteUrl = "http://" & Request.ServerVariables("server_name")
	Else
		GetSiteUrl = "http://" & Request.ServerVariables("server_name") & ":" & Request.ServerVariables("SERVER_PORT")
	End If
End Function

Function leftString(str,length)
   dim x,y,i
   str=trim(str)
   x = len(str)
   y = 0
	if str<length then
	 if len(str)=0 then exit function
	 leftString=left(str,length)
	 exit function
	   else
		  for i = 1 to x
			 if asc(mid(str,i,1)) < 0 or asc(mid(str,i,1)) >255 then
				 y = y + 2
			 else
				 y = y + 1
			 end if
			 if length<y/2 then
				str = left(str,i-1)&"..." '"字符串限长
				exit for
			 end if
		  next
		  leftString = str
	end if
End Function

'-- 去掉HTML标记
Public Function RemoveHtml(Textstr,lenstr)
	Dim Str,re
	Str = Textstr
	Str = replace(Str,"&nbsp;","")
	Str = replace(Str,chr(8),"")'//退格符
	Str = replace(Str,chr(9),"")'//Tab
	Str = replace(Str,chr(10),"")'//换行符
	Str = replace(Str,chr(13),"")'//回车
	Str = replace(Str,chr(32),"")'//空格
	Str = replace(Str,chr(10)&chr(13),"")
	
	On Error Resume Next
	Set re = New RegExp
	re.IgnoreCase = True
	re.Global = True
	re.Pattern = "<(.[^>]*)>"
	Str = re.Replace(Str, "")
	Set re = Nothing
	RemoveHtml=leftString(Str,lenstr)
End Function

function formatDate(DT,tp)
	if Not isDate(DT) then FormatDate = "" : exit function
	dim Y,M,D,H,Mm,S
		Y = Year(DT)
		M = month(DT)
		D = Day(DT)
		H = Hour(DT)
		Mm = Minute(DT)
		S = second(DT)
	if M < 10 then M = "0"&M
	if D < 10 then D = "0"&D
	if H < 10 then H = "0"&H
	if Mm < 10 then Mm = "0"&Mm
	
	select case tp
	case 1 formatDate = Y &"年"& M &"月"& D &"日"
	case 2 formatDate = M &"/"& D &"/"& Y
	case 3 formatDate = M &"-"& D
	case 4 formatDate = Y &"\"& M &"\"& D
	case 5 formatDate = Y &"."& M &"."& D
	case 6 formatDate = Y &"-"& M &"-"& D
	case 7 formatDate = Y &"-"& M &"-"& D &" "& H &":"& Mm
	case 8 formatDate = Y &"-"& M &"-"& D &" "& H &":"& Mm &":"& S
	case 9 formatDate = Y & M & D & H & Mm & S
	case else
		   formatDate = FormatEnMonth(M) &" "& D &","& Y '//英文日期
	end select
end function

function FormatEnMonth(theM)
	dim m(11)
	m(0)="January"
	m(1)="February"
	m(2)="March"
	m(3)="April"
	m(4)="May"
	m(5)="June"
	m(6)="July"
	m(7)="August"
	m(8)="September"
	m(9)="October"
	m(10)="November"
	m(11)="December"
	FormatEnMonth = m(theM-1)
end function

'========================================================================

'//随机数
function RndNumber()
	randomize
	RndNumber = formatDate(now(),9) & int(100000 * rnd())
end function 

function isNum(num)
	if gp_check(num,"numeric") then 
		isNum = clng(num)
	else
		isNum = 0
	end if
end function

'验证是否含有^%&',;=?$\"等字符：[^%&',;=?$\x22]+ 
'只能输入汉字：^[\u4e00-\u9fa5],{0,}$
'验证Email地址：^\w+[-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
'验证InternetURL：^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$
'验证电话号码：^(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$

function gp_check(items,options)
	const reg_numeric = "^[123456789]+\d*$" '//数字
	const reg_email  = "^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" '//邮箱
	const reg_mobile = "^0?1[358][0-9]\d{8}$" '//手机号
	const reg_phone  = "^((\d{3}-?\d{8})|(\d{4}-?\d{7}))$" '//电话/传真
	const reg_zip = "^[1-9]\d{5}$" '//邮编
	const reg_idc = "^\d{18}|\d{15}$" '//身份证
	const reg_http  = "(http|https):\/\/([\w\-]+\.)+[\w]+/?$" '"^http://(www.)?(\w\.)+[a-zA-Z0-9]+$" '//网址
	const reg_other = "^[a-zA-Z0-9_-]+$"
	
	gp_check=False
	if isEmpty(items) or isNull(items) then exit function
 
	select case options
	case "numeric"
		if RegCheck(items,reg_numeric) then gp_check = True
	case "email"
		if RegCheck(items,reg_email) then gp_check = True
 	case "mobile"
		if RegCheck(items,reg_mobile) then gp_check = True
 	case "phone"
		if RegCheck(items,reg_phone) then gp_check = True
 	case "zip"
		if RegCheck(items,reg_zip) then gp_check = True
	case "idc"
		if RegCheck(items,reg_icd) then gp_check = True
	case "http"
		if RegCheck(items,reg_http) then gp_check = True
	case "other"
		if RegCheck(items,reg_other) then gp_check = True
	case "date"
		if isDate(items) then gp_check = True
	end select
end function

'========================================================================

function gp(inputName,getORpost)
	'inputName  表单项名称
	'getORpost  是get用1,是post用0表示	
	dim itemValue
	select case getORpost
		case 0
			itemValue = request.form(inputName)
		case 1
			itemValue = request.querystring(inputName)
		case else
			itemValue = request(inputName)
	end select
	
	if isEmpty(itemValue) or isNull(itemValue) then	   
	   itemValue = ""
	else
	   itemValue = trim(itemValue)
	   itemValue = filter_html(itemValue)
	end if

	gp = itemValue
end function

function filter_html(s)
	if s<>"" then
		s = regReplace(s,"(<script){1,}[^<>]*>[^\0]*(<\/script>){1,}","",1)
		s = regReplace(s,"(<iframe\s+src=\""http\:){1,}[^<>]*>[^\0]*(<\/iframe>){1,}","",1)
		s = regReplace(s,"<object.*?/object>","",1)
		s = regReplace(s,"<link.*?>","",1)
		s = regReplace(s,"(<style)+[^<>]*>[^\0]*(<\/style>)+","",1)
		
		s = regReplace(s,"<title.*?/title>","",1)
		s = regReplace(s,"<!DOCTYPE.*?>","",1)
		s = regReplace(s,"<html.*?>","",1)
		s = regReplace(s,"<meta.*?>","",1)
		s = regReplace(s,"<frameset.*?>","",1)
		s = regReplace(s,"<noframes.*?>","",1)
		s = regReplace(s,"<\!--.*?-->","",1)
		's = regReplace(s,"""","&quot;",1)
	end if
	filter_html=s
end function

function searchSTR(key)
	on error resume next
	key=trim(key)
	key=replace(key,"'","")
	key=replace(key,"""","")	
	key=replace(key,"--","")
	key=replace(key,";","")
	key=replace(key,"[","")
	key=replace(key,"]","")
	key=replace(key,"_","")
	key=replace(key,"*","")
	key=replace(key,"&quot;","")
	key=replace(key,"%","")
	searchSTR = key
	if err then err.clear
	on error goto 0
end function

function replaceStr(v)
	if isEmpty(v) or isNull(v) then
	   v=""
	else
	   'v=trim(v)
	   v=replace(v,"'","&#39;")
	   'v=replace(v,"""","&quot;")	  
	   v=replace(v,"--","－－")
	end if
	replaceStr=v
end function

function replaceText(v)
	if isEmpty(v) or isNull(v) then
	   v=""
	else
	   'v=trim(v)
	   v=replace(v,"&#39;","'")
	   v=replace(v,"&quot;","'")	  
	   v=replace(v,"－－","--")
	end if
	replaceText=v
end function

function repCHR(v)
	repCHR = ""
	if v<>"" then
	   v = replace(v,vbcrlf,"")
	   'v = replace(v,chr(13),"")
	end if
	repCHR=v
end function

function replaceChr(v)
	if isEmpty(v) or isNull(v) then
	   v=" "
	else
	   v=replace(v,chr(13),"<br />")
	   'v=replace(v,chr(10),"&nbsp;")   
	end if
	replaceChr=v
end function


'过虑提交的表单数据
Function FormEncode(str)
	If Not IsNull(str) And Trim(str) <> "" Then		
		str = Replace(str, ">", "&gt;")
		str = Replace(str, "<", "&lt;")
		str = Replace(str, "&#62;", "&gt;")
		str = Replace(str, "&#60;", "&lt;")
		str = Replace(str, "'", "&#39;")
		str = Replace(str, "--", "&mdash;")
		str = Replace(str, chr(10), "&nbsp;")
		str = Replace(str, chr(13), "<br />")
		str = Replace(str, Chr(34), "&quot;")
		'str = Replace(str, "%", "％")
		str = Replace(str, vbNewLine, "")
		FormEncode = Trim(str)
	Else
		FormEncode = ""
	End If
End Function


function DelFile(filePath)'//删除文档or图片
	Dim objFSO
	Set objFSO = Server.CreateObject(sys_Fso)
	If  objFSO.FileExists(filePath) Then
		objFSO.DeleteFile filePath,true 
		DelFile=true
	else
		DelFile=false
	end if
	set objFSO=nothing
end Function

function ReadFile(filePath)'//读取文件内容
	Dim objFSO,objCountFile,FiletempData
	Set objFSO = Server.CreateObject(sys_Fso)
	Set objCountFile = objFSO.OpenTextFile(filePath,1,True)
		ReadFile = objCountFile.ReadAll
		'objCountFile.Close
	Set objCountFile=Nothing
	Set objFSO = Nothing
end Function

function FileSize(filePath)
	dim fso,sizes,f
	Set fso = CreateObject(sys_Fso)  	
	If  not fso.FileExists(filePath) then getFileSize = 0 : exit function
	  
	Set f = fso.GetFile(filePath)
		sizes=f.size  
	'response.write "文件名称："&f.name"<br>"   
	'response.write "创建时间："&f.DateCreated   

    if  sizes>=1073741824 then
		sizes=int((sizes/1073741824)*1000)/1000 & " GB"
    elseif sizes>=1048576 then
    	sizes=int((sizes/1048576)*1000)/1000 & " MB"
    elseif sizes>=1024 then
		sizes=int((sizes/1024)*1000)/1000 & " KB"
	else
		sizes=sizes & "B"
	end if
	set fso=nothing
	FileSize = sizes
end function

'//时差计算
function showTime(myDate)
	dim diff
    diff=DateDiff("s",myDate,now())
    if diff<=59 then
       response.Write(diff)
       response.Write("秒前")
    end if
    if diff>=60 and diff<3600 then
       response.Write(DateDiff("n",myDate,now()))
       response.Write("分钟前")
   end if
   if diff>=3600 and diff<86400 then
      response.Write(DateDiff("h",myDate,now()))
      response.Write("小时前")
   end if
   if diff>=86400 and diff<604800 then
      response.Write(DateDiff("d",myDate,now()))
      response.Write("日前")
   end if
   if diff>=604800 and diff<2592000 then
      response.Write(DateDiff("ww",myDate,now()))
      response.Write("星期前")
    end if
   if diff>=2592000 and diff<31536000 then
      response.Write(DateDiff("m",myDate,now()))
      response.Write("个月前")
   end if
   if diff>=31536000 then
       response.Write(DateDiff("yyyy",myDate,now()))
       response.Write("年前")
  end if
end function

Public Sub PreventInfuse()
	On Error Resume Next
	Dim SQL_Nonlicet, arrNonlicet
	Dim PostRefer, GetRefer, Sql_DATA
	
	SQL_Nonlicet = "'|;|^|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
	arrNonlicet = Split(SQL_Nonlicet, "|")
	If Request.QueryString <> "" Then
		For Each GetRefer In Request.QueryString
			For Sql_DATA = 0 To UBound(arrNonlicet)
				If InStr(1, Request.QueryString(GetRefer), arrNonlicet(Sql_DATA), 1) > 0 Then
				Response.Write "<Script Language=JavaScript>alert('系统安全提示↓\n\n请不要在参数中包含非法字符！');history.back(-1)</Script>"
				Response.End
				End If
			Next
		Next
	End If
End Sub

Function ChkInvaildWord(Words)
	Const InvaildWords="select|update|delete|insert|execute|@|--|,|'|%|[|]|&|;|_" '需要过滤得字符以“|”隔开
	
	ChkInvaildWord=True
	InvaildWord=Split(InvaildWords,"|")
	inWords=LCase(Trim(Words))
	
	For i=LBound(InvaildWord) To UBound(InvaildWord)
		If Instr(inWords,InvaildWord(i))>0 Then
			ChkInvaildWord=False
			Exit Function
		End If
	Next
End Function

function Alert(str,url)
    if url="" then
       response.write("<script type=""text/javascript"">alert(""\n"& str &""");window.history.back();window.location.reload();</script>")
	else
	   response.write("<script type=""text/javascript"">alert(""\n"& str &""");window.location.href="""& url &""";</script>")
	end if
    response.end()
end function

function GetIP()
  dim uIP : uIP = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
  If uIP = "" Then uIP = Request.ServerVariables("REMOTE_ADDR")
  GetIP = uIP
end function

' //焦点状态
function selected(v,w,f)
	select case f
	case 0
		if v = w then selected = " checked"
	case 1
		if v = w then selected = " selected"
	case else 
		if instr(v,w)>0 then selected=" checked"
	end select
end function
%>