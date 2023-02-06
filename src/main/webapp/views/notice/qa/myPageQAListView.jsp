<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.ArrayList, com.milk.notice.model.vo.QA, com.milk.common.model.vo.PageInfo" %>
<% ArrayList<QA>list =(ArrayList<QA>) request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
	 .dateBtn{
        border: 0;
        outline: 0;
        background-color: transparent;
    }
    
	#qa-list tbody tr:hover{cursor: pointer;}
    #qa-list tr{  
        overflow: hidden;
        width: 100px;
   		 white-space: nowrap ;
        text-overflow: ellipsis;   }
     .select-area a{
        color:black;
        text-decoration: none;
    }
    .paging-area{
     margin-top: ;
    }
 </style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div class="outer">

		<div class="mainmenubar" >
			<%@ include file="/views/common/myPageMenubar.jsp" %> 	
		</div>
				
		<div class="mainmember">
			<%@ include file="/views/member/memberInformation.jsp" %>
		</div>

		<div class="maincontent">
			<h4 align="left">나의 1:1 문의 </h4>
            <hr>
            <br>
            <form action="<%=contextPath%>/mypage.qa" method="get">
        
                <div class="select-area" align="left" >        
                    조회기간&nbsp;
                    <button type="button" name="dateBtn" value="0" class="dateBtn">오늘</button>&nbsp;
                    <button type="button" name="dateBtn" value="7" class="dateBtn">7일</button>&nbsp;
                    <button type="button" name="monthBtn" value="1" class="dateBtn">1개월</button>&nbsp;
                    <button type="button" name="monthBtn" value="3" class="dateBtn">3개월</button>&nbsp;
                    <button type="button" name="dateBtn" value="365" class="dateBtn">1년</button>&nbsp;
                    
					<input type="date" name="fDate" id="fDate"> -
                    <input type="date" id="sDate" name="sDate" >  
                    <input type="hidden" id="cpage" name="cpage" value=1>
                   
                    <button type="submit" class="btn btn-sm btn-secondary">조회</button>
                </div>
			
            </form>
            <br>
            <table align="center"id="qa-list" class="text-center table">
                <tr class="thead-light">
                    <th width="100" height="30">문의날짜</th>
                    <th width="190">카테고리</th>
                    <th width="350" >제목</th>
                    <th width="100">문의상태</th>
                </tr>
				<%if(list.isEmpty()){ %>
                <!--게시글 없을경우-->
                
                <tr>
                    <td colspan="4">
                        작성된 문의사항이 없습니다.
                    </td>
                </tr>
                <%}else{ %>
                <%for(QA q:list){ %>
                <tbody>
                <tr>  
                	<td style="display:none"><%=q.getqNo() %></td>              	
                    <td height="40"><%=q.getEnrollDate() %></td>
                    <td>[<%=q.getfCategory() %>/<%=q.getsCategory() %>]</td>
                    <td><%=q.getqTitle() %></td>
                    <td>
                		  <%if(q.getAnswerStatus().equals("Y")){ %>
	                   	답변완료
	                   	<%}else{ %>
	                   	접수
	                   	<%} %>
                    </td>
                </tr>
                </tbody>
				<%}} %>
				
            </table>
           
            <br>
            <div class="paging-area" align="center">
                <%if(pi.getCurrentPage()!=1){ %>
                    <button class="btn-sm btn btn-primary" onclick="location.href='<%=contextPath%>/mypage.qa?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <%} %>   
                <%for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                    <button class="btn-sm btn btn-primary" onclick="location.href='<%=contextPath%>/mypage.qa?cpage=<%=p%>';"><%=p %></button>
                <%} %>
                <%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
                    <button class="btn-sm btn btn-primary" onclick="location.href='<%=contextPath%>/mypage.qa?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <%} %>
            </div>
        </div>
        
	
	</div>
	
	
	<%@ include file="/views/common/footer.jsp" %> 	 
    
	 <script>
		$(function(){
			$("#qa-list tbody tr").click(function(){
				location.href='<%=contextPath%>/mypage.dq?no='+$(this).children().eq(0).text();
			})
			

	    	$("button[name=dateBtn]").click(function(){
	    		var date = new Date();
	    		var yyyy = date.getFullYear();
	    		var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	    		var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	    		document.getElementById('sDate').valueAsDate = new Date();
	    		
	    		
	    		var fDate = new Date();
	    		var fDateValue = new Date(fDate.setDate(fDate.getDate()-$(this).val()));
	    		document.getElementById('fDate').valueAsDate = new Date(fDateValue);
	    	
	    	})
	    	
	    	
	    	$("button[name=monthBtn]").click(function(){
	    		var fDate = new Date();
	    		var fDateValue = new Date(fDate.setMonth(fDate.getMonth()-$(this).val()));
	    		document.getElementById('fDate').valueAsDate = new Date(fDateValue);
	    		document.getElementById('sDate').valueAsDate = new Date();
	    	})
	    	
	    	const urlParams = new URL(location.href).searchParams;

	    	const fDate = urlParams.get('fDate');
	    	const sDate = urlParams.get('sDate');
	    	if(fDate!=null&& sDate!=null){
	    		
	    		document.getElementById('fDate').valueAsDate = new Date(fDate);
	    		document.getElementById('sDate').valueAsDate = new Date(sDate);
	    	}
	    	
	    	
	    
			 $("button[name=searchBtn]").click(function(){
				const searchType= $("select[name=searchType]").val();
				const searchKey = $("input[name=searchKey]").val();
				
				location.href="<%=contextPath%>/myPage.qa?cpage=1&searchtype="+searchType+"&searchkey="+searchKey;
				
			 })

		})
	</script>
</body>
</html>