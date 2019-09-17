<%-- 
    Document   : user
    Created on : Jun 8, 2019, 4:40:20 PM
    Author     : Hp
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <a class="navbar-brand" href="#"><img src='people.png' alt="Logo" height='30px' width="40px"></a>


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
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="color: #0099ff"> <i class="fas fa-user-check"></i>  : </i><% String user = (String)request.getSession().getAttribute("uname"); 
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
        <a href="user.jsp" class="list-group-item list-group-item-action active">TOPICS</a>

        <a href="academics.jsp" class="list-group-item active list-group-item-action bg-dark text-white">Academics</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Leisure</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Around Campus</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Advice and Counseling</a>
    </div>
      </div>

      <div class="col-sm-9 bg-primary" style="padding: 5px;">
  
    <%
            if(request.getSession().getAttribute("uname") == null){
                response.sendRedirect("index.html");
            }
            
            response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
            
            session.setAttribute("Topic", "academics");
            
            ArrayList<String> Questions = new ArrayList<String>();
            ArrayList<String> Answers = new ArrayList<String>();
            ArrayList<String> Replyers = new ArrayList<String>();
            ArrayList<String> TimePosted = new ArrayList<String>();
            ArrayList<String> Users = new ArrayList<String>();
            ArrayList<Integer> QIDs = new ArrayList<Integer>();
            
        try {
                Connection conn;
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oms","root", "");
                ResultSet rs1, rs2;
                PreparedStatement ps1;
                
                String query1 = "SELECT * FROM `academicquestions`";
                Statement smt = conn.createStatement();
                rs1 = smt.executeQuery(query1);
                
                
                while(rs1.next()){
                    Questions.add(rs1.getString("Questions"));
                    TimePosted.add(rs1.getString("PostTime"));
                    Users.add(rs1.getString("UserName"));
                    QIDs.add(rs1.getInt("QID"));
                } 
                  
            int Arrsize = Questions.size();
            
        for(int i = 0; i < Arrsize; i++){    
            
                String insertQuery = "SELECT * FROM `replies` WHERE QID = ? ";
                ps1 = conn.prepareStatement(insertQuery);
                ps1.setInt(1, QIDs.get(i));
                rs2 = ps1.executeQuery();
                
                while(rs2.next()){
                    Answers.add(rs2.getString("Reply"));
                    Replyers.add(rs2.getString("UserName"));
                    
                }
            
        out.print("<div class='card bg-dark text-white' style='margin:5px;'>"+
            "<div class='card-header'>"+
                "<p class='text-warning'><i class='fas fa-smile'></i>  "+ Users.get(i) + "</p>"+
            "</div>"+
            "<div class='card-body'>"+
                "<p class='text-danger'> Question: </p>"+
                "<p class='card-text'>"+ Questions.get(i) + "</p>"+ 
                "<p class='card-text' style='color: #008fb3'> <br> Posted: " + TimePosted.get(i) + "</p>"+
            "</div>"+
            "<div class='card-footer'>"+
                "<p class='text-primary' >Reply: </p>"+        
                "<p class='card-text'> <p class='text-warning' style='display: inline'>"+ Replyers.get(0)+": </p>"+ Answers.get(0) +"</p>"+
                "<button type='button' class='btn btn-link' data-toggle='collapse' data-target='#all'>View All Replies</button> <br>"+
                "<div id='all' class='collapse'>"+
                        "<p class='card-text'> ");  for(int j = 0; j < Answers.size();j++){
                            out.print("<p class='text-warning' style='display: inline'> "+ Replyers.get(j)+ " : </p> "+ Answers.get(j) +"<br>");
                                } out.print("</p>"+
                    
                "</div>"+
                "<a href='#' class='btn btn-primary' data-toggle='collapse' data-target='#reply'>Reply <i class='fas fa-comment-dots'></i></a>"+
                "<a href='#' class='btn btn-danger' data-toggle='collapse' data-target='#ask' >Ask Similar Question <i class='fas fa-question'></i></a>"+
                "<div id='reply' class='collapse'>"+
                    "<form action='PostReply' method='post' class='input-group mb-3'>"+
                            "<input type='text' class='form-control' name='reply' placeholder='Type Reply' >"+
                            "<input type='hidden' name='QID' value='"+ QIDs.get(i) +"' >"+
                            "<div class='input-group-append'>"+
                                "<button class='btn btn-success' type='submit'>Post</button> "+
                            "</div>"+
                    "</form>"+
                "</div>"+
                
                "<div id='ask' class='collapse'>"+ 
                        "<form action='PostQuestion' method='post' class='input-group mb-3'>"+
                            "<input type='text' class='form-control' name='question' placeholder='Type Question' >"+
                            "<div class='input-group-append'>"+
                                "<button class='btn btn-success' type='submit'>Post</button>"+ 
                            "</div>"+
                        "</form>"+
                "</div>"+  
            "</div>"+
        "</div>");
        Answers.clear();
        Replyers.clear();
        
        //i++;
        }
        //while(i< Arrsize);
        
           } catch (Exception ex) {
                out.println("ERROR"+ex);
        }
    %>


          <!-- DUPLICATE THE CARD HERE!! WITHIN THIS DIV-->

      </div>
      </div>
      </div>

      </div>

    </div>
</body>
             
                    
</html>
