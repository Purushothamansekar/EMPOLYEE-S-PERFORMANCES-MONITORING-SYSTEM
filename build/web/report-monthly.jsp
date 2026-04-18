<%@page import="dataset.BlowFishDecryption"%>
<%@page import="dataset.BlowFishEncryption"%>
<%@ page contentType="application/vnd.ms-excel" %>

<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>


<html>
<head>
<title>Inserting data in Excel Sheet Using JSP</title>
<style type="text/css">
<!--
.style1 {
	color: #66FF00;
	font-weight: bold;
}
-->
</style>
</head>
<body> 	 <table  border="1">
					 <tr>
                        <td width="176"><div align="center"><strong>TDID</strong></div></td>
                        <td width="299"><div align="center"><strong>PROJECT NAME</strong></div></td>
			<td width="283"><div align="center"><strong>CATEGORY</strong></div></td>
			<td width="283"><div align="center"><strong>WORK(HR)</strong></div></td>
                        <td width="176"><div align="center"><strong>TASK</strong></div></td>
                        <td width="299"><div align="center"><strong>STATUS</strong></div></td>
			<td width="283"><div align="center"><strong>DATE</strong></div></td>
			<td width="283"><div align="center"><strong>WORKED(HR)</strong></div></td>
                      </tr>
												<% 	
												
String FromDate=(String)request.getAttribute("FromDate");
String ToDate=(String)request.getAttribute("ToDate");
String pt=(String)request.getAttribute("pt");
									
												
/*System.out.println(FromDate);
System.out.println(ToDate);
System.out.println(Age1);
System.out.println(Age2);
System.out.println(Occupation);
System.out.println(Qualification);
System.out.println(Category);*/
												
													
 			try {
			int flag = 0;
			String max=null;BlowFishEncryption asc=new BlowFishEncryption();
                          BlowFishDecryption dsc=new BlowFishDecryption();
			      	                   String url = "jdbc:mysql://localhost:3306/athidhar_project";
            Class.forName("com.mysql.jdbc.Driver");Connection con = DriverManager.getConnection(url, "root","root");	Statement st = con.createStatement();
		
			ResultSet rs = st.executeQuery("select * from taskdetail where sdate BETWEEN '"+FromDate+"' and '"+ToDate+"' ");	

				while(rs.next()) {
				
				
				%>	
		</table> <table   bgcolor="#D6F8EB" border="1">
				
		             <tr>
                                        <td width="133" height="33"><div align="center"><%=rs.getString(1)%></div></td>
                                        <td width="218"><div align="center"><%=dsc.toDeycrypt(rs.getString(3))%></div></td>
                                        <td width="201"><div align="center"><%=dsc.toDeycrypt(rs.getString(5))%></div></td>
					<td width="202"><div align="center"><%=dsc.toDeycrypt(rs.getString(6))%></div></td>
                                         <td width="218"><div align="center"><%=dsc.toDeycrypt(rs.getString(7))%></div></td>
                                        <td width="201"><div align="center"><%=dsc.toDeycrypt(rs.getString(8))%></div></td>
					<td width="202"><div align="center"><%=rs.getString(9)%></div></td>
                                        <td width="202"><div align="center"><%=dsc.toDeycrypt(rs.getString(10))%></div></td>
                      </tr>
												</table>
													<% 
	} 
	}
	catch (Exception e) {
		out.println(e);
	}
	%>					
					
</body>
</html> 