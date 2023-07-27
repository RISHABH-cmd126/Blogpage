<%-- 
    Document   : login
    Created on : 28-Jun-2023, 3:38:15 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" import="com.techblog.entities.message" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
            var email,pass;
            function sub(){
                email=document.getElementById("exampleInputEmail1").value;
                pass=document.getElementById("exampleInputPassword1").value;
                var e=document.getElementById("emailHelp");
                var e1=document.getElementById("emailHelp1");
                var p=document.getElementById("passHelp1");
                if(email==""){
                     event.preventDefault();
                    e.style.display="none";
                    e1.style.display="inline";
                   
                }
                if(pass==""){
                     e.style.display="inline";
                    e1.style.display="none";
                    event.preventDefault();
                    p.style.display="inline";
                }
                else{
                    p.style.display="none";
                }
            }
        </script>
    </head>
    <body style="background-color: #faf9f9">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row" style="margin-top: 100px;">
                <div class="col-md-4 offset-4">
                    <div class="card">
                        <div class="header text-center form-control bg-secondary text-light" style="padding: 10px;">
                            <p>LOGIN</p>
                        </div>
                        <div class="card-body">
                            <form action="loginservlet" method="POST">
                                <% 
                                message m=(message)session.getAttribute("m");
                                if(m!=null){
                                %>
                                <div class="header text-center form-control <%=m.getCssstyle()%> text-light" style="padding: 0px;">
                                    <p><%=m.getContent() %></p>
                                </div>
                                <%
                                      session.removeAttribute("m");
                                    }
                                %>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    <div id="emailHelp1" class="form-text" style="display:none; color: red!important;">Please fill the above box</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                                   <div id="passHelp1" class="form-text" style="display:none; color:red!important;">Please fill the above box</div>
                                </div>
                                <button type="submit" onclick="sub()" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>
