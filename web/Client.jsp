
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acceuil</title>
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
<button align="left" type="button" id="myInput" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Nouveau Client
</button> <h1>Etat des situations des clients</h1>
        
       


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Nouveau Client</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="col-sm-9">
                <form method="post" action="AjoutClient">
                    <div alight="left">
                        <label class="form-label">Numero de compte</label>
                        <input type="text" class="form-control" placeholder="Numero de compte" name="numcompte"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Nom</label>
                        <input type="text" class="form-control" placeholder="Nom" name="nom"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Adresse</label>
                        <input type="text" class="form-control" placeholder="Adresse" name="adresse"  required/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Solde</label>
                        <input type="number" class="form-control" placeholder="Solde" name="solde"  required/>
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
       
            
            
            <div class="col-sm-15">
                <div class="panel-body">
                    <table id="tbl-client" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Numero de Compte</th>
                                <th>Nom</th>
                                <th>Adresse</th>
                                <th>Solde</th>
                                <th></th>
                                <th></th>
                            </tr>
                            <%
                                Connection con= null;
                                Statement stm=null;
                                ResultSet rs=null;
                                
 try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
            stm=con.createStatement();
            rs=stm.executeQuery("select * from client");
            while(rs.next()){
                        String numC= rs.getString("NumCompte");
                        String nomC=rs.getString("Nom");
                        String adrC=rs.getString("Adresse");
                        int ancienSolde= rs.getInt("Solde");
                        //Versement
                    Statement versementStatement = con.createStatement();
                    ResultSet versementResult = versementStatement.executeQuery("SELECT SUM(MontantVers) AS total_vers FROM versement WHERE NumCompte = '"+ numC+"'" );
                    versementResult.next();
                    int totalvers = versementResult.getInt("total_vers");
                    //Retrait
                    Statement retraitStatement = con.createStatement();
                    ResultSet retraitResult = retraitStatement.executeQuery("SELECT SUM(MontantRet) AS total_ret FROM retrait WHERE NumCompte = '"+ numC+"'" );
                    retraitResult.next();
                    int totalret = retraitResult.getInt("total_ret");
                    //Virement vir
                    Statement virStatement = con.createStatement();
                    ResultSet virResult = virStatement.executeQuery("SELECT SUM(MontantVir) AS total_vir FROM virement WHERE NumCompteVir = '"+ numC+"'" );
                    virResult.next();
                    int totalvir = virResult.getInt("total_vir");
                    //Virement rec
                    Statement virrecStatement = con.createStatement();
                    ResultSet virrecResult = virrecStatement.executeQuery("SELECT SUM(MontantVir) AS total_virrec FROM virement WHERE NumCompteRec = '"+ numC+"'" );
                    virrecResult.next();
                    int totalvirrec = virrecResult.getInt("total_virrec");
                    //Nouveau solde
                    int nouveauSolde= ancienSolde + totalvers + totalvirrec - totalret -totalvir;  
                   
                    
                            %>
                            <tr>
                                <td><%=numC%></td>
                                <td><%=nomC%></td>
                                <td><%=adrC%></td>
                                <td><%=nouveauSolde%></td>
                                <td><a href="ModifierClient.jsp?id=<%=numC%>">Modifier</a> </td>
                                <td><a href="SupprimerClient.jsp?id=<%=numC%>">Supprimer</a></td>
                            </tr>
                            
                            
                            <%
                            
                                }}catch(IOException | ClassNotFoundException | SQLException ex){
            out.println(ex.getMessage());
        
        }
       
                            %>
                            
                        </thead>
                    </table>
                </div>
            </div>
        
    </body>
</html>
