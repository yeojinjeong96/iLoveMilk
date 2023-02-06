<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content{height: 500px;}
    .content-1{
		margin-top: 50px;
		margin-left: 200px;
		box-sizing: border-box;
		float:left;
	}
	.content-2{
		margin-top: 100px;
		margin-left: 50px;
		box-sizing: border-box;
		float:left;
	}
	.content-2 input{height: 60px; width: 250px; margin-top: 10px;}
	.btnLogin{float: left; margin-left: 6px;}
	.btnLogin>button{width: 115px;}

	/* modal */
	#email, #phone{width: 20px; height: 15px;}
</style>
</head>
<body>
	<%@ include file="../common/managerHeader.jsp" %>

	<div class="wrap" align="center">
		<div class="outer">
			<div class="content">
				<br><br>
				<div class="content-1">
					<a href="<%= contextPath %>"><img src="resources/images/logo.jpg" width="250px"></a>
				</div>
				<div class="content-2">
					<form action="<%= contextPath %>/login.ma" method="post">
						<div><input type="text" id="managerId" name="managerId" placeholder="아이디" required></div>
						<div><input type="password" id="managerPwd" name="managerPwd" placeholder="비밀번호" required></div><br>
						<div class="content-3">
							<div class="btnLogin"><button type="submit" class="btn btn-primary btn-lg">로그인</button></div>
							<div class="btnLogin"><button type="button" id="modalIdFindBtb1" class="btn btn-secondary btn-lg" data-toggle="modal" data-target="#modalIdFind1">ID 찾기</button></div>
						</div>
					</form>
					
					<!-- 아이디 찾기 모달1 시작 -->
					<div class="container mt-3">
						<!-- The Modal -->
					   	<div class="modal fade" id="modalIdFind1">
					       	<div class="modal-dialog">
						       	<div class="modal-content">
						       	
						       		<div id="output">
							      	 	<!-- Modal Header -->
							       		<div class="modal-header">
							           		<h4 class="modal-title">아이디 찾기</h4>
							            	<button type="button" class="close" data-dismiss="modal">×</button>
							         	</div>
							         	<!-- Modal body -->
							         	<div class="modal-body" align="center">
						            		<table>
						                  		<tr>
						                     		<td width="100px">
						                        		<input type="radio" id="email" name="idFind" value="email" checked onclick="inputShow();">
						                        		<label for="email">이메일로 찾기</label>
						                     		</td>
						                  		</tr>
						                  		<tr>
						                     		<td>
						                        		<input type="radio" id="phone" name="idFind" value="phone" onclick="inputShow();">
						                       	 	<label for="phone">핸드폰으로 찾기</label>
						                     		</td>
						                  		</tr>
						                  		<tr>
						                     		<td>
						                        		<br>
						                        		<input type="text" placeholder="이름" name="managerName" required>
						                     		</td>
						                  		</tr>
						                  		<tr>
						                     		<td>
						                        		<input type="email" id="findVal" placeholder="이메일" name="email" required>
						                     		</td>
						                  		</tr>
						               		</table>
						
	<script>
		function inputShow(){
		  	if($("#email").is(":checked")){
		     	$("#findVal").attr('type', 'email');
		     	$("#findVal").attr('placeholder', '이메일');
		     	$("#findVal").attr('name', 'email');
		  	}else{
		  		$("#findVal").attr('type', 'text');
		     	$("#findVal").attr('placeholder', '핸드폰 번호 - 제외하고 입력');
		     	$("#findVal").attr('name', 'phone');
		  	}
		}
		
		function ajaxIdControll1(){
			$.ajax({
				url:"<%= contextPath %>/find.ma?",
				data:{},
				method:"post",
				success:function(){},
				error:function(){}
			});
		}
	</script>
							
							               	<br><br>
							               	<button type="button" id="modalIdFindBtb2" class="btn btn-primary" onclick="ajaxIdControll1();">다음</button>
							            </div>
							      	</div>
							      	
						      		<!-- Modal footer -->
						      		<div class="modal-footer">
						        		<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						      		</div>
						       	</div>
						    </div>
					    </div>
					</div>
					<!-- 아이디 찾기 모달1 종료 -->
					
					
					<!-- 아이디 찾기 모달2 시작 -->
					<div class="container mt-3">
						<!-- The Modal -->
					   	<div class="modal fade" id="modalIdFind2">
					       	<div class="modal-dialog">
						       	<div class="modal-content">
						      	 	<!-- Modal Header -->
						       		<div class="modal-header">
						           		<h4 class="modal-title">아이디 찾기</h4>
						            	<button type="button" class="close" data-dismiss="modal">×</button>
						         	</div>
						         	<!-- Modal body -->
						         	<div class="modal-body" align="center">
						            	<form action="" method="post">
						               		<table>
						                  		
						               		</table>
						
							                <script>
							                   	
							                </script>
							
							               	<br><br>
							               	<button type="submit" id="modalIdFindBtb3" class="btn btn-primary" data-toggle="modal" data-target="#modalIdFind3">다음</button>
							            </form>
						      		</div>
						      		<!-- Modal footer -->
						      		<div class="modal-footer">
						        		<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						      		</div>
						       	</div>
						    </div>
					    </div>
					</div>
					<!-- 아이디 찾기 모달2 종료 -->
					<!-- 아이디 찾기 모달3 시작 -->
					<div class="container mt-3">
						<!-- The Modal -->
					   	<div class="modal fade" id="modalIdFind3">
					       	<div class="modal-dialog">
						       	<div class="modal-content">
						      	 	<!-- Modal Header -->
						       		<div class="modal-header">
						           		<h4 class="modal-title">아이디 찾기</h4>
						            	<button type="button" class="close" data-dismiss="modal">×</button>
						         	</div>
						         	<!-- Modal body -->
						         	<div class="modal-body" align="center">
						            	<form action="" method="post">
						               		<table>
						                  		
						               		</table>
						
							                <script>
							                   	
							                </script>
							
							               	<br><br>
							               	<button type="submit" id="modalPwdFindBtb1" class="btn btn-primary" data-toggle="modal" data-target="#modalPwdFind1">PWD 찾기</button>
							            </form>
						      		</div>
						      		<!-- Modal footer -->
						      		<div class="modal-footer">
						        		<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						      		</div>
						       	</div>
						    </div>
					    </div>
					</div>
					<!-- 아이디 찾기 모달3 종료 -->
					<!-- 비밀번호 찾기 모달1 시작 -->
					<div class="container mt-3">
						<!-- The Modal -->
					   	<div class="modal fade" id="modalPwdFind1">
					       	<div class="modal-dialog">
						       	<div class="modal-content">
						      	 	<!-- Modal Header -->
						       		<div class="modal-header">
						           		<h4 class="modal-title">비밀번호 찾기</h4>
						            	<button type="button" class="close" data-dismiss="modal">×</button>
						         	</div>
						         	<!-- Modal body -->
						         	<div class="modal-body" align="center">
						            	<form action="" method="post">
						               		<table>
						                  		
						               		</table>
						
							                <script>
							                   	
							                </script>
							
							               	<br><br>
							               	<button type="submit" id="modalPwdFindBtb2" class="btn btn-primary" data-toggle="modal" data-target="#modalPwdFind2">다음</button>
							            </form>
						      		</div>
						      		<!-- Modal footer -->
						      		<div class="modal-footer">
						        		<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						      		</div>
						       	</div>
						    </div>
					    </div>
					</div>
					<!-- 비밀번호 찾기 모달1 종료 -->
					<!-- 비밀번호 찾기 모달2 시작 -->
					<div class="container mt-3">
						<!-- The Modal -->
					   	<div class="modal fade" id="modalPwdFind2">
					       	<div class="modal-dialog">
						       	<div class="modal-content">
						      	 	<!-- Modal Header -->
						       		<div class="modal-header">
						           		<h4 class="modal-title">비밀번호 찾기</h4>
						            	<button type="button" class="close" data-dismiss="modal">×</button>
						         	</div>
						         	<!-- Modal body -->
						         	<div class="modal-body" align="center">
						            	<form action="" method="post">
						               		<table>
						                  		
						               		</table>
						
							                <script>
							                   	
							                </script>
							
							               	<br><br>
							               	<button type="submit" id="modalPwdFindBtb3" class="btn btn-primary" data-toggle="modal" data-target="#modalPwdFind3">다음</button>
							            </form>
						      		</div>
						      		<!-- Modal footer -->
						      		<div class="modal-footer">
						        		<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						      		</div>
						       	</div>
						    </div>
					    </div>
					</div>
					<!-- 비밀번호 찾기 모달2 종료 -->
					<!-- 비밀번호 찾기 모달3 시작 -->
					<div class="container mt-3">
						<!-- The Modal -->
					   	<div class="modal fade" id="modalPwdFind3">
					       	<div class="modal-dialog">
						       	<div class="modal-content">
						      	 	<!-- Modal Header -->
						       		<div class="modal-header">
						           		<h4 class="modal-title">비밀번호 찾기</h4>
						            	<button type="button" class="close" data-dismiss="modal">×</button>
						         	</div>
						         	<!-- Modal body -->
						         	<div class="modal-body" align="center">
						            	<form action="" method="post">
						               		<table>
						                  		
						               		</table>
						
							                <script>
							                   	
							                </script>
						         		</form>
						      		</div>
						      		<!-- Modal footer -->
						      		<div class="modal-footer">
						        		<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						      		</div>
						       	</div>
						    </div>
					    </div>
					</div>
					<!-- 비밀번호 찾기 모달3 종료 -->
					
				</div>
			</div>
		</div>
		<br><br><br><br><br>
	</div>
</body>
</html>