<%@page import="com.shoaib.modal.Blogs"%>
<%@page import="com.shoaib.modal.Gallery"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <jsp:include page="../css.jsp" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css" />
  <style>
    .gallery-img {
      width: 100%;
      height: 250px;
      object-fit: cover;
      border-radius: 8px;
      transition: transform 0.3s;
    }
    .gallery-img:hover {
      transform: scale(1.05);
      cursor: pointer;
    }
    .nav-tabs .nav-link {
      font-weight: 500;
    }
    a {
      text-decoration: none;
    }
    .lightbox .lb-image {
      width: 800px !important;
      height: 500px !important;
      object-fit: cover;
    }
  </style>
</head>
<%
  List<Gallery> gallery = (List<Gallery>)request.getAttribute("gallery");
%>
<body class="front" data-spy="scroll" data-target="#top-inner" data-offset="0">
<div id="main">
  <jsp:include page="../header.jsp" />
  <div class="breadcrumbs1_wrapper" style="background-image: url(assets/images/breadcumimg.jpeg); background-repeat: no-repeat; background-size: cover; height: 300px;">
    <div class="container-fluid" style="background: #00000033; height: -webkit-fill-available;">
      <div class="title1 text-white" style="padding-top: 130px;">Gallery</div>
      <div class="title2 text-white">
        <a href="./">Home</a><span> | </span>Gallery
      </div>
    </div>
  </div>
  <div class="container py-5">
    <h2 class="text-center mb-4">Gallery</h2>
    <!-- Nav Tabs -->
    <ul class="nav nav-tabs justify-content-center mb-4" id="galleryTabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#all">All</a>
      </li>
      <% if (gallery != null && gallery.size() > 0) {
        for (Gallery g : gallery) { %>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#<%=g.getCategory_name()%>"><%=g.getCategory_name()%></a>
          </li>
      <% }} %>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content">
      <!-- All -->
      <div class="tab-pane fade show active" id="all">
        <div class="row">
          <% if (gallery != null && gallery.size() > 0) {
            for (Gallery g : gallery) { %>
              <div class="col-md-4 mb-4">
                <a href="displayimage?url=<%=g.getImage()%>" data-lightbox="all" data-title="<%=g.getCategory_name()%>">
                  <img src="displayimage?url=<%=g.getImage()%>" class="img-fluid gallery-img" alt="Image">
                </a>
              </div>
          <% }} %>
        </div>
      </div>

      <%-- Dynamic Tabs by Category --%>
      <% if (gallery != null && gallery.size() > 0) {
        for (Gallery category : gallery) { %>
          <div class="tab-pane fade" id="<%=category.getCategory_name()%>">
            <div class="row">
              <% for (Gallery g : gallery) {
                   if (g.getCategory_name().equals(category.getCategory_name())) { %>
                <div class="col-md-4 mb-4">
                  <a href="displayimage?url=<%=g.getImage()%>" data-lightbox="<%=g.getCategory_name()%>" data-title="<%=g.getCategory_name()%>">
                    <img src="displayimage?url=<%=g.getImage()%>" class="img-fluid gallery-img" alt="<%=g.getCategory_name()%>">
                  </a>
                </div>
              <% } } %>
            </div>
          </div>
      <% }} %>

    </div>
  </div>

  <jsp:include page="../footer.jsp" />
</div>
<jsp:include page="../js.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
</body>
</html>
