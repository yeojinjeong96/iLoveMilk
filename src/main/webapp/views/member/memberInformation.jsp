<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer_in{
            background: rgb(196, 240, 255);
            width:100%;
            border-radius:10px;
            height:150px;
        }
        #text {width: 230px;}

        .infopop {
        padding: 15px 20px;
        background-color: #d6d6d6;
        border-radius: 5px;
        color: #000000;
        position: absolute;
        display: none;
      }
      .info:hover + .infopop {
        display: block;
      }
      .info{
        background: rgb(16, 108, 255);
        color: white;
        padding-left: 2px;
        font-size: 10px;
        width: 70px;
        height: 15px;
        border-radius: 7px;
        position: relative; top:20px;
      }
    </style>
</head>
<body>
    <br>
    <div class="outer_in">
        

        <table>
            <tr>
                <td width="150px" height="150px" align="center"><img src=<%= loginMember.getProfile() %> width="70"></td>
                <td id="text"><b><%= loginMember.getMemberName() %></b> <br>회원님의 등급은 <b><%= loginMember.getMemberGrade() %></b> 입니다</td>
                <td>
                    
                    <p class="info" align="center">등급혜택보기</p>
                    <div class="infopop">
                        <li>GREEN  : 구매액 2% 적립</li>
                        <li>SILVER : 구매액 4% 적립</li>
                        <li>GOLD&nbsp   : 구매액 6% 적립</li>
                        <li>VIP&nbsp&nbsp&nbsp&nbsp&nbsp : 구매액 8% 적립</li>
                    </div>
                </td>
            </tr>
           

            
        </table>
    </div>
</body>
</html>