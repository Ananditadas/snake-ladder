<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/SignUp.css" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
          <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"
  type="text/javascript"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/additional-methods.min.js"
type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <h1 style="text-align:center;">Sign Up to start playing the Game</h1></br>
            <p>It's free!</p>
            <form id="myform"class="form-horizontal" action="Register" method="post">
                <div class="inputWrapper row">

                    <div class="col-md-6 wb-frmvld">
                        <input type="text" class="form-control" id="name1" placeholder="Name" name="name1" data-rule-lettersonly="true" data-rule-minlength="2" data-msg-lettersonly="Only use letters. Atleast 2 characters" required>
                        <div class="extraInfo"></div>
                    </div>



                    <div class="col-md-6">
                        <input type="number" min="1" max="5" class="form-control" id="class1" placeholder="Class" name="class1"  required>
                    </div>
                </div>
                <div class="inputWrapper row">

                    <div class="col-md-6">
                        <input type="email" class="form-control" id="email" placeholder="Email" name="email" data-rule-nowhitespace="true" data-rule-email="true" required>
                        <div class="extraInfo">Enter a valid Email ID</div>
                    </div>



                    <div class="col-md-6">
                        <input type="email" class="form-control" id="emailc" placeholder="Confirm email" name="emailc" data-rule-equalTo="#email" data-msg-equalTo="Email IDs don't match" required>
                        <div class="extraInfo"></div>
                    </div>
                </div>
                <div class="inputWrapper row">

                        <div class="col-md-6">
                            <input type="password" class="form-control" id="pwd" placeholder="Password" name="pwd"  data-rule-pattern="[A-Za-z0-9\s]{6,}" data-rule-alphanumeric="true" data-rule-minlength="6" required>
                            <div class="extraInfo">Type 6 characters or more. Use only numbers and letters</div>
                        </div>

                    <div class="col-md-6">
                        <input type="password" class="form-control" id="pwdc" placeholder="Confirm password" name="pwdc" data-rule-equalTo="#pwd" data-msg-equalTo="Passwords don't match">
                        <div class="extraInfo" id="pass">Passwords don't match</div>
                   </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-default" onclick="verify()">Sign Up</button>
                    </div>
                </div>
            </form>
            <footer><span>Already have an account? <a href="SignIn.jsp">Login Here</a></span></footer>
        </div>
        <script>
        $("#myform").validate();
        </script>
    </body>
</html>
