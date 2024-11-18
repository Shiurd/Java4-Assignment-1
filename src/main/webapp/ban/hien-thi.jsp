<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hacke
  Date: 16-11-2024
  Time: 04:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container mt-md-4">
    <form action="${pageContext.request.contextPath}/ban/add" method="post" class="container mt-md-4 shadow p-3 mb-5 bg-body rounded">
        <div class="form-group">
            <label>Ma</label>
            <input type="text" name="ma" class="form-control" placeholder="" aria-describedby="helpId">
        </div>
        <div class="form-group">
            <label>Ten</label>
            <input type="text" name="name" class="form-control" placeholder="" aria-describedby="helpId">
        </div>
        <div class="form-group">
            <label>So thich</label>
            <input type="text" name="soThich" class="form-control" placeholder="" aria-describedby="helpId">
        </div>
        <div class="form-group">
            <label>Gioi tinh</label>
            <br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gioiTinh" value="false"/>
                <label class="form-check-label" >Nam</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gioiTinh" value="true"/>
                <label class="form-check-label">Nữ</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary" onclick="confirm('Are you sure?')">Submit</button>
    </form>

    <table class="table table-hover shadow p-3 mb-5 bg-body rounded">
        <thead>
        <tr>
            <th>ID</th>
            <th>Ma</th>
            <th>Ten</th>
            <th>So thich</th>
            <th>Gioi tinh</th>
            <th>Function</th>
        </tr>
        </thead>
        <tbody>
        <jsp:useBean id="listBan" scope="request" type="java.util.List"/>
        <c:forEach items="${listBan}" var="ban">
            <tr>
                <td>${ban.id}</td>
                <td>${ban.ma}</td>
                <td>${ban.name}</td>
                <td>${ban.soThich}</td>
                <td>${ban.gioiTinh == false ? "Nam" : "Nữ"}</td>
                <td>
                    <button class="btn"><a
                            href="${pageContext.request.contextPath}/ban/delete?id=${ban.id}" class="btn btn-danger" onclick="confirm('Are you sure?')">Delete</a>
                    </button>
                    <button class="btn"><a
                            href="${pageContext.request.contextPath}/ban/get-one?id=${ban.id}" class="btn btn-primary">Update</a>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
