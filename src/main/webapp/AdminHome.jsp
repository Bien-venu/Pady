<%
if(session.getAttribute("username") == null){
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css"></link>
 <link rel="stylesheet" href="css/signup.css" />
 <link rel="stylesheet" href="css/admin.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300&display=swap" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
</head>
<body >
              <div class="" id="frm">
            <form action="<%= request.getContextPath()%>/AdminServlet" method="post" enctype="multipart/form-data" autocomplete="off" class="sign-up-form">
              <div class="heading">
                <h2>Add a User</h2>
                <h6>Show all users</h6>
                <a href="showdata" class="toggle">Users</a>
              </div>

              <div class="actual-form">
                <div class="profile-image input-wrap">
                  <img id="profile-img" src="#" alt=""/>
                  <input type="file" id="image-upload" name="image" accept="image/*" />
                </div>
                <div class="way">
                  <div class="input-wrap">
                    <input
                      type="text"
                      name="name"
                      minlength="4"
                      class="input-field"
                      autocomplete="off"
                      required
                    />
                    <label>Name</label>
                  </div>
                  <div class="input-wrap">
                    <input
                      type="email"
                      name="email"
                      class="input-field"
                      autocomplete="off"
                      required
                    />
                    <label>Email</label>
                  </div>
                  <div class="input-wrap">
                    <input
                      type="text"
                      name="username"
                      minlength="4"
                      class="input-field"
                      autocomplete="off"
                      required
                    />
                    <label>UserName</label>
                  </div>

                  <div class="input-wrap">
                    <input
                      type="password"
                      name="password"
                      minlength="4"
                      class="input-field"
                      autocomplete="off"
                      required
                    />
                    <label>Password</label>
                  </div>
                  <div class="input-wrap">
                    <input
                      type="password"
                      name="cpassword"
                      minlength="4"
                      class="input-field"
                      autocomplete="off"
                      required
                    />
                    <label>Confirm your Password</label>
                  </div>
                </div>

                <input type="submit" value="Sign Up" class="sign-btn" />

                <p class="text">
                  By signing up, I agree to the
                  <a href="#">Terms of Services</a> and
                  <a href="#">Privacy Policy</a>
                </p>
              </div>
            </form>
          </div>
     <script src="js/app.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
       
    
    <script type="text/javascript">
	
	var statu = document.getElementById("status").value;
	if(statu == "exists"){
		Toastify({
			  text: "User already exists",
			  className: "error",
			  style: {
			    background: "linear-gradient(to right, #e24d4c, #e24d4c)",
			  }
			}).showToast();
	}else{
		if(statu == "password"){
			Toastify({
				  text: "Password not match!",
				  className: "error",
				  style: {
				    background: "linear-gradient(to right, #9b59b6, #9b59b6)",
				  }
				}).showToast();
		}else{
			if(statu == "success"){
				Toastify({
					  text: "Account created successfully!",
					  className: "error",
					  style: {
					    background: "linear-gradient(to right, #9b59b6, #9b59b6)",
					  }
					}).showToast();
			}
		}
	}
		
	</script>
</body>
</html>
