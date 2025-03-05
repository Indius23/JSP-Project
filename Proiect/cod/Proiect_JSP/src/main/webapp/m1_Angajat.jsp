<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Angajati</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
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
	<h1 align="center">Tabela Angajati:</h1>
	<br />
	<p align="center">
		<a href="nou_Angajat.jsp"><b>Adauga un nou angajat.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("angajati", "idAngajat", aux);
	rs.first();
	String Nume = rs.getString("nume");
	String Prenume = rs.getString("prenume");
	String Functie = rs.getString("functie");
	String Salariu = rs.getString("salariu");
		rs.close();
	jb.disconnect();
	%>
	<form action="m2_Angajat.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">Id Angajat:</td>
				<td><input type="text" name="idAngajat" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="nume" size="30" value="<%=Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume:</td>
				<td><input type="text" name="prenume" size="30"
					value="<%=Prenume%>" /></td>
			</tr>
			<tr>
				<td align="right">Functie:</td>
				<td><input type="text" name="functie" size="30"
					value="<%=Functie%>" /></td>
			</tr>
			<tr>
				<td align="right">Salariu:</td>
				<td><input type="text" name="salariu" size="30"
					value="<%=Salariu%>" /></td>
			</tr>
			
		</table>
		<p align="center">
			<input type="submit" value="Modifica Angajatul">
		</p>
	</form>
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
</body>
</html>