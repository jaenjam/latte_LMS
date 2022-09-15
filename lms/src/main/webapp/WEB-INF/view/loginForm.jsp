<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
</head>
<body>

<h2>로그인</h2>
<p>신입생 여러분들 환영합니다.</p>

<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'studnet')" id="defaultOpen">학생</button>
  <button class="tablinks" onclick="openCity(event, 'professor')">교수</button>
  <button class="tablinks" onclick="openCity(event, 'employee')">관리자</button>
</div>

<div id="studnet" class="tabcontent">
  <h3>학생</h3>
  
  <form action="${pageContext.request.contextPath}/loginForm" method="post">

   <h1> Professor login test </h1>

   <table border="1">
      <tr>
         <td> 
            id: <input type="text" name=studentNo" id="studentNo">
          </td>
       </tr>
      <tr>
         <td> 
            pw: <input type="password" name="studentPass" id="studentPass">
         </td>
      </tr>      
   </table>   
   <button type="submit" id="loginBtn"> LOGIN </button>
   <a href=""> SIGN IN </a>


</form>
</div>

<div id="professor" class="tabcontent">
  <h3>교수</h3>
  <form action="${pageContext.request.contextPath}/loginForm" method="post">

   <h1> Professor login test </h1>

   <table border="1">
      <tr>
         <td> 
            id: <input type="text" name="professorNo" id="professorNo">
          </td>
       </tr>
      <tr>
         <td> 
            pw: <input type="password" name="professorPass" id="professorPass">
         </td>
      </tr>      
   </table>   
   <button type="submit" id="loginBtn"> LOGIN </button>
   <a href=""> SIGN IN </a>


</form>
</div>

<div id="employee" class="tabcontent">
  <h3>관리자</h3>
  <form action="${pageContext.request.contextPath}/loginForm" method="post">

   <h1> Professor login test </h1>

   <table border="1">
      <tr>
         <td> 
            id: <input type="text" name="employeeNo" id="employeeNo">
          </td>
       </tr>
      <tr>
         <td> 
            pw: <input type="password" name="employeePass" id="employeePass">
         </td>
      </tr>      
   </table>   
   <button type="submit" id="loginBtn"> LOGIN </button>
   <a href=""> SIGN IN </a>


</form>
</div>

<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}


document.getElementById("defaultOpen").click();

</script>
   
</body>
</html> 