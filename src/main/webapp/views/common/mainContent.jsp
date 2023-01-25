<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
            /* 안가져감 */
    div{
        box-sizing:border-box;
        /* border:1px solid red; */
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

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
                <img src="img/딸기과즙우유.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img src="img/매일우유 저지방 1%_멸균시리즈.png" alt="">
              </div>
              <div class="carousel-item">
                <img src="img/발효유6.png" alt="">
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
                    <img src="img/milk.jpg" alt="" width="200" height="200">
                    
                    <p>
                        제주도우유 500ml<br>
                        7,000원
                    </p>
                    </a>
                </div>
                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="img/milk.jpg" alt="" width="200" height="200">
                    
                    <p>
                        제주도우유 500ml<br>
                        7,000원
                    </p>
                    </a>
                </div>
                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="img/milk.jpg" alt="" width="200" height="200">
                    
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
                    <img src="img/milk.jpg" alt="" width="200" height="200">
                    
                    <p>
                        레시피제목<br>
                        레시피작성자
                    </p>
                    </a>
                </div>

                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="img/milk.jpg" alt="" width="200" height="200">
                    
                    <p>
                        레시피제목<br>
                        레시피작성자
                    </p>
                    </a>
                </div>

                <div class="thumbnail" align="left">
                    <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                    <img src="img/milk.jpg" alt="" width="200" height="200">
                    
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