<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="classes.Kategorie"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kategorie verbergen</title>
</head>
<body>

	<form action="ServletKategorieSichtbar" method="doGet">

		Bezeichnung: <input type="text" name="bezeichnung" /> <br>
		
			<input type="submit" name="actChoose" value="sichtbar machen">

</form>
	


</body>
</html>