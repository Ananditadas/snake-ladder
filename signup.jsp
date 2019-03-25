<%-- 
    Document   : signup
    Created on : 19 Mar, 2019, 10:33:00 PM
    Author     : MANDIRA CHAUDHURI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h1 style="text-align:center;">SIGN UP</h1>
            <form class="form-horizontal" action="Register" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="name1">Name:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="name1" placeholder="Enter name" name="name1">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="class1">Class:</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="class1" placeholder="Enter class" name="class1">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Email-id:</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="emailc">Confirm Email-id:</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="emailc" placeholder="confirm email" name="emailc">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="pwd">Password:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                        </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="pwdc">Confirm Password:</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="pwdc" placeholder="confirm password" name="pwdc">
                   </div>
                </div>
                <br/>
                <br/>
                <div class="form-group">        
                    <div class="col-sm-offset-3 col-sm-9">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
