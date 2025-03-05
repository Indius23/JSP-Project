<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Farmacii</title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        header {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 1rem 0;
        }

        main {
            max-width: 800px;
            margin: 2rem auto;
            padding: 1rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #007bff;
        }

        p, ul {
            font-size: 1rem;
            line-height: 1.5;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 0.5rem 0;
        }

        hr {
            border: 0;
            height: 1px;
            background: #ddd;
            margin: 2rem 0;
        }

        footer {
            text-align: center;
            margin-top: 2rem;
            font-size: 0.9rem;
            color: #777;
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Farmacii:</h1>
	<br />
	<p align="center">
		<a href="nou_Farmacie.jsp"><b>Adauga o noua farmacie.</b></a> 
	</p>
	<form action="sterge_Farmacie.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdFarmacie:</b></td>
				<td><b>NumeFarmacie:</b></td>
				<td><b>Telefon:</b></td>
				<td><b>Email:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeTabela("farmacii");
			long x;
			while (rs.next()) {
				x = rs.getInt("idFarmacie");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=rs.getInt("idFarmacie")%></td>
				<td><%=rs.getString("numeFarmacie")%></td>
				<td><%=rs.getString("telefon")%></td>
				<td><%=rs.getString("email")%></td>
				<%
				}
				%>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
	rs.close();
	jb.disconnect();
	%>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>