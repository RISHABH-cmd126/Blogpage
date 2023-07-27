<%@page import="com.techblog.helper.*,com.techblog.dao.*,java.util.*,com.techblog.entities.*" %>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
</head>
<div class="row">
    <%
        User u=(User)session.getAttribute("currentuser");
    postdao pd=new postdao(connectionprovider.getConnection());
      int cid=Integer.parseInt(request.getParameter("id"));
      List<post> list1=null;
    if (cid == 0){
      list1=pd.getallpost();
        }
        else{
      list1=pd.getcidpost(cid);
        }
    for(post p:list1){
    String cont=new String(p.getPcontent());
    String s=cont.substring(0,cont.length()/2);
    %>
    <div class="col-md-6">
        <form class="card" action="read.jsp?postid=<%=p.getPid()%>" method="POST" >
            <img class="" src="img/<%=p.getPpic()%>" height="250px"/>
            <div class="card-body" style="background-color:   cornsilk;">

                <h6><%=p.getPtitle()%></h6>
                <p><%=s%>.........</p>
               
                <button type="submit" style="border: 0px; font-family: cursive; background-color: white; margin-left: 0px;" ><b>Read more</b></button>  
                 
            </div>
                <%
                like l=new like(connectionprovider.getConnection());
                int a=l.count(p.getPid());
                %>
                <div class="card-footer">
                    <a href="#!" onclick="dolike(<%=p.getPid()%>,<%=u.getId()%>)" class="btn btn-outline-primary"><i class="bi bi-hand-thumbs-up" aria-hidden="true"><span class="like"><%=a%></span></i></a>
                </div>
            

        </form>

    </div>
    <%
        }
    
    %>
    <script
            src="https://code.jquery.com/jquery-3.7.0.js"
            integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
        crossorigin="anonymous"></script>
    <script>
        
       function dolike(pid,uid){
           console.log(pid+","+uid);
                      const d ={
               pid:pid,
               uid:uid,
               operation:'like'
           };
           $.ajax({
               url:"likeservlet",
               data:d,
               success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        var result=$.trim(data);
                        if(result ==  "true"){
                            let c=$(".like").html();
                            c++;
                            $(".like").html(c);
                        }
                    }
                  
               
           });
       }
    </script>
</div>