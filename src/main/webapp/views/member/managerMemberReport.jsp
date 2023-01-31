<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>

    .mem-wrap{
        width:800px;
        padding-left:50px;    
        
        height:300px;
        margin:auto;
        float:left;
        box-sizing: border-box;
    }
    #mem-1{
        width:100%;
        height:30%;
        padding-left:10px;
    }
    #mem-1>*{float:left;}
    #mem-2{
        width:100%;
        height:40%;
    }
    #mem-3{
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
    
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="../common/managerHeader.jsp" %>
    <%@ include file="../common/managerMenubar.jsp"%>

    <div class="wrap1" align="center">    
        <div class="mem-wrap">
                    <div id="mem-1" >
                        <div style="width:100px; height:100%">
                    <p  style="font-size:20px; line-height: 90px;"><b>신고관리</b></p>  
                    </div>
                    <br><br>
                    <div align="right" style="width:630px;">
                            <input type="text" name = "searchReport" required><button type="submit"  style="border:none" >검색</button>
                        </div>
                    </div>
                    <div id="mem-2">
                        <table class="table member-report" style="width:100%; font-size:10px; text-align:center;">
                            <tr>
                                <td>번호</td>
                                <td>신고일</td>
                                <td>신고내용</td>
                                <td>아이디</td>
                                <td>신고지</td>
                                <td></td>

                            </tr>
                            <tr>
                                <td>1</td>
                                <td>23-01-01 00:00</td>
                                <td>재수없어요</td>
                                <td>아이디자리</td>
                                <td>신고자아이디</td>
                                <td>
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#report-delete">삭제</button>
                                </td>

                            </tr>
                        </table>
                    </div>
                    <div id="mem-3">
                        <div align="right" style="width:690px">
                            <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#report-mngm">신고회원관리</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#blacklist-view">블랙리스트조회</button>
                    </div>    
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

                    <!-- 신고내역 삭제 눌렀을때의 모달 -->
                    <!-- The Modal -->
                    <div class="modal" id="report-delete"  >
                        <div class="modal-dialog">
                        <div class="modal-content modal-sm">
                    
                            <!-- Modal body -->
                            <br>
                            <div class="modal-body" style="text-align:center; font-size:13px;">
                                해당 신고내역을 삭제하시겠습니까?
                            </div>
                            <div align="center">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" style=" width:100px;">확인</button>
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" style=" width:100px;">취소</button>
                                </div>
                                <br>
                        </div>
                        </div>
                    </div>


                    <!-- 신고회원관리 모달 div -->
                    <div class="modal" id="report-mngm">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">신고 회원 관리</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                    
                        <!-- Modal body -->
                        <div class="modal-body">
                        
                        <form action="" method="post">
                                <input type="hidden" name="" value="">
                                <table style="width:100%; height:100px;">
                                        <tr>
                                            <td>아이디</td>
                                            <td>아이디자리</td>
                                        </tr>
                                        <tr>
                                            <td>누적 신고 횟수</td>
                                            <td><b>횟수</b></td>
                                        </tr>
                                        <tr>
                                            <td>회원 등급</td>
                                            <td>등급자리</td>
                                        </tr>
                                        
                                </table>

                                <br>
                                <div align="center">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#point-change">적립금변경</button>
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#blacklist-add">블랙리스트추가</button>
                                </div>

                        </form>
                        
                        
                        </div>
                    
                        </div>
                    </div>
                    </div>

                    <!-- 블랙리스트추가 모달 div -->
                    <div class="modal" id="blacklist-add">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">블랙리스트 추가</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                    
                        <!-- Modal body -->
                        <div class="modal-body">
                        
                        <form action="" method="post">
                                <input type="hidden" name="" value="">
                                <table style="width:100%; height:100px;" >
                                        <tr>
                                            <td>아이디</td>
                                            <td>아이디자리</td>
                                        </tr>
                                        <tr>
                                            <td>사유</td>
                                            <td> <input type="text" name="content"></td>
                                        </tr>
                                        <tr>
                                            <td>날짜
                                            <td>날짜자리</td>
                                        </tr>
                                </table>

                                <br>
                                <div align="center">
                                <button type="submit" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#blacklist-confirm">확인</button> <button type="reset" class="btn btn-outline-secondary btn-sm"  data-dismiss="modal" >취소</button>
                                </div>
                        </form>
                        
                        
                        </div>
                    
                        </div>
                    </div>
                    </div>
                    
                    <!-- 블랙리스트 확인 눌렀을때의 모달 -->
                    <!-- The Modal -->
                    <div class="modal" id="blacklist-confirm" >
                        <div class="modal-dialog">
                        <div class="modal-content modal-sm">
                    
                            <!-- Modal body -->
                            <br>
                            <div class="modal-body" style="text-align:center; font-size:13px;">
                                해당회원을 블랙리스트에 <br>
                                추가하시겠습니까?
                            </div>
                            <div align="center">
                                <<button type="submit" class="btn btn-outline-secondary btn-sm" style=" width:100px;">확인
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal" style=" width:100px;">취소</button>
                                </div>
                                <br>
                        </div>
                        </div>
                    </div>


                    <!-- 적립금변경 모달 div -->
                    <div class="modal" id="point-change">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">적립금 변경</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                    
                        <!-- Modal body -->
                        <div class="modal-body">
                        
                        <form action="" method="post">
                                <input type="hidden" name="" value="">
                                <table  style="width:100%; height:150px;">
                                        <tr>
                                            <td>아이디</td>
                                            <td>아이디자리</td>
                                        </tr>
                                        <tr>
                                            <td>구분</td>
                                            <td> <input type="radio" name="status" value="Y"> 적립금 지급 <input type="radio" name="status" value="N"> 적립금 차감 </td>
                                        </tr>
                                        <tr>
                                            <td>적립금</td>
                                            <td><input type="number"></td>
                                        </tr>
                                        <tr>
                                            <td>사유</td>
                                            <td><input type="text"></td>
                                        </tr>
                                        
                                </table>

                                <br>
                                <div align="center">
                                <button type="submit" class="btn btn-outline-secondary btn-sm">확인</button> <button type="reset" class="btn btn-outline-secondary btn-sm"  data-dismiss="modal" >취소</button>
                                </div>    
                        </form>
                        
                        
                        </div>
                    
                        </div>
                    </div>
                    </div>
                    

                    <!-- 블랙리스트 조회 모달 div -->
                    <div class="modal" id="blacklist-view">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">블랙리스트 조회</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                    
                        <!-- Modal body -->
                        <div class="modal-body">
                        
                        <form action="" method="post">
                                <input type="hidden" name="" value="">
                                

                                <input type="text" name = "" ><button type="submit"  style="border:none">검색</button>

                                <br><br>

                                <table style="width:100%; height:100px; text-align: center;"class="table">
                                    <tr>
                                        <td><input type="checkbox" name="" value=""></td>
                                        <td>번호</td>
                                        <td>아이디</td>
                                        <td>사유</td>
                                        <td>제재일</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="" value=""></td>
                                        <td>1</td>
                                        <td>아이디자리</td>
                                        <td>욕설</td>
                                        <td>23-01-01 00:00</td>
                                    </tr>

                                </table>
                                <!--
                                <div class="paging-area">
                                    내가 보고있는 페이지가 1번 페이지가 아닐때에만 나타내기 
                                    
                                                <% if(pi.getCurrentPage() != 1){ %>
                                                    <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                                                <% } %>
                                    
                                                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                                                    <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=p%>';"><%= p %></button>
                                                <% } %>-->
                                    <!--  내가 보고있는 페이지가 마지막 페이지가 아닐 때에만 나타내기 
                                    
                                                <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
                                                    <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                                                <% } %>-->
                                </div>

                        </form>
                        
                        
                    </div>
                    
                 </div>
             </div>
        </div>
    </div>
</body>
</html>