package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import classes.Artikel;
import classes.Kategorie;
import classes.SqlConnection;

/**
 * Servlet implementation class ArtikelErstellenServlet
 */
@MultipartConfig
@WebServlet("/ServletArtikelErstellen")
public class ArtikelErstellenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArtikelErstellenServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SqlConnection conn;
		try {
			conn = new SqlConnection();
			ArrayList<Kategorie> kategorien = conn.kategorienLiefern();
			request.setAttribute("kategorien", kategorien);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String nextJSP = "/artikelErstellen.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
		dispatcher.forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
			
		
		
		String bezeichnung = request.getParameter("bezeichnung");
		String beschreibung = request.getParameter("beschreibung");
		String preisStr = request.getParameter("preis");
		String kategorie =request.getParameter("kategorie");

		String kategorieid = "";
		try {
			SqlConnection con = new SqlConnection();
			kategorieid=con.kategorienLiefernMitBezeichnung(kategorie).getKategorieid();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		
		String act = request.getParameter("act");
		if (act == null) {
			// no button has been selected
		} else if (act.equals("anlegen")) {
			
			try{
				
				Part filePart = request.getPart("file");
				InputStream fileContent = filePart.getInputStream();
				
				String tmp_Dir=System.getProperty("java.io.tmpdir");
				File file= new File(tmp_Dir+"/"+bezeichnung+".jpg");
				
				OutputStream out = new FileOutputStream(file);
		        byte[] buf = new byte[1024];
		        int len;
		        while((len=fileContent.read(buf))>0){
		            out.write(buf,0,len);
		        }
		        out.close();
		        fileContent.close();
				
				Double preis = Double.parseDouble(preisStr);
				Artikel artikel = new Artikel(bezeichnung, beschreibung, preis, kategorieid, file);
				artikel.artikelErzeugen();
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
			
			
			
			
		
		}

	}
	
}