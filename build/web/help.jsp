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
        <a href="#" class="list-group-item list-group-item-action active">TOPICS</a>

        <a href="academics.jsp" class="list-group-item active list-group-item-action bg-dark text-white">Academics</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Leisure</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Around Campus</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white">Advice and Counseling</a>
    </div>
      </div>

      <div class="col-sm-9 bg-dark" style="padding: 5px;">
          <p class="text-primary text-center">Trouble logging in ? </p> 
          <p class="text-white text-center">Login in into your account with your credentials or Create an account if you don't have one.</p>
          <p class="text-primary text-center">Trouble posting a question ? </p> 
          <p class="text-white text-center">To post a question simply click on the Ask a similar question button, type in your question and hit post.</p>
          <p class="text-primary text-center">Trouble replying to a question ? </p> 
          <p class="text-white text-center">To reply to a question, simply hit the reply button and type in your reply and hit post.</p>
          <p class="text-primary text-center">Any other queries ? </p> 
          <p class="text-white text-center"> Leave us an email at:<button type='button' class='btn btn-link'>usitusumbue@kaquora.co.ke</button> and we definitely won't get back to you!</p>
          
      </div>