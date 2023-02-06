<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.milk.member.model.vo.Point, java.util.ArrayList" %>

<%
    ArrayList<Point> list = (ArrayList<Point>)request.getAttribute("list");	
	
%>
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
            height:1000px
           
           
        }
        
        .pointserch{border: 1px solid gray; margin-bottom: 50px; padding: 10px;}
		.point-list{ width: 100%;}
		#poimtlist {width: 100%;}

        #pointserch{
            border: none;
            font-size: 10px;
            color: white;
            background-color: rgb(0, 174, 232);
            border-radius: 3px;
            height: 20px;
        }

        .pointTitle{
            font-size: 23px;
            font-weight: bold;


        }
    </style>
</head>
<body>	

	
	
	<%@ include file="../common/header.jsp" %>
	
	
	<div class="outer">

		<div class="mainmenubar" >
			<%@ include file="../common/myPageMenubar.jsp" %> 	
		</div>
				
		<div class="mainmember">
			<%@ include file="../member/memberInformation.jsp" %> 
		</div>
		
		
		<div class="maincontent">
		
			<div class="outer_up">
			
				<div class="pointserch" >
			        <table >
			                <tr >
			                    <td style="height: 50px;">조회기간</td>
			                    <td style="height: 50px;">
			                        <button>1주일</button>
			                        <button>1개월</button>
			                        <button>3개월</button>
			                        <button>6개월</button>
			                    </td>
			                </tr>
			                 <tr>
			                    <td>조회기간</td>
			                    <td>
			                        <form action="">
			                        <input type="date" id="day1" name="day1">
			                        ~
			                        <input type="date" id="day2" name="day2">
			                        <input type="submit" value="기간조회" id="pointserch">
			                        </form>
			                    </td>
			                 </tr>
			            </table>
			        </div>
			        
			        <div class="point-list" style="height:500px; overflow-y: auto;">
			        	
			            <table id="pointlist" border="1px solid gray;">
			                <tr>
			                    <th width="15%">날짜</th>
			                    <th width="10%">구분</th>
			                    <th width="45%">상세내역</th>
			                    <th width="15%">금액</th>
			                    <th width="15%">총금액</th>
			                </tr>
			                
			        <% if(list.isEmpty()){ %>
	                	<div class="thumbnail" align="left">
						조회된 목록이 없습니다.
						</div>
	                <% }else { %>
	                	<% for(Point p : list){ %>
	                		 <tr>
			                    <td><%= p.getModifyDate() %> </td>
			                    <td><%= p.getStatus() %></td>
			                    <td><%= p.getContent() %></td>
			                    <td><%= p.getAmount() %></td>
			                    <td><%= p.getTotal() %></td>
			                </tr>
	                	<%} %>
	                
	            	<%} %>
			                
			               
			            </table>
					</div>
			
			</div>
				
		</div>
			 
	</div>
	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>