<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Student List</title>
	<link rel="stylesheet" href="../resources/member.css" type="text/css"></link>
</head>
<body>
	<div align=center>
		<header>구독 목록</header><br>
			<c:out value="${param.id} 님"/>
		<table>
		  <tr>
		    <th><img src="../resources/images/netflix.png" width="200" /></th>
		    <th><img src="../resources/images/watcha.png" width="200"/></th>
		    <th><img src="../resources/images/wavve.png" width="200"/></th>
		    <th><img src="../resources/images/tving.png" width="200"/></th>
		  </tr>
		  <tr>
		    
		    <th><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=Netflix" var="url"/><a href="${url}">넷플릭스</a></th>
		    <th><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=Watcha" var="url"/><a href="${url}">왓챠</a></th>
		    <th><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=wavve" var="url"/><a href="${url}">웨이브</a></th>
		    <th><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=tiving" var="url"/><a href="${url}">티빙</a></th>
		  </tr>
		  <tr>
		    <th><img src="../resources/images/melon.png" width="200" /></th>
		    <th><img src="../resources/images/netflix.png" width="200"/></th>
		    <th><img src="../resources/images/Spotify.png" width="200"/></th>
		  </tr>
		  <tr>
		    <th><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=melon" var="url"/><a href="${url}">멜론</a></th>
		    <th><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=AppleMusic" var="url"/><a href="${url}">애플뮤직</a></th>
		    <th><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=spotify" var="url"/><a href="${url}">스포티파이</a></th>
		  </tr>
		</table>
	</div>
</body>
</html>
 --%>

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
              Subscribe
            </h6>
            <p>
              <table>
		  <tr>
		    <td align=center><img src="../resources/images/netflix.png" width="200" /></td>
		    <td align=center><img src="../resources/images/watcha.png" width="200"/></td>
		    <td align=center><img src="../resources/images/wavve.png" width="200"/></td>
		    <td align=center><img src="../resources/images/tving.png" width="200"/></td>
		  </tr>
		  <tr>
		    
		    <td align=center><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=Netflix" var="url"/><a href="${url}">넷플릭스</a></td>
		    <td align=center><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=Watcha" var="url"/><a href="${url}">왓챠</a></td>
		    <td align=center><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=wavve" var="url"/><a href="${url}">웨이브</a></td>
		    <td align=center><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=tiving" var="url"/><a href="${url}">티빙</a></td>
		  </tr>
		  <tr>
		    <td align=center><img src="../resources/images/melon.png" width="200" /></td>
		    <td align=center><img src="../resources/images/netflix.png" width="200"/></td>
		    <td align=center><img src="../resources/images/Spotify.png" width="200"/></td>
		  </tr>
		  <tr>
		    <td align=center><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=melon" var="url"/><a href="${url}">멜론</a></td>
		    <td align=center><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=AppleMusic" var="url"/><a href="${url}">애플뮤직</a></td>
		    <td align=center><c:url value="/subscribe/platformPriceList?id=${param.id}&platform=spotify" var="url"/><a href="${url}">스포티파이</a></td>
		  </tr>
		</table>
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
