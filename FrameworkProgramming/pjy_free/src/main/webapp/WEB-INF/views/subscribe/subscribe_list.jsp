<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>ELEMENTS</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="../resources/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Roboto:400,700&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../resources/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="../resources/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">
  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              Subscribe
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex mx-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav  ">
              </ul>
            </div>
            <div class="quote_btn-container  d-flex justify-content-center">
            <a href="">
                <c:out value="${param.id} 님"/>
              </a>
            
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- about section -->
  <section class="about_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="detail-box">
            <h6>
              구독 목록
            </h6>
            <p>
              <table width="600">
		  <tr>
		    <td align=center>이름</td><td align=center>가격</td><td align=center>구독상품</td><td align=center >바로가기</td><td align=center>삭제</td>
		  </tr>
		  <c:forEach var="item" items="${subscribe}" >
			  <tr>
			    <td align=center><c:out value="${item.subName}"/></td>
			    <td align=center><c:out value="${item.subPrice}"/></td>
			    <td align=center><c:out value="${item.subLevel}"/></td>
			    <td align=center><a href="${item.subLink}">바로가기</a></td>
			    <td align=center>
			      <c:url value="/subscribe/delete?id=${user.id}&subId=${item.subId }" var="url"/><a href="${url}">구독 삭제 </a> 
			    </td>
			  </tr>
		  </c:forEach>
		  
		  
		</table>
		<c:url value="/subscribe/platformList?id=${user.id}" var="url"/><a href="${url}">구독 리스트 추가</a>
            </p>
            <div>     
            </div>
          </div>
        </div>
        <div class="col-md-6">
        </div>
      </div>

    </div>
  </section>
  <!-- end about section -->


  <!-- info section -->
  <section class="info_section layout_padding">
    <div class="container">
      <div class="info_social">
        
      </div>
      <div>
      </div>
    </div>
  </section>

</body>
</body>

</html>
