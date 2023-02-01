<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .outer{
       width: 1000px; 
   
       height: 1000px;
       box-sizing: border-box; 
       margin:auto;
   }
   .mainmenubar{
       width: 23%;
        
        float: left;
        height: 100%;
        
   }
   
   .mainmember{
       float: left;
       width: 77%;
       
       height: 20%;
   }

   .maincontent{
       width: 77%;
       height: 300px;
       
       float: left;
   }



    <!-- content  -->
       .outer_up{
           width: 700px;
           height: 500px;
          
       }
        
       .reviewheader{font-size: 25px; font-weight: bolder; padding-bottom: 50px;}
       .reviewinformation{font-size: 10px;}
       .reviewTop{padding-bottom: 50px;}
       #rInfoBody{font-size: 15px;}
       .rbtn{
            background: rgb(16, 108, 255);
            border: none;
            border-radius: 20px;
            width: 200px;
            height: 50px;
            font-weight: bold;
            color: white;
       }
   </style>
</head>
<body>	
   
       
            <div class="reviewContent" align="center">
                <table border="1">
                    <tr >
                        <td style="width: 150px; height: 150px;" align="center"> <img src="" alt=""> 사진자리 </td>
                        <td style="width: 300px;">상품이름</td>
                        <td style="width: 100px;" align="center">
                            <button type="button" class = "btn btn-secondary btn-sm" data-toggle="modal" data-target="#reviewInsert">리뷰작성</button>
                        </td>
                        
                        <!-- 
                        <% //if(list.isEmpty()){ %>
                           
                            <tr>
                                <td colspan="3"> 작성할 수 있는 리뷰가 없습니다.</td>
                            </tr>
                        <% //}else{ %>
                           
                            <% //for(Review : list){ %>
                            <tr>
                                <td style="width: 100px;"> <img src="" alt=""> 사진자리 </td>
                                <td style="width: 300px;">상품이름</td>
                                <td style="width: 100px;">
                                    <button type="button" class = "btn btn-secondary btn-sm" data-toggle="modal" data-target="#reviewInsert">리뷰작성</button>
                                </td>
                            </tr>
                            <%// } %>
                        <%// } %>
                        
                        -->
                        
                    </tr>
                </table>

            </div>

                   
                   <!-- 리뷰 작성용 모달 div -->
                       <div class="modal" id="reviewInsert">
                           <div class="modal-dialog">
                             <div class="modal-content">
                         
                               <!-- Modal Header -->
                               <div class="modal-header">
                                 <h4 class="modal-title">리뷰 등록하기</h4>
                                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                               </div>
                         
                               <!-- Modal body -->
                               <div class="modal-body">
                                   <form action="<%=contextPath %>" method="post">
                                       <input type="hidden" name ="memberId" value="<%= memberId %>">
                                      
                                       <table border="1">
                                           <tr>
                                                <td style="width: 100px;"> <img src="" alt=""> 사진자리 </td>
                                                <td style="width: 400px;">상품이름</td>
                                           </tr>
                                           <tr>
                                               <th>상세리뷰</th>
                                               <td>
                                                    <textarea name="content" rows="10" style="resize:none" required></textarea>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th>사진첨부</th>
                                               <td><input type="file" id="reviewPhoto" required></td>
                                           </tr>
                                       </table>
                                       <br>
                                       
                                       <button type="submit" class = "btn btn-secondary btn-sm">리뷰 등록</button>
                                   
                                   </form>
                               </div>
                         
                             </div>
                           </div>
                         </div>
                         
                       
                   
                   
                   </div>
               	</div>
           </div>
           
      
   
   <%@ include file="../common/footer.jsp" %> 	 




  
</body>
</html>