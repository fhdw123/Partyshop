<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kunden sperren</title>
</head>
<body>

	<form action="ServletKundenSperren" method="doGet">

		Mail: <input type="text" name="mail" /> <br>
		
		<input type="submit" name="act" value="sperren">

	</form>


	

</body>
</html>