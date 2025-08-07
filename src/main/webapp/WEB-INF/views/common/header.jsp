<%--
  Created by IntelliJ IDEA.
  User: LEEJUHWAN
  Date: 2025-08-05
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import="com.example.springboard.DTO.Board" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  </head>
  <body>
    <%
    com.example.springboard.DTO.User user = (com.example.springboard.DTO.User) session.getAttribute("user");
    %>
      <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="/">HOME</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

            </ul>
            <%
              if (user != null) {
            %>
            <div style="text-align: right;">
              <strong style="color: white"><%= user.getU_name() %> 님 환영합니다!</strong>
              <button type="button" class="btn btn-secondary me-5" onclick="location.href='/user/logout'">로그아웃</button>
            </div>
            <%
            } else {
            %>
            <button type="button" class="btn btn-secondary me-5" onclick="location.href='/user/login'">로그인</button>
            <%
              }
            %>
            <form class="d-flex" role="search">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

          </div>
        </div>
      </nav>
      <div style="text-align: center; width: 100%; background-color: antiquewhite">
        <h1 style="color: black; text-align: center">게시판</h1>
      </div>
