<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.milk.member.model.vo.Member, com.milk.member.model.vo.Order" %>
<% 
	String contextPath = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
	Order OrderList = (Order)session.getAttribute("OrderList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 좋아요버튼 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
    .header{width: 1000px; height: 200px;}
    .header-1{float:left; width: 25%; height: 100%; box-sizing: border-box; padding-top: 160px;}
    .header-2{ 
        float:left;
        width: 15%;
        height: 100%;
        padding-left: 50px;
        padding-top: 50px;
        padding-bottom: 50px;
        box-sizing: border-box;
    }
    .header-3{
        float:left;
        width: 30%;
        height: 100%;
        font-size: xxx-large;
        line-height: 220px;
        padding-left: 20px;
        box-sizing: border-box;
    }
    .header-4{
        float:left;
        width: 30%;
        height: 100%;
        padding-right: 50px;
        box-sizing: border-box;
    }
    .header-4a{
        float:left;
        width: 100%;
        height: 40%;
        line-height: 110px;
        box-sizing: border-box;
    }
    .header-4a>a{padding: 10px;}
    .header-4btn{
        float:left;
        width: 100%;
        height: 60%;
        line-height: 200px;
        box-sizing: border-box;
    }
    .header-4btn>img{padding: 15px;}
    .outer{width:1000px;}

    
     /* 메뉴 네비게이터탭 */
     .menu-wrap{
            margin:auto;
            margin-bottom:50px;
            width: 1000px;
            height:50px;
        }

        .menu-navi{
            list-style-type:none;
            padding-left:8px;
            margin:0;
            width:100%;
            height:10%;
            
        }

        /* 상위 메뉴 */
        .menu-navi>li{
            float:left;
            width:15%;
            height:100%;
            list-style:none;
            margin:5px;
        }


        .menu-navi a{ 
            /* border:1px solid orange; */
            text-decoration:none;
            color:rgb(49, 153, 251);
            width:100%;
            height:100%;
            display:block;
        }
 

       /* 상위메뉴 폰트사이즈 정하기 */
       .menu-navi>li>a{
        line-height:40px;
        font-size:18px;
        font-weight:400;
        text-align: center;
       }




        .all-menu{
            list-style-type:none;
            /* padding-left:8px; */
            margin:auto;
            height:10%;
            width: 1000px;
        
        }

        /* 상위 메뉴 */
        .all-menu>li{
            float:left;
            width:18%;
            height:100%;
            list-style:none;
            margin:5px;
        }
        /* 하위 메뉴 */
        .all-menu>li>ul>li{
            list-style:none;
            padding:0;
            margin-left:2px;
            width:90%;
            height:100%;
        } 

        .all-menu a{ 
            /* border:1px solid orange; */
            text-decoration:none;
            color:rgb(99, 96, 96);
            width:100%;
            height:100%;
            display:block;
            text-align:center;
            
            
        }
       .all-menu>li>ul{
             width:100%;
             height:100%;
       }

       /* 상위메뉴 폰트사이즈 정하기 */
       .all-menu>li>a{
        font-size:20px;
        font-weight:900;
        margin-top:10px;
       }
        /* 하위메뉴 폰트사이즈 정하기 */
        .all-menu>li>ul>li>a{
        font-size:15px;
        margin-top:7px;
        padding-left:3px;
       }


</style>

</head>
<body>
	<% if(alertMsg != null) { %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>


    <div class="wrap" align="center">
        <div class="header">
            <div class="header-1">
            	<form action="<%=contextPath %>/search.pro?cpage=1" method="post" id="search-form">
	                <input id="keyword" name="keyword"  type=“text"  maxlength="30" required>
	                <button type="submit" class="btn btn-primary btn-sm">검색</button>
                </form>
            </div>										 
            <div class="header-2"><a href="<%= contextPath %>"><img src="resources/images/logo.jpg" width="100px;"></a></div>
            <div class="header-3"><a style="text-decoration:none" href="<%= contextPath %>"><b class="text-primary">아이럽우유</b></a></div>
            <div class="header-4">
                <div class="header-4a" align="right">
                
					<% if(loginMember == null) { %>
	                    <!-- 로그인 전 -->
	                    <a href="<%= contextPath %>/loginpage.me" class="text-secondary" style="text-decoration:none">로그인</a>
	                    <a href="<%= contextPath %>/enrollForm.me" class="text-secondary" style="text-decoration:none">회원가입</a>
	                    <a href="<%=contextPath %>/list.sv?cpage=1" class="text-secondary" style="text-decoration:none">고객센터</a>
					<% }else { %>
	                    <!-- 로그인 후 -->
	                    <a href="<%= contextPath %>/logout.me" class="text-secondary" style="text-decoration:none">로그아웃</a>
	                    <a href="<%=contextPath %>/list.sv?cpage=1" class="text-secondary" style="text-decoration:none">고객센터</a> 
                    <% } %>
                    
                </div>
                <div class="header-4btn" align="right">
                	<% if(loginMember == null) { %>
	                    <!-- 로그인 전 -->
	                    <a href="<%= contextPath%>/loginpage.me"><img src="resources/images/order.png" style="width:50px"></a>&nbsp;&nbsp;
	                    <a href="<%= contextPath %>/loginpage.me"><img src="resources/images/cart.png" style="width:50px"></a>&nbsp;
	                    <a href="<%= contextPath%>/loginpage.me"><img src="resources/images/myPage.png" style="width:50px"></a>
					<% }else { %>
						<!-- 로그인 후 -->
	                    <a href=""><img src="resources/images/order.png" style="width:50px"></a>&nbsp;&nbsp;
	                    <a href="<%= contextPath %>/cart.pr"><img src="resources/images/cart.png" style="width:50px"></a>&nbsp;
	                    <a href="<%= contextPath %>/myorder.me"><img src="resources/images/myPage.png" style="width:50px"></a>
                    <% } %>
                
                   
                </div>
            </div>
        </div>
    </div>
    <hr>
    <br>

     
    <div class="menu-wrap">

        <ul class="menu-navi">
            <li>
                <div class="dropdown">
                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">전체상품</button>
                    <div class="dropdown-menu" style="height:200px;">
                       
                       
                                <ul class="all-menu">
                                  <li><a class="dropdown-header" href="<%=contextPath%>/proList.pro?우유&cpage=1">우유</a> <!-- 카테고리 -->
                                        <br>
                                        <!-- <div style="border:1px solid gray; width:150px"></div> -->
                                        <br>
                                        <ul>
                                            <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category=백색시유&cpage=1">백색시유</a></li> <!--참조 카테고리-->
                                            <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category=가공우유&cpage=1">가공우유</a></li>
                                            <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category=멸균우유&cpage=1">멸균우유</a></li>
                    
                                        </ul>
                                    </li>
                                    <li><a class="dropdown-header" href="<%=contextPath%>/proList.pro?category=발효유&cpage=1">발효유</a>
                                        <br>
                                        <!-- <div style="border:1px solid gray; width:110px"></div> -->
                                        <br>
                                        <ul>
                                            <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category=발효유&cpage=1">발효유</a></li>
                                        </ul>
                                    </li>
                                    <li><a class="dropdown-header" href="<%=contextPath%>/proList.pro?category=치즈&cpage=1">치즈</a>
                                        <br>
                                        <!-- <div style="border:1px solid gray; width:110px"></div> -->
                                        <br>
                                        <ul>
                                            <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category=치즈&cpage=1">치즈</a></li>
                    
                                        </ul>
                                    </li>
                                    <li><a class="dropdown-header" href="<%=contextPath%>/proList.pro?category=락토프리&cpage=1">락토프리</a>
                                        <br>
                                        <!-- <div style="border:1px solid gray; width:110px"></div> -->
                                        <br>
                                        <ul>
                                            <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category=락토프리&cpage=1">락토프리우유</a></li>
                                        </ul>
                                    </li>
                                    <li><a class="dropdown-header" href="<%= contextPath %>/listR.re?cpage=1">레시피</a>
                                        <br>
                                        <!-- <div style="border:1px solid gray; width:110px"></div> -->
                                        <br>
                                        <ul>
                                            <li><a class="dropdown-item" href="<%= contextPath %>/listR.re?cpage=1">추천레시피</a></li>
                                            <li><a class="dropdown-item" href="<%= contextPath %>/list.re?cpage=1">자유게시판</a></li>
                                        </ul>
                                    </li>
                                </ul>
                           
                           
                        
                    </div>
                </div>
            </li>
            
            <li><a href="<%=contextPath%>/proList.pro?category=우유&cpage=1">우유</a></li>
            <li><a href="<%=contextPath%>/proList.pro?category=발효유&cpage=1">발효유</a></li>
            <li><a href="<%=contextPath%>/proList.pro?category=치즈&cpage=1">치즈</a></li>
            <li><a href="<%=contextPath%>/proList.pro?category=락토프리&cpage=1">락토프리</a></li>
            <li><a href="<%= contextPath %>/listR.re?cpage=1">레시피</a></li>
        </ul>
</div>

	<script>
	//	$('.btn dropdown-toggle').dropdown();
	</script>

</body>
</html>