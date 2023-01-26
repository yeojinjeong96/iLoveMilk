<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>



     /* 메뉴 네비게이터탭 */
        .menu-wrap{
            margin:auto;
            margin-top:50px;
            width: 700px;
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
        font-size:18px;
        font-weight:400;
        text-align: center;
       }




        .all-menu{
            list-style-type:none;
            padding-left:8px;
            margin:0;
            height:10%;
            width: 700px;
        
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
            text-align:left;
            
            
        }
       .all-menu>li>ul{
             width:100%;
             height:100%;
             padding-left:0;
             
       }

       /* 상위메뉴 폰트사이즈 정하기 */
       .all-menu>li>a{
        font-size:20px;
        font-weight:900;
        margin-top:10px;
       }
        /* 하위메뉴 폰트사이즈 정하기 */
        .all-menu>li>ul>li>a{
        font-size:11px;
        margin-top:3px;
        padding-left:5px;
       }





    #main-content{
        width:700px;
        height:1200px;
        margin:auto;
    }

    #demo{
        width:100%;
        height:30%;
    }
    .carousel-inner>div>img{
        width:700px;
        height: 350px;
    }

    /* 신상품 */
    #con1{
        width:100%;
        height:30%;
    }
    #con1-1{
        width:100%;
        height:20%;
    }
    #con1-2{
        width:100%;
        height:80%;

    }
    #con1-2>*{
        float:left;
    }

    .thumbnail{
    border:1px solid white;
    width:200px;
    display:inline-block;
    margin:14px;
    }


    /* 최신레시피 */
    #con2{
        width:100%;
        height:30%;
    }
    #con2-1{
        width:100%;
        height:20%;
    }
    #con2-2{
        width:100%;
        height:80%;
    }
    #con2-2>*{
        float:left;
    }

    .thumbnail{
    border:1px solid white;
    width:200px;
    display:inline-block;
    margin:14px;
    }

    .thumbnail img:hover{
    opacity:0.7;
    cursor:pointer;
    }

    </style>
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

   
    <div class="menu-wrap">
        <!-- 해당 카테고리값들은 반복문을 통해 만들어짐 -->
            <ul class="menu-navi">
                <li>
                    <div class="dropdown">
                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">전체상품</button>
                        <div class="dropdown-menu" style="height:200px;">
                           
                                <!-- 해당 카테고리값들은 반복문을 통해 만들어짐 -->
                                    <ul class="all-menu">
                                      <li><a class="dropdown-header" href="<%=contextPath%>/proList.pro?category='우유'">우유</a> <!-- 카테고리 -->
                                            <br>
                                            <div style="border:1px solid gray; width:110px"></div>
                                            <br>
                                            <ul>
                                                <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category='백색시유'">백색시유</a></li> <!--참조 카테고리-->
                                                <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category='가공우유'">가공우유</a></li>
                                                <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category='멸균우유'">멸균우유</a></li>
                        
                                            </ul>
                                        </li>
                                        <li><a class="dropdown-header" href="<%=contextPath%>/proList.pro?category='발효유'">발효유</a>
                                            <br>
                                            <div style="border:1px solid gray; width:110px"></div>
                                            <br>
                                            <ul>
                                                <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category='발효유'">발효유</a></li>
                                            </ul>
                                        </li>
                                        <li><a class="dropdown-header" href="<%=contextPath%>/proList.pro?category='치즈'">치즈</a>
                                            <br>
                                            <div style="border:1px solid gray; width:110px"></div>
                                            <br>
                                            <ul>
                                                <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category='치즈'">치즈</a></li>
                        
                                            </ul>
                                        </li>
                                        <li><a class="dropdown-header" href="<%=contextPath%>/proList.pro?category='락토프리'">락토프리</a>
                                            <br>
                                            <div style="border:1px solid gray; width:110px"></div>
                                            <br>
                                            <ul>
                                                <li><a class="dropdown-item" href="<%=contextPath%>/proList.pro?category='락토프리'">락토프리우유</a></li>
                                            </ul>
                                        </li>
                                        <li><a class="dropdown-header" href="">레시피</a>
                                            <br>
                                            <div style="border:1px solid gray; width:110px"></div>
                                            <br>
                                            <ul>
                                                <li><a class="dropdown-item" href="">추천레시피</a></li>
                                                <li><a class="dropdown-item" href="">자유게시판</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                               
                               
                            
                        </div>
                    </div>
                </li>
                
                <li><a href="">우유</a></li>
                <li><a href="">발효유</a></li>
                <li><a href="">치즈</a></li>
                <li><a href="">락토프리</a></li>
                <li><a href="">레시피</a></li>
            </ul>
    </div>
    
    <script>
    $('.dropdown-toggle').dropdown();
    </script>

    <div id="main-content">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
          
            <!-- The slideshow -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="">
              </div>
              <div class="carousel-item">
                <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="">
              </div>
              <div class="carousel-item">
                <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="">
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          
          </div>
          
        <div style="border-bottom:1px solid gray;"></div> 
        <div id="con1">

            <div id="con1-1">
                <br>
                <p align="center" style="font-size:18px;"><b>NEW PRODUCT</b></p>
            </div>
            
            <div id="con1-2">

                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="" width="200" height="200">
                    
                    <p>
                        제주도우유 500ml<br>
                        7,000원
                    </p>
                    </a>
                </div>
                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="" width="200" height="200">
                    
                    <p>
                        제주도우유 500ml<br>
                        7,000원
                    </p>
                    </a>
                </div>
                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="" width="200" height="200">
                    
                    <p>
                        제주도우유 500ml<br>
                        7,000원
                    </p>
                    </a>
                </div>

            </div>
        </div>

        <div id="con2">

            <div id="con2-1">
                <br>
                <p align="center"  style="font-size:18px;"><b>NEW RECEIPE</b></p>
            </div>

            <div id="con2-2">
                
                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="" width="200" height="200">
                    
                    <p>
                        레시피제목<br>
                        레시피작성자
                    </p>
                    </a>
                </div>

                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="" width="200" height="200">
                    
                    <p>
                        레시피제목<br>
                        레시피작성자
                    </p>
                    </a>
                </div>

                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="resources/product_upfiles/나 100_ 그린라벨.png" alt="" width="200" height="200">
                    
                    <p>
                        레시피제목<br>
                        레시피작성자
                    </p>
                    </a>
                </div>


            </div>
        </div>
    </div>
    
</body>
</html>