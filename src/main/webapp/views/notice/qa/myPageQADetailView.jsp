<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.milk.notice.model.vo.QA, com.milk.notice.model.vo.Attachment" %>
<% 
	QA q= (QA)request.getAttribute("q");
	Attachment at = (Attachment)request.getAttribute("at");
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
		height: 1300px;
		
		float: left;
	}
    .question-area td div{
        height: 100%;
    
        text-align: left;
        box-sizing: border-box;
        padding: 10px;
    }
    #content-area{height: 100%;
    text-align: left;
    padding: 10px;}
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

		<div class="maincontent" align="center">
			<h4 align="left">나의 1:1 문의 </h4>
            <hr>
            <br>
            <table class="question-area text-center table" style="width: 700px;">
                <tr >
                    <td colspan="3">[<%=q.getfCategory() %>/<%=q.getsCategory() %>]&nbsp;<%=q.getqTitle() %></td>
                             
                    <td  rowspan="2" style="vertical-align: middle;">
                    	  <%if(q.getAnswerStatus().equals("Y")){ %>
	                   	답변완료
	                   	<%}else{ %>
	                   	접수
	                   	<%} %>
                    </td>

                </tr>
                <tr>
                    <td colspan="2"><%=q.getMemberName() %></td>
              
                    <td colspan="1" ><%=q.getEnrollDate() %></td>   
                </tr>
                <tr>
                    <td colspan="5" height="200">
                        <div>
                            
                            <%if(at!=null) {%>
        
                                <img src="<%=contextPath%>/<%=at.getFilePath()%><%=at.getChangeName()%>" width="300px" height="300px"   >
                                <br>
                             <%} %>
                             
                            <%=q.getqContent() %>

                        </div>
	                   </td>             
                </tr>

            </table>

            <br><br>
            <!--답변 미완료시-->
              <%if(q.getAnswerStatus().equals("N")){ %>
            <div align="center">
                <a href="<%=contextPath %>/delete.q?qNo=<%=q.getqNo()%>" class="btn btn-sm btn-secondary">삭제</a>
                <a href="<%=contextPath%>/updateForm.qa?qNo=<%=q.getqNo() %>" class="btn btn-sm btn-secondary">수정</a>
                <a href="<%=contextPath %>/mypage.qa?cpage=1" class="btn btn-sm btn-secondary">목록</a>
            </div>
            <%}else{ %>
            <!--답변완료시-->
            <br>
            <div class="answer-area text-center" style="width: 700px;">
                <table  style="width: 700px;" class="table">
                    <tr>
                        <td colspan="2"><%=q.getaTitle() %></td>
                    
                    </tr>
                    <tr>
                        <td><%=q.getManagerName() %></td>
                        <td><%=q.getAnswerDate() %></td>
                    </tr>
                    <tr>
                        <td colspan="2" height="200" style="align-items: left;">
                            <div id="content-area">
                                <%=q.getaContent()%>
                            </div>
                        </td>
            
                    </tr>
                </table>
                <br><br>
                <button type="button" class="btn btn-sm btn-primary" onclick=location.href="<%=contextPath%>/mypage.qa?cpage=1">목록으로</button>

            </div>
            <%} %>
         </div>  
       
	</div>
	<br clear="both">
<%@ include file="/views/common/footer.jsp" %> 	 
</body>
</html>