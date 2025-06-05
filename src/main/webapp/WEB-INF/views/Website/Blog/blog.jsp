<%@page import="com.shoaib.modal.Blogs"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
     <jsp:include page="../css.jsp" />
</head>
<%
List<Blogs> blog = (List<Blogs>)request.getAttribute("blogs");
%>
<body class="front" data-spy="scroll" data-target="#top-inner" data-offset="0">
<div id="main">
    
     <jsp:include page="../header.jsp" />
   <div class="breadcrumbs1_wrapper" style="background-image: url(assets/images/breadcumimg.jpeg); background-repeat: no-repeat; background-size: cover; height: 300px;">
			<div class="container-fluid"
				style="background: #00000033; height: -webkit-fill-available;">
				<div class="title1 text-white" style="padding-top: 130px;">Blog</div>
				<div class="title2 text-white">
					<a href="./">Home</a><span> | </span>Blog
				</div>
			</div>
		</div>
<div id="latest-news">
        <div class="container">

            <div class="title1">Our Blogs</div>
            <div class="title2">Beyond rooms — stories, tips, and experiences.</div>

            <div class="row">
            <%if(blog.size() > 0){
            	for(Blogs b: blog){
            		%>
            
                <div class="col-md-6">
                    <div class="latest-news-wrapper" onclick="blogdetails(<%=b.getSno()%>,'<%=b.getTitle()%>')">
                        <div class="latest-news-inner">
                            <div class="latest-news clearfix">
                                <figure><img src="displayimage?url=<%=b.getImage()%>" alt="" class="img-fluid"></figure>
                                <div class="caption">
                                    <div class="txt1"><a href="javascript:void(0)" onclick="blogdetails(<%=b.getSno()%>,'<%=b.getTitle()%>')"><%=b.getTitle()%></a></div>
                                    <div class="txt2"><%=b.getSummery()%> <a href="javascript:void(0)" onclick="blogdetails(<%=b.getSno()%>,'<%=b.getTitle()%>')">Read more...</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}} else{%>
                <div class="col-md-12">
                    <div class="latest-news-wrapper">
                        <div class="latest-news-inner">
                            <div class="latest-news clearfix">
                                <div class="caption">
                                    <div class="txt1" style="color: red;">No Blogs Found</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
                
            </div>


        </div>
    </div>
    <jsp:include page="../footer.jsp" />

 <jsp:include page="../js.jsp" />

</body>

<script>

</script>

</html>