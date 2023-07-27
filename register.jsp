<%-- 
    Document   : register
    Created on : 28-Jun-2023, 4:12:34 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <% String msg=(String)session.getAttribute("ms"); %>
    <script>
        function fun() {
            var user, password, email, check, gender;
            user = document.getElementById("exampleInputusername").value;
            password = document.getElementById("exampleInputPassword1").value;
            email = document.getElementById("exampleInputEmail1").value;
            check = document.getElementById("exampleCheck1");
            gender = document.getElementById("exampleradio");
            var user1 = document.getElementById("user1");
            var em = document.getElementById("emailHelp");
            var em1 = document.getElementById("email1");
            var pass = document.getElementById("password");
            var check1 = document.getElementById("check");
            var gen = document.getElementById("gender");
            if (user == "") {
                user1.style.display = "inline";
                event.preventDefault();
                return;
            }
            user1.style.display = "none";
            if (email == "") {
                em.style.display = "none";
                em1.style.display = "inline";
                event.preventDefault();
                return;
            }
            em.style.display = "inline";
            em1.style.display = "none";
            if (password == "") {
                pass.style.display = "inline";
                event.preventDefault();
                return;
            }
            pass.style.display = "none";
            if (gender.checked == "") {
                gen.style.display = "inline";
                event.preventDefault();
                return;
            }
            gen.style.display = "none";
            if (check.checked == "") {
                check1.style.display = "inline";
                event.preventDefault();
                return;
            } else {
                check1.style.display = "none";
        

            }
        }
        <% 
               if(msg=="success"){
        %>
                alert("Login Successfully");
        <%
            response.sendRedirect("login.jsp");
            session.removeAttribute("ms");
            } 
        %>
    </script>


    <body id="body" style="background-color: #faf9f9">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row" style="margin-top: 100px;">
                <div class="col-md-4 offset-4">
                    <div class="card">
                        <div class="header text-center form-control bg-secondary text-light" style="padding: 10px;">
                            <p>REGISTER NOW</p>
                        </div>
                        <div class="card-body">
                            <form action="register1" >
                                <div class="mb-3" style="height:80px;">
                                    <label for="exampleInputusername" class="form-label">User Name</label>
                                    <input type="text" name="user" class="form-control" id="exampleInputusername">
                                    <% if(msg=="both"||msg=="user")
                                    { 
                                    %>
                                    <div style="color:red;">This username already exist</div>
                                    <%
                                        }
                                    %>
                                    <div style="display:none; color: red;" id="user1">please fill the above</div>
                                </div>
                                <div class="mb-3" style="height:80px;">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <% if(msg=="both"||msg=="email")
                                  { 
                                    %>
                                    <div style="color:red;">This email already exist</div>
                                    <%
                                        session.removeAttribute("ms");
                                        }else{
                                    %>
                                     <div id="emailHelp" class="form-text" >We'll never share your email with anyone else.</div>
                                    <%}%>
                                   
                                    <div style="display:none; color: red;" id="email1">please fill the above</div>
                                </div>
                                <div class="mb-3" style="height:80px;">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                                    <div style="display:none; color: red;" id="password">please fill the above</div>
                                </div>
                                <div class="mb-3" style="height:80px;">
                                    <label for="exampleradio" class="form-label">Gender</label><br/>
                                    <input type="radio" id="exampleradio" name="gender" value="Male">&nbsp; Male &nbsp;
                                    <input type="radio" id="exampleradio" name="gender" value="Female">&nbsp; Female
                                    <br/>
                                    <div style="display:none; color: red;" id="gender">please select the gender</div>
                                </div>
                                <div class="mb-3 form-check" style="height:80px;">
                                    <input type="checkbox" class="form-check-input" value="checked" id="exampleCheck1">
                                    <label class="form-check-label" name="check" for="exampleCheck1">I agree the terms and control</label><br/>
                                    <div style="display:none; color: red;" id="check">please check the box</div>
                                </div>
                                <button type="submit"  onclick="fun()" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>


    </body>
</html>
