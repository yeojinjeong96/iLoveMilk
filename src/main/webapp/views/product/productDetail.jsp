<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
    /* 전체 감싸는 div */
    .pro-outer{
        margin:auto;
        width:700px;
        height:3000px;
    }

    /* 제품 구매 */
    #pro-wrap1{
        width:100%;
        height:20%;
    }

    #pro-wrap1-1{
        width:100%;
        height:10%;
        
    }
    #pro-wrap1-1>a{
       text-decoration:none;
       line-height:40px;
    }

    #pro-wrap1-2{
        width:100%;
        height:10%; 
    }
    #pro-wrap1-2>p{
        line-height:40px;
        padding-left:20px;
        font-weight:550;
    }

    #pro-wrap1-3{
        width:100%;
        height:70%;
        
    }
    #pro-wrap1-3>div{
        float:left;
        width:50%;
        height:100%;

    }
    /* 상품이미지 */
    #pro-1-3-1>img{
        width:90%; 
        height: 90%;
        display:inline-block;
        margin:14px;
    }
    #pro-wrap1-3-2{
        width:50%;
        height:100%;
    }
    #pro-1-3-2-1{
        height:40%;
        padding-top:20px;
    }
    #pro-1-3-2-1 *{
        font-size:20px;
        padding-left:10px;
    }
    #pro-1-3-2-2{
        height:5%;
        border-top:1px solid gray;
    }

    #pro-1-3-2-3{
        height:40%;
        font-size: 13px;
    }
    #proSelect{
        width:100%;
        height:100%;
    }


    #pro-1-3-2-4{
        height:15%;
        position: relative;
    }

    .bi-heart, .bi-heart-fill{
        position: absolute;
        top: 20%;
        left: 3%;
    }
    #btn-buy{
        position: absolute;
        top: 25%;
        left:15%; 
    }
    #pro-wrap1-4{
        width:100%;
        height:10%;       
    }





    /* 상품설명 */
    #pro-wrap2{
        width:100%;
        height:50%;
        padding:20px;
    }
    #pro-info1{
        height:5%;
        width:100%;
    }
    #pro-info1>ul>*{
        float:left;
    }


    #pro-info2{
        height:80%;
        padding-top:10px;
        padding-bottom:10px;    
    }
    #pro-info2>img{
        width:100%;
        height:100%;

    }

    #pro-info3{
        height:15%
    }
    #pro-info3>p{
        height:100%; width:100%;
        margin-left: 10px; 
	    text-indent: -10px;
    }



    /* 리뷰 */
    #pro-wrap3{
        width:100%;
        height:15%;
    }

    #pro-wrap3-1{
            width:100%;
            height:20%;
            
        }
        


        /* 두번째 div */
        #pro-wrap3-2{
            width:100%;
            height:50%;
        }

        #pro-wrap3-2>*{float:left;}

        #pro-wrap3-3{
            width:100%;
            height:30%;
            
        }


    /* 문의 */
    #pro-wrap4{
        width:100%;
        height:15%;
    }

    
        /* 문의 제목 */
        #pro-wrap4-1{
            height:20%;
            width:100%;
        }

        /* 문의 테이블(내용) */
        #pro-wrap4-2{
            height:50%;
            width:100%;
        }
        .pro-qna{
            width:100%;
            text-align: center;

        }

        /* 페이지 */
        #pro-wrap4-3{
            height:20%;
            width:100%;
        }
        /* 전체보기, 문의하기 */
        #pro-wrap4-4{
            height:5%;
            width:100%;
        }
        #pro-wrap4-4>a{
            float:right;
            text-decoration: none;
            height:100%;
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
    <div class="pro-outer">

        <div id="pro-wrap1">

        <div id="pro-wrap1-1" align="left">
            <a href="">HOME &gt;</a>
            <a href="">전체상품</a> <!-- 경로이름 -->
        </div>

        <div id="pro-wrap1-2">
          <p>유통기한임박특가</p>  <!-- 1차 카테고리명 -->
        </div>

        <div id="pro-wrap1-3">
            <div id="pro-1-3-1">
                <img src="img/milk.jpg" alt="" style=" ">
            </div>
            <div id="pro-wrap1-3-2">

                <div id="pro-1-3-2-1">
                   <p>닥터문 150ml</p>  <!-- 제품명 -->
                   
                  <b>31,800</b> 
                </div>

                <!-- 선 집어넣을 div -->
                <div id="pro-1-3-2-2">
                </div>

                <div id="pro-1-3-2-3">
                    <table class="pro-qna">
                        <tr>
                            <td>상품코드</td>
                            <td>코드자리입니다</td>
                        </tr>
                        <tr>
                            <td>제조사</td>
                            <td>제조사자리입니다</td>
                        </tr>
                        <tr>
                            <td>브랜드</td>
                            <td>브랜드자리입니다</td>
                        </tr>
                        <tr>
                            <td>용량</td>
                            <td>용량자리입니다</td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td>
                                <select name="pro-amount" id="pro-amount" style="width:50px;">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    
                </div>

                <div id="pro-1-3-2-4"  align=center>
                    <i class="bi-heart like-btn" style="font-size:2rem;; color: red; cursor: pointer;" data-target="#like-product"  data-toggle="modal" ></i>
                    <button type="submit" id="btn-buy" data-target="#buy-product" data-toggle="modal" style=" width:270px; height:40px;" class="btn btn-outline-primary">바로구매</button>
                   
                </div>

            </div>
        </div>

        <div id="pro-wrap1-4"></div>
        </div>

        <div id="pro-wrap2">
            <div id="pro-info1">
                <ul class="nav nav-tabs nav-justified" role="tablist">
                    <!-- 클릭하면 class속성에 active붙게함 -->
                    <li class="nav-item"><a href="#pro-info2" class="nav-link tab-pane"  data-toggle='tab' >제품상세정보</a> </li>
                    <li class="nav-item"><a href="#pro-wrap3-1" class="nav-link tab-pane" data-toggle='tab'>리뷰</a> </li>
                    <li class="nav-item"><a href="#pro-wrap4-1" class="nav-link tab-pane"  data-toggle='tab'>상품문의</a> </li>
                </ul>
                
            </div>

    
            <div id="pro-info2">
                <img src="img/milk.jpg" alt="">
                <!-- 상품이미지자리 -->
            </div>
                
            <div id="pro-info3">
                <p>제품설명</p>
            </div>
        </div>

        <div id="pro-wrap3">

            <!-- 리뷰 상단 -->
            <div id="pro-wrap3-1">
            
                <div style="font-size:20px; line-height: 70px;"><p><b>상품리뷰</b></p></div>
                
            </div>
            <div style="border-bottom:1px solid gray;"></div> 

            <div id="pro-wrap3-2"> 
                 <!--리뷰내용 -->
                <div>
                    <img src="img/milk.jpg" alt="" style="display:block; width:100px; height:100px; margin:auto;">
                </div>

                <div style="width:590px; height:100px;">
                    <p style="width:100%">제품명
                            <!--조건문 써서 작성자 아니면 신고  -->
                            <a href="" style="float:right;" data-toggle="modal" data-target="#mem-report" >신고</a>
                            <!-- 조건문 써서 작성자일때에는 수정 | 삭제 -->
                            <a href="" style="float:right;">수정</a>   <a href="" style="float:right;">삭제</a>
                    </p> 
                   
                    <div style="height:5%; border-bottom:1px solid gray;"></div>
             
                    <p>별점 <br> 리뷰내용</p>
                </div>

            </div>

        <!-- 페이지 -->
        <div style="border-bottom:1px solid gray;"></div> 

        <div id="pro-wrap3-3" align="center">
            <br>
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

        <div id="pro-wrap4">

            <div id="pro-wrap4-1">
                <div style="font-size:20px; line-height: 70px;"><p><b>상품문의</b></p></div>
            </div>    
             
             <div id="pro-wrap4-2">
                 <table class="table pro-qna" >
                     <tr>
                         <td>번호</td>
                         <td>작성자아이디</td>
                         <td>작성일자</td>
                         <td>문의제목</td>
                         <td>문의내용</td>
                     </tr>
                     <tr>
                         <td>1</td>
                         <td>아이디입니다</td>
                         <td>작성일자입니다</td>
                         <td>제목입니다</td>
                         <td>내용입니다.</td>
                     </tr>
                 </table>
             </div>
     
             <div id="pro-wrap4-3" align="center">
              
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
             <div id="pro-wrap4-4" >
                 <a href="">전체보기</a>
                
                 <a href="">문의하기 &nbsp;</a>
              </div>
        </div>


                <!-- 구매버튼 눌렀을때의 모달 -->
        <!-- The Modal -->
        <div class="modal" id="buy-product">
            <div class="modal-dialog">
            <div class="modal-content modal-sm">
        
                <!-- Modal body -->
                <br>
                <div class="modal-body" style="text-align:center; font-size:13px;">
                    장바구니에 추가되었습니다. <br>
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



                <!-- 찜 -->
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
        
                <!-- 신고사유선택 모달 div -->
                <div class="modal" id="mem-report">
                    <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">신고사유선택</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                
                    <!-- Modal body -->
                    <div class="modal-body">
                    
                    <form action="" method="post">
                            <input type="hidden" name="" value="">
                            <table  style="width:100%; height:150px;">
                                    <tr>
                                        <td><input type="radio" name="report-content" value="광고성게시물"> </td>
                                        <td>광고성 게시물</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="report-content" value="도배 및 중복 게시물"> </td>
                                        <td>도배 및 중복 게시물</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="report-content" value="욕설/비방"> </td>
                                        <td>욕설/비방</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="report-content" value="외설적인 게시물"> </td>
                                        <td>외설적인 게시물</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="report-content" value="기타"> </td>
                                        <td>기타</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <textarea name="" id="" cols="20" rows="2" style=" resize:none" placeholder="신고내용을 입력해주세요(15자 이내)"></textarea>
                                        </td>
                                    </tr>
                            </table>
        
                            <br>
                            <div align="center">
                            <button type="submit" class="btn btn-outline-secondary"  style=" width:200px;">신고하기</button> 
                            <br> 
                            <button type="reset" class="btn btn-outline-secondary"  style=" width:200px;" data-dismiss="modal" >닫기</button>
                            </div>    
                    </form>
                    
                    
                    </div>
                
                    </div>
                </div>
                </div>

    </div>
</body>
</html>