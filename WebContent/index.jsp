<%-- 
    Document   : index
    Created on : 04.10.2016
    Author     : Leon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="classes.Kategorie"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet type="text/css" href="./resources/css/index.css">
<title>Partyshop</title>
</head>
<body>

	<header class="standard">
		<div class="header-logo">
			<a href="/Partyshop"> <img class="logo"
				src="resources/images/logo.png">
			</a>
		</div>
		<div class="header-logo-mobile">
			<a href="/Partyshop"> <img class="logo"
				src="resources/images/mlogo.png">
			</a>
		</div>

		<div class="headerlogos">
			<div class="headerlogo">
			<%
			if(session.getAttribute("user") == null)
			{
				out.println("<a class=\"user\" href=\"loginregister.jsp\" >	</a>");
				out.println("<div class=\"headerdesc\">");
				out.println("<span class=\"headerdesc\">Login</span>");
				out.println("</div>");
				out.println("");
			}
			else
			{
				out.println("<a class=\"user\" href=\"\">	</a>");
				out.println("<div class=\"headerdesc\">");
				out.println("<span class=\"headerdesc\">Mein Konto</span>");
				out.println("</div>");
				out.println("");
			}
			
			%>
				
			</div>
			<div class="headerlogo">
				<a class="cart" href="/Partyshop/Warenkorb"></a>
				<div class="headerdesc">
					<span class="headerdesc">
						Warenkorb
					</span>
				</div>
			</div>
			
		</div>
		<form action="Suche">
			<div class="search">
				<nav>

					<a href="#" id="menu-icon"><img class="threelines"
						src="resources/images/threelines.png"></a>

					<ul>
						<%
							ArrayList<Kategorie> kats = (ArrayList<Kategorie>) request.getAttribute("kategorien");
							for (Kategorie kat : kats) {
								out.println("<li class=\"categories\"><a href=\"/Partyshop/Kategorie?id=" + kat.getKategorieid() + "\">"
										+ kat.getBezeichnung() + "</a></li>");
							}
						%>

					</ul>

				</nav>

				<div class="searchbar">
					<input class="searchbar" placeholder="Suchen" type="text"
						name="searchtext">
				</div>

				<div class="searchlogo">
					<input class="searchlogo" type="submit" value="">
				</div>
			</div>
		</form>


	</header>



	<div class="content">

		<div class="categories">
			<ul class="categories">
				<li class="categories"><a class="title">Kategorien</a></li>
				<%
					for (Kategorie kat : kats) {
						out.println("<li class=\"categories\"><a href=\"/Partyshop/Kategorie?id=" + kat.getKategorieid() + "\">"
								+ kat.getBezeichnung() + "</a></li>");
					}
				%>
			</ul>
		</div>


		<div class="content2">
			<div class="articles">
				<h1 class="article">Aktuelle Angebote</h1>

				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel1.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>

				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel2.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>


				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel3.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>

			</div>
			<div class="articles">
				<h1 class="article">Bestseller</h1>

				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel4.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>

				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel1.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>

				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel3.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>
			</div>
			<div class="articles">
				<h1 class="article">Bestseller</h1>

				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel4.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>

				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel1.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>

				<div class="article1">
					<a target="_blank" href=""> <img
						src="resources/images/beispiel3.jpg" alt="">
					</a>
					<div class="desc">beschreibung</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>
