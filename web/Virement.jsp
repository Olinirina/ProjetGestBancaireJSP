<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Virement</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Gestion Bancaire</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Client.jsp">Client</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Versement.jsp">Versement</a>
        </li>
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Retrait.jsp">Retrait</a>
          </li>
            <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Virement.jsp">Virement</a>
        </li>
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Bilan.jsp">Bilan</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Numero de compte,Nom,Adresse">
        <button class="btn btn-outline-success" type="submit">Rechercher</button>
      </form>
    </div>
  </div>
</nav>
        
        
        
        <!-- Button trigger modal -->
<button type="button" id="myInput" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Nouveau Virement
</button>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Nouveau Virement</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="col-sm-9">
                <form method="post" action="AjoutVirement">
                    <div alight="left">
                        <label class="form-label">Numero de Virement</label>
                        <input type="text" class="form-control" placeholder="Numero de virement" name="numvir"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Debiteur</label>
                        <input type="text" class="form-control" placeholder="Numero de compte" name="numcomptevir"  required/>
                    </div>
                     <div alight="left">
                        <label class="form-label">Creancier</label>
                        <input type="text" class="form-control" placeholder="Numero de compte" name="numcompterec"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Montant de Virement</label>
                        <input type="number" class="form-control" placeholder="Montant" name="montantvir"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Date</label>
                        <input type="Date" class="form-control" placeholder="Date" name="datevir"  required/>
                    </div>
                    <div alight="right">
                       <input type="submit" class="btn btn-primary" value="Ajouter"/>
                    </div>
                </form>
            </div>
      </div>
    </div>
  </div>
</div>
<script>
    const myModal = document.getElementById('exampleModal');
const myInput = document.getElementById('myInput');

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus();
});
</script>
        <div class="row">
            
            <div class="col-sm-15">
                <div class="panel-body">
                    <table id="tbl-client" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Numero de virement</th>
                                <th>Debiteur</th>
                                <th>Creancier</th>
                                <th>Montant</th>
                                <th>Date</th>
                                <th></th>
                                <th></th>
                            </tr>
                            <%
                                Connection con= null;
                                Statement stm=null;
                                ResultSet rs=null;
                                
 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
            stm=con.createStatement();
            rs=stm.executeQuery("select * from virement");
            while(rs.next()){
                                
                                
                            
                            %>
                            <tr>
                                <td><%=rs.getString("NumVir")%></td>
                                <td><%=rs.getString("NumCompteVir")%></td>
                                <td><%=rs.getString("NumCompteRec")%></td>
                                <td><%=rs.getInt("MontantVir")%></td>
                                <td><%=rs.getString("DateVir")%></td>
                                <td><a href="ModifierVirement.jsp?id=<%=rs.getString("NumVir")%>">Modifier</a> </td>
                                <td><a href="SupprimerVirement.jsp?id=<%=rs.getString("NumVir")%>">Supprimer</a></td>
                            </tr>
                            
                            
                            <%
                            
                                }
       
                            %>
                            
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>








































































