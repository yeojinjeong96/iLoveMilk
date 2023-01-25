<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>

        /* 전체 감싸는 div */
        .pro-area{
            width:700px;
            /*추후 조정예정*/
            height:1500px;
        }

        /* 첫번째 div */
        #pro-category{
            width:100%;
            height:10%;
        }

        #pro-category-top{
            height:10%;
            
        }

        #pro-category-center{
            height:90%;
        }

        #pro-category-center>div{
            width:400px;
            height:35px;
            text-align:center;
            background:rgb(235, 234, 234);
            border-radius: 10px;
        }

        /* 1차카테고리 */
        #pro-category-center-1{
            font-size:20px;
            font-weight:900;
            color:rgb(106, 103, 103);
        }
        /* 2차카테고리 */
        #pro-category-center>div>a{
            text-decoration:none;
            color:gray;
            line-height:30px;
            padding:5px;
        }




        /* 두번째 div */
        #pro-seq{
            width:100%;
            height:5%;
            padding-top:30px;
        }
        #pro-seq>select{
           float:right;
        }

        #pro-seq>a{            
            width:100%;
            height:100%;
            text-decoration:none;
            font-size:13px;
            font-weight:550;
            color:rgb(106, 103, 103);
            padding : 5px;
           
        }

        /* 세번째 div */
        #pro-content{
            width:100%;
            height:80%;
            
        }

        .thumbnail{
        width:200px;
        display:inline-block;
        margin:14px;
        position: relative;
        }

        .thumbnail .like-btn, .bi-heart, .bi-heart-fill{
            position: absolute;
            top: 67%;
            left: 85%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            cursor: pointer;
        }



        /* 네번째 div */
        #pro-paging>.paging-area{
            width:100%;
            height:5%;
            
        }
           </style>
    <!-- 좋아요버튼 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 

</head>
<body>

    <div class="pro-area">

        <div id="pro-category">

            <div id="pro-category-top" align="left">
                <a href="">HOME &gt;</a>
                <a href="">우유</a> <!-- 1차 카테고리명 -->
            </div>

            <div id="pro-category-center" align="center">
                <br><br>
                 <p id="pro-category-center-1">우유</p><!-- 1차 카테고리명 -->
                 <div>
                    <a href="">프리미엄 우유</a> <!-- 2차 카테고리명 -->
                    <a href="">백색시유</a>
                    <a href="">가공우유</a>
                    <a href="">멸균우유</a>
                 </div>

            </div>
        </div>

        <div id="pro-seq" align="right">

            
            <a href="">신상품순</a>
            <a href="">판매인기순</a>
            <a href="">상품평순</a>
            <a href="">높은가격순</a>
            <a href="">낮은가격순</a>
            
            <select name="sequence-list" id="">
                <option value="12">12개씩 정렬</option>
                <option value="24">24개씩 정렬</option>
            </select> 
          

        </div>

        <div id="bar" border="1px" style="border-top:1px solid gray;"></div>

        
        <div id="pro-content" >
            <!-- for문사용하여 제품 정보랑 이미지 뽑아서 화면에 출력 (갯수는 정렬 수대로 출력예정) -->

            <div class="thumbnail" align="left">
                
                <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                <img src="img/milk.jpg" alt="" width="200" height="200">
                
                <p>
                    제주도우유 500ml<br>
                    7,000원
                </p>
                </a>
                <i class="bi-heart like-btn" style="font-size:2rem; color: red; cursor: pointer;" data-target="#like-product"  data-toggle="modal" ></i>
                <!-- 로그인 안하고 찜 눌렀을 때 알림창 실행시키고 로그인페이지로 넘어가기 -->

            </div>

            <div class="thumbnail" align="left">
                
                <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                <img src="img/milk.jpg" alt="" width="200" height="200">
               
        <p>
                    제주도우유 500ml<br>
                    7,000원
                </p>
                </a> 
                <i class="bi-heart like-btn" style="font-size:2rem; color: red; cursor: pointer;" data-target="#like-product"  data-toggle="modal"></i>
            </div>
            <div class="thumbnail" align="left">
                
                <a href="" style="color:rgb(113, 113, 113); text-decoration:none;">
                <img src="img/milk.jpg" alt="" width="200" height="200">
                
                <p>
                    제주도우유 500ml<br>
                    7,000원
                </p>
                </a>
                <i class="bi-heart like-btn" style="font-size:2rem; color: red; cursor: pointer;" data-target="#like-product"  data-toggle="modal"></i>
            </div>
            
                   
        </div>

        <!-- 로그인 안했을때의 모달 -->
        <script>

            var i = 0;
            $('i').on('click',function(){
                if(i==0){
                    $(this).attr('class','bi-heart-fill');


                    i++;
                    

                }else if(i==1){
                    $(this).attr('class','bi-heart');
                    $(this).removeAttr('data-target','#like-product');
                    $(this).removeAttr('data-toggle','#modal');
                    i--;
                }
    
            });
    
        </script>

        <div id="pro-paging">
            <div class="paging-area" align="center">
                <!-- 내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 
                <% if(pi.getCurrentPage() != 1){ %>-->
                <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%= pi.getCurrentPage()-1%>';">&lt;</button>
                <!-- <%} %> -->
                

                <!--
                <%for(int p = pi.getStartPage() ; p <= pi.getEndPage() ; p++) { %>-->
                <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=p%>';"><%= p %></button>
                <!-- <% } %> -->
                

                <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 
                <%if(pi.getCurrentPage() != pi.getMaxPage()){ %> -->
                <button onclick="location.href='<%=contextPath %>/list.bo?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <!-- <%} %> -->
                
            </div>
        </div>
    </div>

        <!-- 찜하기 눌렀을때의 모달(로그인했을때) -->
        <!-- The Modal -->
        <div class="modal" id=""  >
            <div class="modal-dialog">
            <div class="modal-content modal-sm">
        
                <!-- Modal body -->
                <br>
                <div class="modal-body" style="text-align:center; font-size:13px;">
                    찜하기목록에 추가되었습니다. <br>
                    해당 페이지로 바로 이동하시겠습니까?
                </div>
                <div align="center">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" style=" width:100px;">확인</button>
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" style=" width:100px;">취소</button>
                    </div>
                    <br>
            </div>
            </div>
        </div>

        <!-- 로그인안했을때의 모달(로그인했을때) -->
        <!-- The Modal -->
        <div class="modal" id="like-product">
            <div class="modal-dialog">
            <div class="modal-content modal-sm">
        
                <!-- Modal body -->
                <br>
                <div class="modal-body" style="text-align:center; font-size:13px;">
                    로그인이 필요한 기능입니다. <br>
                    로그인해주세요
                </div>
                <div align="center">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" style=" width:100px;">확인</button>
                    </div>
                    <br>
            </div>
            </div>
        </div>        
        

</body>
</html>