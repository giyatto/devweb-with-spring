<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="./commons/_head.jspf" %>

</head>
<body>
   
   <%@ include file="./commons/_top.jspf" %>

	<div class="container">
		<div class="row">
			<div class="span12">
				<section id="typography">
				<div class="page-header">
					<c:choose>
					<c:when test="${empty user.userId}">
					<h1>회원가입</h1>
					</c:when>
					<c:otherwise>
					<h1>개인정보수정</h1>
					</c:otherwise>
					</c:choose>
				</div>
				
				<c:set var="actionUrl" value="/users/create" />
				<c:if test="${not empty user.userId}">
				<c:set var="actionUrl" value="/users/update" />
				</c:if>
				
				<form class="form-horizontal" action="${actionUrl}" method="post">	
				
				
					<c:if test="${not empty errorMessage}">
					<div class="control-group">
						<c:out value="${errorMessage}"></c:out>
					</div>
					</c:if>
				
				
					<div class="control-group">
						<label class="control-label" for="userId">사용자 아이디</label>
						<div class="controls">
							<c:choose>
							<c:when test="${empty user.userId }">
							<input type="text" name="userId" value="${user.userId}" placeholder="id" />
							</c:when>
							<c:otherwise>
							<input type="hidden" name="userId" value="${user.userId}" />
							<input type="text" name="userId" value="${user.userId}" readonly/>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="password">비밀번호</label>
						<div class="controls">
							<c:choose>
							<c:when test="${empty user.userId }">
							<input type="password" id="password" name="password" value="" placeholder ="password" />
							</c:when>
							<c:otherwise>
							<input type="password" id="password" name="password" value="" required/>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="name">이름</label>
						<div class="controls">
							<input type="text" id="name" name="name" value="${user.name}" placeholder="name" />
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="email">이메일</label>
						<div class="controls">
							<input type="text" id="email" name="email" value="${user.email}"  placeholder="email"/>
						</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn btn-primary">회원가입</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>