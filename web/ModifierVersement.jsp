<%-- 
    Document   : ModifierVersement
    Created on : 15 juin 2023, 22:42:48
    Author     : Olinirina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier Versement</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="row">
            <div class="col-sm-4">
                <form method="post" action="ModifierVersement">
                    <%
                        Connection con= null;
                       Statement stm=null;
                       ResultSet rs=null;
                                
 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
            String id=request.getParameter("id");
            stm=con.createStatement();
            rs=stm.executeQuery("select * from versement where NumVers='"+id+"'");
            while(rs.next()){
                    %>
                    <div alight="left">
                        <label class="form-label">Numero de Versement</label>
                        <input type="text" class="form-control" value="<%=rs.getString("NumVers")%>" name="numvers"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Numero de compte</label>
                        <input type="text" class="form-control" value="<%=rs.getString("NumCompte")%>" name="numcompte"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Montant</label>
                        <input type="number" class="form-control" value="<%=rs.getInt("MontantVers")%>" name="montantvers"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Date</label>
                        <input type="date" class="form-control" value="<%=rs.getString("DateVers")%>" name="datevers"  required/>
                    </div>
                    <div alight="right">
                        <input type="submit" class="btn btn-primary" value="Modifier"/>
                    </div>
                    <% }%>
                    <div align="right">
                        <p><a href="Versement.jsp">Retour a la liste </a></p>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

