<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Auction Page - Login Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="style.css">

</head>

<script>
  function checkForm(form)
  {
    if(form.usr.value == "") {
      alert("Error: Username cannot be blank!");
      form.usr.focus();
      return false;
    }
    re = /^\w+$/;
    if(!re.test(form.usr.value)) {
      alert("Error: Username must contain only letters, numbers and underscores!");
      form.usr.focus();
      return false;
    }

    if(form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
      if(form.pwd1.value.length < 6) {
        alert("Error: Password must contain at least six characters!");
        form.pwd1.focus();
        return false;
      }
      if(form.pwd1.value == form.usr.value) {
        alert("Error: Password must be different from Username!");
        form.pwd1.focus();
        return false;
      }
      re = /[0-9]/;
      if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one number (0-9)!");
        form.pwd1.focus();
        return false;
      }
      re = /[a-z]/;
      if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one lowercase letter (a-z)!");
        form.pwd1.focus();
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(form.pwd1.value)) {
        alert("Error: password must contain at least one uppercase letter (A-Z)!");
        form.pwd1.focus();
        return false;
      }
    } else {
      alert("Error: Please check that you've entered and confirmed your password!");
      form.pwd1.focus();
      return false;
    }

    //alert("You entered a valid password: " + form.pwd1.value);
    return true;
  }
</script>


<body>
<!-- partial:index.partial.html -->
<div id="particles-js"></div>
<body class="login">
	<div class="container">
		<div class="login-container-wrapper clearfix">
			<div class="logo">
				<i class="fa fa-sign-in"></i>
			</div>
			<div class="welcome"><strong>Welcome,</strong> Please enter your details</div>

			<form action="register.jsp" method="post" class="form-horizontal login-form" onsubmit="return checkForm(this);">
				<div class="form-group relative">
					<input id="login_username" class="form-control input-lg" type="text" name="usr" placeholder="Username" required>
					<i class="fa fa-user"></i>
				</div>
				<div class="form-group relative">
					<input id="login_username" class="form-control input-lg" type="text" name="name" placeholder="Name" required>
					<i class="fa fa-user"></i>
				</div>
				<div class="form-group relative password">
					<input id="login_password" class="form-control input-lg" type="password" name="pwd1" placeholder="Password" required>
					<i class="fa fa-lock"></i>
				</div>
				<div class="form-group relative password">
					<input id="login_password" class="form-control input-lg" type="password" name="pwdw" placeholder="Confirm Password" required>
					<i class="fa fa-lock"></i>
				</div>
				<div class="form-group relative">
					<input id="login_username" class="form-control input-lg" type="text" name="email" placeholder="Enter Email address" required>
					<i class="fa fa-user"></i>
				</div>
				
			  <form action="index.jsp">	
			  <div class="form-group">
			    <button type="submit" class="btn btn-success btn-lg btn-block">Submit</button>å
			  </div>
			  </form>
       
			</form>
		</div>
	</div>

  </body>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src='https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js'></script><script  src="./script.js"></script>

</body>
</html>