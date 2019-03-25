<%-- 
    Document   : signin
    Created on : 19 Mar, 2019, 10:20:20 PM
    Author     : MANDIRA CHAUDHURI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Sign In</title>
    </head>
    <body>
        <div class="container">
            <h1 style="text-align:center;">SIGN IN</h1>
            <form class="form-horizontal" action="Login" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Email-id:</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="pwd">Password:</label>
                        <div class="col-sm-9">          
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                        </div>
                </div>
                <br/>
                <br/>
                <div class="form-group">        
                    <div class="col-sm-offset-3 col-sm-9">
                        <button type="submit" class="btn btn-default" value="login">Submit</button>
                    </div>
                </div>
                <div class="col-sm-9">
                    <h3 style="text-align:center;">Oops!!!Not a registered user,<a href="Signup.html">here you go</a></h3>
                </div>
    </form>
  </div>
    </body>
</html>
