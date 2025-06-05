<%@page import="com.shoaib.modal.Category"%>
<%@page import="com.shoaib.modal.Blogs"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@page import="java.util.List"%>
<%
List<Blogs> blog = (List<Blogs>)request.getAttribute("blogs");
List<Category> cat = (List<Category>)request.getAttribute("cat");
List<Blogs> blgs = (List<Blogs>)request.getAttribute("blgs");
Date createdAt1 = blog.get(0).getCreatedAt(); 

SimpleDateFormat formatter = new SimpleDateFormat("dd MMMM yyyy");
String cdate = formatter.format(createdAt1).toUpperCase();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta name="description" content="<%=blog.get(0).getMeta_description()%>">
<meta name="keywords" content="<%=blog.get(0).getMeta_keywords()%>">


     <jsp:include page="../css.jsp" />
</head>

<body class="front" data-spy="scroll" data-target="#top-inner" data-offset="0">
<div id="main">
    
     <jsp:include page="../header.jsp" />
   <div class="breadcrumbs1_wrapper" style="background-image: url(assets/images/breadcumimg.jpeg); background-repeat: no-repeat; background-size: cover; height: 300px;">
			<div class="container-fluid"
				style="background: #00000033; height: -webkit-fill-available;">
				<div class="title1 text-white" style="padding-top: 130px;"><%=blog.get(0).getTitle()%></div>
				<div class="title2 text-white">
					<a href="./">Home</a><span> | </span><a href="blog">Blog</a> | Blog Details
				</div>
			</div>
		</div>
<div id="content-wrapper">
        <div id="content-inner">
            <div class="container">
              <!--   <div class="blog-search">
                    <form class="clearfix">
                        <input type="text" class="form-control" placeholder="Type keyword">
                        <a href="#" class=""><i class="fa fa-search"></i></a>
                    </form>
                </div> -->

                <div class="row">
                    <div class="col-md-8 content-part">
                        <div class="post post-full">
                            <div class="post-header">
                                <div class="post-image">
                                    <img src="displayimage?url=<%=blog.get(0).getImage()%>" alt="" class="img-fluid">
                                </div>
                            </div>
                            <div class="post-story">
                                <h2><%=blog.get(0).getTitle()%></h2>
                                <div class="post-additional">
                                    <%=cdate %>
                                </div>
                                <div class="post-story-body">
                                    <%=blog.get(0).getDescription()%>
                                   <!--  <blockquote class="blockquote1">
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                                        euismod tincidunt ut laoreet dolore magna aliquam Lorem ipsum dolor sit amet
                                        consectetuer
                                    </blockquote> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 offset-md-1 sidebar-part">
                        <div class="sidebar-block">
                            <div class="sidebar-title">
                                CATEGORY
                            </div>
                            <ul class="ul2">
                            <%if(cat != null){
                            	for(Category c : cat){%>
                                <li><a href="#"> <%=c.getCategory_name()%></a></li>
                                <%}} %>
                                <!-- <li><a href="#">Travel <span>120</span></a></li>
                                <li><a href="#">Cruises <span>312</span></a></li>
                                <li><a href="#">Fitness Club <span>76</span></a></li>
                                <li><a href="#">Restaurant <span>15</span></a></li>
                                <li><a href="#">Night Club <span>33</span></a></li>
                                <li><a href="#">Swimming Pool <span>14</span></a></li> -->
                            </ul>
                        </div>
                        <div class="sidebar-block">
                            <div class="sidebar-title">
                                Related POST
                            </div>
                            <%if(blgs.size() > 0){
                            	for(Blogs b : blgs){
                            		
                            		Date createdAt = b.getCreatedAt();  // returns java.util.Date or java.sql.Timestamp

                            		String formattedDate = formatter.format(createdAt).toUpperCase();

                                    %>
                            <div class="recent-post1 clearfix">
                                <a href="javascript:void(0)" onclick="blogdetails(<%=b.getSno()%>,'<%=b.getTitle()%>')">
                                    <figure><img src="displayimage?url=<%=b.getImage()%>" alt="" class="img-fluid"></figure>
                                    <div class="caption">
                                        <div class="txt1"><%=b.getTitle()%></div>
                                        <div class="txt2"><%=formattedDate%></div>
                                    </div>
                                </a>
                            </div>
                            <%}} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
  

   <!--  <div id="loader" class="loader-holder">
        <div class="block"><img src="assets/images/hearts.svg" width="100" alt="loader"></div>
    </div> -->
</div>

 <jsp:include page="../js.jsp" />

</body>

</html>