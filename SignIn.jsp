
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/SignIn.css" type="text/css" />
          <link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet"> 
        <title>Sign In</title>
    </head>
    <body>
      <header>
        <h1>Welcome, Sign In!</h1>
      </header>
        <div class="container">
            <form class="form-horizontal" action="Login" method="post">

                <div class="inputWrapper">

                    <div class="col-md-12">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
                <div class="inputWrapper input2">

                        <div class="col-md-12">
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                        </div>
                </div>

                <br/>
                <br/>
                <div>
                    <div class="col-md-12">
                        <button type="submit" value="login">Sign In</button>
                    </div>
                </div>

    </form>
  </div>
  <footer>
    <div>
      <span><a href="#">Forgot Password</a></span>
      <span id="signup">Don't have an account? <a href="SignUp.jsp">Get Started</a></span>
    </div>
  </footer>



    </body>
</html>
