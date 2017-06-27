<%@page import="com.my.vo.RepBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 보기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){

	  $modi = $("#modi");
	  $modi.click(function(){
		  var $no = $(this).attr('at');
	      console.log($no);
	        var url = 'boardModi.do';
	        $.ajax({ url: url,
	               method :'post',
	               data: {no:$no},
	               success : function(responseData){
	            	   $("body").empty();
	            	   $("body").html(responseData);
	               }//end success
	        });//end ajax
	        return false;
	      })
	      
	      
	      
	      $delete = $("#delete");
		$delete.click(function(){
			  var $no = $(this).attr('at');
		    console.log($no);
		      var url = 'boardDelete.do';
		      $.ajax({ url: url,
		             method :'post',
		             data: {no:$no},
		             success : function(responseData){
		            	alert("삭제완료");
		          	   $("body").empty();
		          	   $("body").html(responseData);
		             }//end success
		      });//end ajax
		      return false;
		    });
		
		
		
		$reply = $("#reply");
		$reply.click(function(){
			  var $no = $(this).attr('at');
			  var $subject = $(this).attr('att');
		    console.log($no);
		      var url = 'boardReply.do';
		      $.ajax({ url: url,
		             method :'post',
		             data: {no:$no, subject:$subject},
		             success : function(responseData){
		          	   $("body").empty();
		          	   $("body").html(responseData);
		             }//end success
		      });//end ajax
		      return false;
		    });
		
		
		
		
		
		
		
		
	 });
</script>
</head>
<body>
<header> 
     <jsp:include page="menu.jsp"></jsp:include>
</header>
   <br><br><br><br>
<div class="container" style="width: 750px; margin: auto;">
<table class="table table-bordered" style="width: 700px">
    <%RepBoard list =(RepBoard) request.getAttribute("list"); %>
    
    
        <form method="post" encType="multiplart/form-data">

    <tbody>
			<tr>
                <th style="width: 100px; text-align: center;" > 
                  <div style="text-align: center; display:inline-block" ><strong >제목 :</strong></div> 
                  <td>   <strong style="text-align: center;"><%=list.getSubject() %></strong>
                  <span class="pull-right" style="display:inline-block"><%=list.getDate()%></span>  </td>
                </th>
            </tr>
            <tr>
                <th style="width: 100px; text-align: center; vertical-align: middle;">내용: </th>
                <td class="form-control" style="height: 400px"><%=list.getContent() %></td>
            </tr>
            <tr>
                <th style="width: 100px; text-align: center;">첨부파일: </th>
                <td><input type="Button" value="보기" name="filename"/>  선택된 파일 없음.</td> 
            </tr>
            <tr>                
            </tr>
            <tr>
                <td colspan="2"> 
                	<%String msg = (String)request.getAttribute("msg"); %>
                	<%if (msg == "1"){ %>
                    <div style="display:inline-block; margin-right: 5px; float: right;"><input type="button" value="삭제" id="delete" at="<%=list.getNo()%>"/></div>　
                    <input type="button" value="목록" class="pull-left" onclick="javascript:location.href='boardList.do'"/>　
                    <div style="display:inline-block; margin-right: 5px; float: right;"> <input type="button" value="답글" id="reply" at="<%=list.getNo()%>" att="<%=list.getSubject()%>"/></div>
                     <div style="display:inline-block; margin-right: 5px; float: right;"><input type="button" value="수정" id="modi" class="pull-right" at="<%=list.getNo()%>" /></div>
                    <%} else if (msg == "2") {%>
                    <input type="button" value="목록" class="pull-left" onclick="javascript:location.href='boardList.do'"/>
                    <input type="button" value="답글" id="reply" class="pull-right" at="<%=list.getNo()%>" att="<%=list.getSubject()%>"/>
                    <%} %>
                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
                </td>
            </tr>
    </tbody>
            </form>
    
</table>
</div>
</body>
</html>


