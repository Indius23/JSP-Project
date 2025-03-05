<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Locatie</title>
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
	<%
	String numeFarmacie;
	String Adresa = request.getParameter("Adresa");
	String Oras = request.getParameter("Oras");
	String id1 = request.getParameter("idFarmacie");
	int idFarmacie;
	if (Adresa != null) {
		jb.connect();
		jb.adaugaLocatii( Adresa, Oras, java.lang.Integer.parseInt(id1) );
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
		jb.connect();
		ResultSet rs2 = jb.vedeTabela("farmacii");
	%>
	<h1>Suntem in tabela Locatii.</h1>
	<form action="nou_Locatie.jsp" method="post">
		<table>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="Adresa" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Oras:</td>
				<td><input type="text" name="Oras" size="30" /></td>
			</tr>
				<td>Selectati farmacia: <SELECT NAME="idFarmacie">
						<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
						<%
						while (rs2.next()) {
							idFarmacie = rs2.getInt("idFarmacie");
							numeFarmacie = rs2.getString("numeFarmacie");
						%>
						<OPTION VALUE="<%=idFarmacie%>"><%=idFarmacie%>,<%=numeFarmacie%></OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
		</table>
		<input type="submit" value="Adauga locatia" />
	</form>
	<%
	}
	%>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>