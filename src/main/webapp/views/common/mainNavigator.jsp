<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
   
        .allmenu-wrap{
            border:1px solid cornflowerblue;
            /*나중에 빼기*/
            margin-top:50px;
            width: 700px;
            height:170px;
        }

        .all-menu{
            list-style-type:none;
            padding-left:8px;
            margin:0;
            width:100%;
            height:10%;
            
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
            /*border:1px solid orange; */
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

       
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
</head>
<body>

    <div class="allmenu-wrap">
        <!-- 해당 카테고리값들은 반복문을 통해 만들어짐 -->
            <ul class="all-menu">
                <li><a href="">우유</a> <!-- 카테고리 -->
                    <br>
                    <div style="border:1px solid gray; width:110px"></div>
                    <br>
                    <ul>
                        <li><a href="">백색시유</a></li> <!--참조 카테고리-->
                        <li><a href="">가공우유</a></li>
                        <li><a href="">멸균우유</a></li>

                    </ul>
                </li>
                <li><a href="">발효유</a>
                    <br>
                    <div style="border:1px solid gray; width:110px"></div>
                    <br>
                    <ul>
                        <li><a href="">발효유</a></li>
                    </ul>
                </li>
                <li><a href="">치즈</a>
                    <br>
                    <div style="border:1px solid gray; width:110px"></div>
                    <br>
                    <ul>
                        <li><a href="">치즈</a></li>

                    </ul>
                </li>
                <li><a href="">락토프리</a>
                    <br>
                    <div style="border:1px solid gray; width:110px"></div>
                    <br>
                    <ul>
                        <li><a href="">락토프리우유</a></li>
                    </ul>
                </li>
                <li><a href="">레시피</a>
                    <br>
                    <div style="border:1px solid gray; width:110px"></div>
                    <br>
                    <ul>
                        <li><a href="">추천레시피</a></li>
                        <li><a href="">자유게시판</a></li>
                    </ul>
                </li>
            </ul>
       
       
    </div>
</body>
</html>