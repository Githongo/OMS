<!DOCTYPE html>
<html>
<head>
	<title>kaQuora</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-4.2.1-dist/bootstrap-4.2.1-dist/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<script type="text/javascript" src="bootstrap-4.2.1-dist/bootstrap-4.2.1-dist/js/bootstrap.bundle.js"></script>
<script type="text/javascript" src="bootstrap-4.2.1-dist/bootstrap-4.2.1-dist/js/bootstrap.js"></script>

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
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="color: #0099ff">  </i></a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="logout">Logout</a>
            </div>
            </li>
        </ul>
    </nav>

<div class="row" style="margin-top: 50px; margin-left: 450px;">
  <div class="col-sm-8">
    <div class="card">
     <div class="card text-center">
  <div class="card-header bg-dark text-white display-5">
    CREATE AN ACCOUNT BY FILLING OUT THIS FORM
  </div>
  <div class="card-body col-md-12">

   <form action = "register" method = "post" >
            <div class="form-group row">
             <label for="inputEmail3" class="col-sm-4 col-form-label">Username</label>
             <div class="col-sm-8">
               <input type="text" name="u_name"  class="form-control" id="inputEmail3" placeholder="e.g. John Doe" required>
             </div>
           </div>
           <div class="form-group row">
             <label for="inputEmail3" class="col-sm-4 col-form-label">Email</label>
             <div class="col-sm-8">
               <input type="email" class="form-control" id="inputEmail3" name ="u_email" placeholder="johndoe@example.com" required>
             </div>
           </div>
           <div class="form-group row">
             <label for="inputPassword3" class="col-sm-4 col-form-label">Phone</label>
             <div class="col-sm-8">
               <input type="text" class="form-control" id="inputPassword3" name="phone" placeholder="0712345678">
             </div>
           </div>
           <div class="form-group row">
             <label for="inputPassword3" class="col-sm-4 col-form-label">Password</label>
             <div class="col-sm-8">
               <input type="password" class="form-control" id="inputPassword3" name="p_word" placeholder="Password">
             </div>
           </div>
           <div class="form-group row">
             <div class="col-sm-10">
               <button type="submit" class="btn btn-lg btn-success" style="margin-top: 13px; margin-left: 100px;">Create</button>
             </div>
           </div>
         </form>

    </form>

  </div>
  <div class="card-footer text-white bg-dark">
    Already have an account <a href="index.html">Sign in</a>
  </div>
</div>
  </div>
  </div>
</div>
  

</body>
</html>

