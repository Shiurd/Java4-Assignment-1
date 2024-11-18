<%--
  Created by IntelliJ IDEA.
  User: Hacke
  Date: 17-11-2024
  Time: 03:38 CH
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
  <form action="${pageContext.request.contextPath}/ban/update" method="post" class="container mt-md-4 shadow p-3 mb-5 bg-body rounded">
    <div class="form-group">
      <label>ID</label>
      <input type="text" name="id" class="form-control" placeholder="" aria-describedby="helpId" value="${ban.id}">
    </div>
    <div class="form-group">
      <label>Ma</label>
      <input type="text" name="ma" class="form-control" placeholder="" aria-describedby="helpId" value="${ban.ma}">
    </div>
    <div class="form-group">
      <label>Ten</label>
      <input type="text" name="name" class="form-control" placeholder="" aria-describedby="helpId" value="${ban.name}">
    </div>
    <div class="form-group">
      <label>So thich</label>
      <input type="text" name="soThich" class="form-control" placeholder="" aria-describedby="helpId" value="${ban.soThich}">
    </div>
    <div class="form-group">
      <label>Gioi tinh</label>
      <br>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gioiTinh" value="false" ${ban.gioiTinh == "false" ? "checked":""}/>
        <label class="form-check-label" >Nam</label>
      </div>

      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gioiTinh" value="true" ${ban.gioiTinh == "true" ? "checked":""}/>
        <label class="form-check-label">Nữ</label>
      </div>
    </div>
    <button type="submit" class="btn btn-primary" onclick="confirm('Are you sure?')">Submit</button>
  </form>
</div>
</body>
</html>
