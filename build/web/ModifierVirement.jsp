<%-- 
    Document   : ModifierVirement
    Created on : 18 juin 2023, 18:07:47
    Author     : Olinirina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier Virement</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="row">
            <div class="col-sm-4">
                <form method="post" action="ModifierVirement">
                    <%
                        Connection con= null;
                       Statement stm=null;
                       ResultSet rs=null;
                                
 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
            String id=request.getParameter("id");
            stm=con.createStatement();
            rs=stm.executeQuery("select * from virement where NumVir='"+id+"'");
            while(rs.next()){
                    %>
                    <div alight="left">
                        <label class="form-label">Numero de Virement</label>
                        <input type="text" class="form-control" value="<%=rs.getString("NumVir")%>" name="numvir"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Debiteur</label>
                        <input type="text" class="form-control" value="<%=rs.getString("NumCompteVir")%>" name="numcomptevir"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Creancier</label>
                        <input type="text" class="form-control" value="<%=rs.getString("NumCompteRec")%>" name="numcompterec"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Montant</label>
                        <input type="number" class="form-control" value="<%=rs.getInt("MontantVir")%>" name="montantvir"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Date</label>
                        <input type="date" class="form-control" value="<%=rs.getString("DateVir")%>" name="datevir"  required/>
                    </div>
                    <div alight="right">
                        <input type="submit" class="btn btn-primary" value="Modifier"/>
                    </div>
                    <% }%>
                    <div align="right">
                        <p><a href="Virement.jsp">Retour a la liste </a></p>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

