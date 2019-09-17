<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    

    <head>
	<title>kaQuora</title>
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="bootstrap-4.2.1-dist/bootstrap-4.2.1-dist/css/bootstrap.css">
            <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>

    <body class="bg-secondary">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="#"><img src='people.png' alt="Logo"></a>


        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="user.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="help.jsp">Help</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto" >
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="color: #0099ff"> <i class="fas fa-user-shield"></i>  : </i><% String user = (String)request.getSession().getAttribute("uname"); 
                    out.println(user);%></a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="logout">Logout</a>
            </div>
            </li>
        </ul>
    </nav>              

    <div>
    <div class="row">
            <div class="col-md-11">


    </div>
    </div>

    </div>

    <div class="row" style="padding: 10px;">
      <div class="col-sm-2">
     <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active">TOPICS</a>

        <a href="academics.jsp" class="list-group-item active list-group-item-action bg-dark text-white">Academics</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Leisure</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Around Campus</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Advice and Counseling</a>
    </div>
      </div>

      <div class="col-sm-9 bg-primary" style="padding: 5px;">
            <table class="table table-dark table-hover">
                <thead class="thead-light">
                  <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  
                  <%
                     if(request.getSession().getAttribute("uname") == null){
                        response.sendRedirect("index.html");
                    }
            
                    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
                      
                      
                    Connection conn;
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oms","root", "");
                    ResultSet rs1, rs2;
                    
                    ArrayList<String> username = new ArrayList<String>();
                    ArrayList<String> email = new ArrayList<String>();
                    ArrayList<String> phone = new ArrayList<String>();

                    String query1 = "SELECT * FROM `users` WHERE `status` = 1 ";
                    Statement smt = conn.createStatement();
                    rs1 = smt.executeQuery(query1);


                    while(rs1.next()){
                        username.add(rs1.getString("UserName"));
                        email.add(rs1.getString("Email"));
                        phone.add(rs1.getString("Phone"));
                    } 
                  
                    int Arrsize = username.size();
            
                    for(int i = 0; i < Arrsize; i++){      
                      
                        out.print("<tr>"+
                        "<td>"+ username.get(i) +"</td>"+
                        "<td>"+ email.get(i) +"</td>"+
                        "<td>"+ phone.get(i) +"</td>"+
                        "<td>"+
                            "<form action='removeUser' method='post'>"+
                                "<input type='hidden' name='username' value='"+ username.get(i) +"' >"+
                                "<button class='btn btn-danger' type='submit'>block</button>"+
                            "</form>"+
                                   
                        "</td>"+
                        "</tr>"); 
                    }
                    
                    ArrayList<String> username2 = new ArrayList<String>();
                    ArrayList<String> email2 = new ArrayList<String>();
                    ArrayList<String> phone2 = new ArrayList<String>();

                    String query2 = "SELECT * FROM `users` WHERE `status` = 0 ";
                    Statement smt2 = conn.createStatement();
                    rs2 = smt2.executeQuery(query2);


                    while(rs2.next()){
                        username2.add(rs2.getString("UserName"));
                        email2.add(rs2.getString("Email"));
                        phone2.add(rs2.getString("Phone"));
                    } 
                  
                    int Arrsize2 = username2.size();
                    out.print("<th><h3>Blocked<h3></th>");
                    for(int i = 0; i < Arrsize2; i++){      
                      
                        out.print("<tr>"+
                        "<td>"+ username2.get(i) +"</td>"+
                        "<td>"+ email2.get(i) +"</td>"+
                        "<td>"+ phone2.get(i) +"</td>"+
                        "<td>"+
                            "<form action='unblockUser' method='post'>"+
                                "<input type='hidden' name='username' value='"+ username2.get(i) +"' >"+
                                "<button class='btn btn-success' type='submit'>un-block</button>"+
                            "</form>"+
                                   
                        "</td>"+
                        "</tr>"); 
                    }
                    




                   %>
                </tbody>
            </table>
          
      </div>