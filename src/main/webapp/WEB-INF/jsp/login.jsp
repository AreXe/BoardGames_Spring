<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<!-- Head -->
<head>
    <%@include file="/WEB-INF/incl/head.app" %>
<title><s:message code="title.login"/></title>
</head>
<body>
<wrapper class="d-flex flex-column">
<!-- Navigation -->
    <%@include file="/WEB-INF/incl/nav.app" %>
<!-- Page Content -->
<main class="container-fluid py-3 flex-fill">
<div class="container">

    <div class="col-md-6 offset-3">
        <div class="card border-primary">
            <h4 class="card-header">Log in</h4>
            <div class="card-body">

    <form class="form-signin" action="/login" method="POST">
        <div class="form-label-group mb-2">
            <input type="text" name="email" id="inputLogin" class="form-control" placeholder="Email" required autofocus>
        </div>

        <div class="form-label-group mb-2">
            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

            </div>
        </div>
    </div>

</div>
</main>
<!-- Footer -->
    <%@include file="/WEB-INF/incl/footer.app" %>
</wrapper>
</body>
</html>