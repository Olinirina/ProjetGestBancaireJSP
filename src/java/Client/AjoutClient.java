/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Olinirina
 */
public class AjoutClient extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AjoutClient</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AjoutClient at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        Connection con= null;
       Statement stm=null;
        String numC=request.getParameter("numcompte");
        String nomC=request.getParameter("nom");
        String adrC=request.getParameter("adresse");
        String sldtxt=request.getParameter("solde");
        int soldeC=Integer.parseInt(sldtxt);
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
            stm=con.createStatement();
            stm.executeUpdate("insert into client value('"+numC+"','"+nomC+"','"+adrC+"','"+soldeC+"')");
            response.sendRedirect("Client.jsp");

            con.close();
            
        
        }catch(IOException | ClassNotFoundException | SQLException ex){
            out.println(ex.getMessage());
        
        }
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
