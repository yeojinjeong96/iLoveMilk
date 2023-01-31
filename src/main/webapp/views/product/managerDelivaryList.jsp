<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
        /* 안가져감 */
        div{border:1px solid red;}
    
        .delivery-wrap{
            width:800px;
            padding-left:50px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }
        #delivery-1{
            width:100%;
            height:40%;
            padding-left:10px;
        }
        #delivery-1>*{float:left;}
        #delivery-2{
            width:100%;
            height:30%;
        }
        #delivery-3{
            width:100%;
            height:30%;
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
        <%@ include file="../common/managerHeader.jsp" %>
        <%@ include file="../common/managerMenubar.jsp"%>
        <div class="wrap1" align="center">
            <div class="delivery-wrap">
                <div id="delivery-1" >
                <p  style="font-size:20px; line-height: 90px;"><b>배송관리</b></p>  
                <br> 
                <div align="left" style="width:680px;font-size: 13px;">
                <b> 조회기간 </b>
                    <button class="btn btn-outline-secondary btn-sm">오늘</button>
                    <button class="btn btn-outline-secondary btn-sm">1주일</button>
                    <button class="btn btn-outline-secondary btn-sm">1개월</button>
                    <button class="btn btn-outline-secondary btn-sm">3개월</button>
                    <input type="date" name = "searchDate1" > - <input type="date" name = "searchDate1" >
                </div>
                
                <div align="left" style="width:680px;font-size: 13px;">
                    <br>
                    <b>구분</b>
                    <select name="delivery-option" id="delivery-option" style="font-size: 13px;">
                        <option value="1">배송전</option>
                        <option value="2">배송중</option>
                        <option value="3">배송완료</option>
                    </select>
                        
                    </div>
                </div>
                <div id="delivery-2">
                    <table class=" table purchase-list" style="width:100%; font-size:13px; text-align:center;">
                        <tr>
                            <td>번호</td>
                            <td>주문번호</td>
                            <td>주문일자</td>
                            <td>회원아이디</td>
                            <td>배송상태</td>
                            <td>주소</td>
                            <td>운송장</td>
                        </tr>
                        <!-- 더블클릭 시 결제내역 상세 보이도록 한다 -->
                        <tr>
                            <td>1</td>
                            <td>20230101-1234567</td>
                            <td>23-01-01</td>
                            <td>회원아이디자리</td>
                            <td>배송전</td>
                            <td>서울시 금천구...</td>
                            <td>
                                <!-- 조건문 사용해서 운송장 완료하면 버튼비활성화시키기 -->
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#delivery-info">대기</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="delivery-3">  
                    <div class="paging-area">
                        <!-- 내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 
                        
                                    <% if(pi.getCurrentPage() != 1){ %>
                                        <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                                    <% } %>
                        
                                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                                        <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=p%>';"><%= p %></button>
                                    <% } %>-->
                        <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 
                        
                                    <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>-->
                                        <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                                    <% } %>
                    </div>
                    
                </div>
        
        
                <!-- 신고회원관리 모달 div -->
                <div class="modal" id="delivery-info">
                    <div class="modal-dialog">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">운송장 발급하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                
                    <!-- Modal body -->
                    <div class="modal-body">
                    
                    <form action="" method="post">
                            <input type="hidden" name="" value="">
                            <table style="width:100%;">
                                    <tr>
                                        <td>주문번호</td>
                                        <td>20230101-1234567</td>
                                    </tr>
                                    <tr>
                                        <td>주문일자</td>
                                        <td>23-01-01 00:00:00</td>
                                    </tr>
                                    <tr>
                                        <td>구매자명</td>
                                        <td>구매자이름자리</td>
                                    </tr>
                                    <tr>
                                        <td>받는사람</td>
                                        <td>받는사람이름자리</td>
                                    </tr>
                                    <tr>
                                        <td>주소</td>
                                        <td>서울시 금천구 ..</td>
                                    </tr>
                                    <tr>
                                        <td>택배사</td>
                                        <td><input type="text" name="courier" placeholder="내용을 입력해주세요"></td>
                                    </tr>
                                    <tr>
                                        <td>운송장번호</td>
                                        <td><input type="text" name="waybill" placeholder="내용을 입력해주세요"></td>
                                    </tr>
                                    
                            </table>
        
                            <br>
                            <div align="center">
                            <button type="submit" class="btn btn-outline-secondary btn-sm">발급하기</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" >취소</button>
                            </div>
                    </form>
                    
                    
                    </div>
                
                    </div>
                </div>
                </div>
        
            </div>
        </div>    
    </body>
    </html>
    