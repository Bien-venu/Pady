<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
<link rel="stylesheet" href="css/signup.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300&display=swap" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
</head>
<body>
<main>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>"/>
      <div class="box">
        <div class="inner-box">
          <div class="forms-wrap">
            <form action="<%= request.getContextPath()%>/login" enctype="multipart/form-data" method="post" autocomplete="off" class="sign-in-form">
              <div class="logo">
                <img src="./images/IMG_202308215_184154119.jpg" alt="pady" />
                <link rel="stylesheet" href="signin.css">
              </div>

              <div class="heading">
                <h2>Welcome Back</h2>
                <h6>Not registred yet?</h6>
                <a href="SignUp.jsp" class="toggle">Sign up</a>
              </div>

              <div class="actual-form">
                <div class="input-wrap">
                  <input
                    type="text"
                    name="username"
                    minlength="4"
                    class="input-field"
                    autocomplete="off"
                    required
                  />
                  <label>User Name</label>
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

                <input type="submit" value="Sign In" class="sign-btn" />
              </div>
            </form>
          </div>

          <div class="carousel">
            <div class="images-wrapper">
              <img
                src="./images/about-img.svg"
                class="image img-1 show"
                alt=""
              />
            </div>

            <div class="text-slider">
              <div class="text-wrap">
                <div class="text-group">
                  <h2>Let us get you on board!</h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script src="js/app.js"></script></body>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script type="text/javascript">
	
	var statu = document.getElementById("status").value;
	
	if(statu == "failed"){
		Toastify({
			  text: "Invalid Email or Password",
			  className: "error",
			  style: {
			    background: "linear-gradient(to right, #e24d4c, #e24d4c)",
			  }
			}).showToast();
	}
		
	</script>
</html>