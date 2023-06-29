
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    Connection con= null;
   Statement stm=null;
   String id=request.getParameter("id");
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
            stm=con.createStatement();
            stm.executeUpdate("delete from client where NumCompte='"+id+"'");
            response.sendRedirect("Client.jsp");
%>