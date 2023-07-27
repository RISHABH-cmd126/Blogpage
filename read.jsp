<%-- 
    Document   : read.jsp
    Created on : 10-Jul-2023, 2:56:09 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" import="com.techblog.entities.*" pageEncoding="UTF-8"%>
<%@page import="com.techblog.entities.*,com.techblog.helper.*,com.techblog.dao.*,java.util.*" %>
<%
   User user=(User)session.getAttribute("currentuser");
   if(user==null){
   response.sendRedirect("index.jsp");
    }



%>
<%
       int pid=Integer.parseInt(request.getParameter("postid"));
       postdao p=new postdao(connectionprovider.getConnection());
       post post=p.getpidpost(pid);
       String name=p.getname(post.getUser_id());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
         body{
                background: url("img/download.jpg");
                background-size: cover;
                background-attachment: fixed;
         }
            
    </style>
        <script>
            var editStatus = false;
            function edit() {

                //alert("loaded");
                var pd = document.getElementById("profile-details");
                var pe = document.getElementById("profile-edit");
                var bt = document.getElementById("bt");
                if (editStatus == false) {
                    pd.style.display = "none";
                    pe.style.display = "inline";
                    bt.value = "Back";
                    editStatus = true;
                } else {
                    pd.style.display = "inline";
                    pe.style.display = "none";
                    bt.value = "Edit";
                    editStatus = false;
                }
            }
            function post() {

                var op = document.getElementById("op").value;
                var title = document.getElementById("title").value;
                var content = document.getElementById("content").value;
                if (op == "") {
                    event.preventDefault();
                    document.getElementById("tm").style.display = "inline";
                    return;
                }
                document.getElementById("tm").style.display = "none";
                if (title == "") {
                    event.preventDefault();
                    document.getElementById("tm1").style.display = "inline";
                    return;
                }
                document.getElementById("tm1").style.display = "none";

                if (content == "") {
                    event.preventDefault();
                    document.getElementById("tm2").style.display = "inline";
                    return;
                }
                document.getElementById("tm2").style.display = "none";
                return;

            }
        </script>
    </head>
    <body class="bg-light">

        <nav class="navbar navbar-dark navbar-expand-lg bg-secondary .color ">
            <div class="container-fluid clp">
                <a class="navbar-brand" href="index.jsp">Techblog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="profile.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="modal" data-bs-target="#add-post" aria-current="page" href="">post</a>
                            </li>
                        </ul>
                    </ul>



                    <ul>
                        <li class="nav-item text-light mr-right">
                            <a class="nav  text-light" data-bs-toggle="modal" data-bs-target="#exampleModal" aria-current="page" href="">Profile</a>
                        </li>
                    </ul>

                    <ul>
                        <li class="nav-item mr-right">
                            <a class="nav-link text-light" href="logoutregister">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>



        <%
              String f=(String)session.getAttribute("done");
              if(f=="sure"){
        %>
        <script>
            alert("posted");
        </script>
        <%
            session.removeAttribute("done");
        }
        
        %>
        <div class="container my-4">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center bg-secondary text-light">
                            <h6 style="font-weight: 100; font-size: 25px;"><%=post.getPtitle()%></h6>
                        </div>
                        <img class="" src="img/<%=post.getPpic()%>" />
                        <div class="card-body my-2" style="background-color:   cornsilk;">

                            <p style="font-weight: 100; font-size: 20px;"><%=post.getPcontent()%></>
                            <pre><%=post.getPcode()%></pre>
                            <br/>
                            <b>Posted by :<%=name%></b>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Techblog</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center" >
                            <img src="img/default.jpg" style="border-radius:10%; max-width: 150px;"><br/>
                            <h3 class="mt-5"><%=user.getUsername()%></h3>
                            <table class="table" id="profile-details" style="display:inline;">
                                <tbody>
                                    <tr>
                                        <th scope="row">id</th>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><%=user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%=user.getGender()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="profile-edit" class="container text-center" style="display:none;">
                        <form action="editservlet" method="POST">
                            <table class="table" class="text-center mt-3">
                                <tbody>
                                    <tr>
                                        <th scope="row">id</th>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Username</th>
                                        <td><input type="text" name="user-name" value="<%=user.getUsername()%>"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><input type="email" name="user-email" value="<%=user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Password</th>
                                        <td><input type="password" name="user-pass" value="<%=user.getPassword()%>"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="submit" class="btn btn-outline-primary">Save</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <input type="button" id="bt" class="btn btn-primary" onclick="edit()" value="Edit"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="add-post" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="container" action="postservlet" method="POST" enctype="multipart/form-data" >
                            <div style="height: 40px;" >
                                <select name="select">
                                    <option selected>--select category--</option>
                                    <% postdao pd=new postdao(connectionprovider.getConnection());
                                    List <category> list=pd.getAllCategory();
                                    for (category c:list)
                                    {
                                    %>
                                    <option id="op" value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                      }  
                                    %>

                                </select>
                                <br/>
                                <div id="tm" style="color:red; display:none;">Select anyone of the category</div>
                            </div>
                            <br/>
                            <div style="height: 40px;" >
                                <input type="text" id="title" name="ptitle" placeholder="Enter the title" class="form-control">
                            </div>
                            <br/>
                            <div id="tm1" style="color:red; display:none;">Title must be necessary</div>

                            <div>
                                <textarea rows="5" id="content" name="pcontent" placeholder="Enter your content" class="form-control mt-3" ></textarea>

                            </div>
                            <br/>
                            <div id="tm2" style="color:red; display:none;">Content must be necessary</div>
                            <div>
                                <textarea rows="5" name="pcode" placeholder="Enter your program(if any)" class="form-control mt-3" ></textarea>

                            </div>
                            <div>
                                <label for="image">Select file</label><br/>
                                <input type="file" id="image" name="image">
                            </div>
                            <div class="container text-center">
                                <button type="submit" onclick="post()" class="btn btn-outline-primary">Submit</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- end -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">

        </script>
        <script
            src="https://code.jquery.com/jquery-3.7.0.js"
            integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
        crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

                                    </body>
                                    </html>
