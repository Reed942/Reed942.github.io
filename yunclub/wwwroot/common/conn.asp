<!--#include file="function.asp"--><!--#include file="config.asp"--><%
dim conn,rs,sql,dbPath 

on error resume next
dbPath	= server.mappath(sys_Path) 
dbPath	= dbPath & "\common\#web#Data\#website#_%20Data.mdb"

'left(dbPath,instrrev(dbPath,"\")-1)
set conn=server.createobject(sys_Conn) 
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& dbPath &";Jet OLEDB:DataBase password=woniu;"

if err then
   err.clear
   response.write("Sorry, the database may be missing or there may be other causes for this error.")
   on error goto 0
   response.end()
end if
%>