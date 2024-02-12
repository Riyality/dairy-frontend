<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="vertical" data-theme-mode="light" data-header-styles="light" data-menu-styles="light" data-toggled="close">

    <head>

        <!-- META DATA eta Data -->
		<meta charset="UTF-8">
        <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=no'>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="Description" content="Laravel Bootstrap Responsive Admin Web Dashboard Template">
        <meta name="Author" content="Spruko Technologies Private Limited">
        <meta name="keywords" content="">

        <!-- TITLE -->
		<title> Dairy Management </title>

        <!-- FAVICON -->
        <link rel="icon" href="<c:url value="/resources/assets/images/cow.jpg"/>" type="image/x-icon">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        <!-- APP SCSS -->
        <link rel="preload" as="style" href="https://laravelui.spruko.com/ynex/build/assets/app-fce3f544.css" />
        <link rel="stylesheet" href="https://laravelui.spruko.com/ynex/build/assets/app-fce3f544.css" />

	<style type="text/css">
	
		.signInBox{
			box-shadow: 0 0 7px -3px #000;
			background: #fff;
		}
	
		.imgBox{
			height: 97vh	
		}
		
		.loginImg{
			width: 100%;
			height: 95vh;
		}
		
		.body{
			background-image: url(<c:url value="/resources/assets/images/cow.jpg"/>);
			background-repeat: no-repeat;
			background-size: 100% 100vh;
		}
	
	</style>

	</head>

    <body class="bg-white body">

       
        <div class="row authentication mx-0">

            <div class="col-xxl-12 col-xl-12 col-lg-12">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-4 col-sm-8 col-12">
                        <div class="p-5 signInBox">
                            
                          
                              <p class="h5 fw-semibold mb-2">Sign In</p>
	                            <div class="row gy-3 mt-3" >
	                               <form class="login-form" action="/logins" method="post">
	                                <div class="col-xl-12 mt-0">
	                                    <label class="form-label text-default">User Name</label>
	                                    <input type="text" class="form-control form-control-lg" name="username"  placeholder="user name">
	                                </div>
	                                <div class="col-xl-12 mb-3">
	                                    <label class="form-label text-default d-block">Password</label>
	                                    <div class="input-group">
	                                        <input type="password" class="form-control form-control-lg" name="password" placeholder="password">
	                                        <button class="btn btn-light" type="button" id="button-addon2"><i class="ri-eye-off-line align-middle"></i></button>
	                                    </div>
	                                </div>
	                                <div class="col-xl-12 d-grid mt-2">
	                                <button type="submit" class="btn btn-lg btn-primary">login</button>
	                                </div>
	                                <p style="color: red;">${errorMsg}</p>
	                            </form>
	                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <%-- <div class="col-xxl-6 col-xl-6 col-lg-6 d-xl-block d-none px-0">
                <div class="imgBox">
                        <img src="<c:url value="/resources/assets/images/cow.jpg"/>" alt="logo" class="loginImg" >
                </div>
            </div> --%>

        </div>


        
        <!-- SCRIPTS -->

             <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
			 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
             <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <!-- END SCRIPTS -->

	</body>
</html>
