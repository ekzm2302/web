<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js" integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>

<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom ">
    <div class="container-fluid" >
        <button class="btn btn-primary" id="sidebarToggle">메뉴</button>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                <c:if test='${not empty loginInfo }'>               
                	<c:if test="${not empty loginInfo.profile }">
                	
                	<img class='profile' src="${loginInfo.profile}"/>
                	<span style='margin-right: 20px'>${loginInfo.name} 님</span>                	
                	</c:if>                	
                	<c:if test="${empty loginInfo.profile }">
	                	<i class="profile font-g fa-regular fa-circle-user"></i>
                	<span style='margin-right: 20px'>${loginInfo.name} 님</span>         
                	</c:if>
              	
                
                
                
                
                </c:if>   
                         
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">내 정보</a>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <!-- 로그인하지 않은 경우 -->
                    <c:if test='${empty loginInfo}'>
                        <a class="dropdown-item" href="login.mb">로그인</a>
                        <a class="dropdown-item" href="#!">회원가입</a>
					</c:if>                        
                    <!-- 로그인한 경우 -->
                    <c:if test='${not empty loginInfo}'>
                        <a class="dropdown-item" href="#!">My Page</a>
                        <a class="dropdown-item" href="logout.mb">로그아웃</a>
                        
					</c:if>                        
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#!">Something else here</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>