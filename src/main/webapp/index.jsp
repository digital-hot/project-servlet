
<%@ page import="com.tictactoe.Sign" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Tic-Tac-Toe</title>
    <link href="static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
</head>
<body>
<h1>Tic-Tac-Toe</h1>

<%-- Отримання значення атрибуту сесії --%>
<% List<Sign> data = (List<Sign>) session.getAttribute("data"); %>
<% Sign winner = (Sign) session.getAttribute("winner"); %>
<%--<% Boolean draw = false; %>--%>
<% Boolean draw = (Boolean) session.getAttribute("draw"); %>
<table>
    <tr>
        <td onclick="window.location='/logic?click=0'"><%=data.get(0).getSign()%></td>
        <td onclick="window.location='/logic?click=1'"><%=data.get(1).getSign()%></td>
        <td onclick="window.location='/logic?click=2'"><%=data.get(2).getSign()%></td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'"><%=data.get(3).getSign()%></td>
        <td onclick="window.location='/logic?click=4'"><%=data.get(4).getSign()%></td>
        <td onclick="window.location='/logic?click=5'"><%=data.get(5).getSign()%></td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'"><%=data.get(6).getSign()%></td>
        <td onclick="window.location='/logic?click=7'"><%=data.get(7).getSign()%></td>
        <td onclick="window.location='/logic?click=8'"><%=data.get(8).getSign()%></td>
    </tr>
</table>

<hr>
<%--<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>--%>
<%--<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>--%>

<c:if test="<%= winner == Sign.CROSS%>">
    <h1>CROSSES WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>
<c:if test="<%= winner == Sign.NOUGHT%>">
    <h1>NOUGHTS WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>
<c:if test="<%= draw%>">
    <h1>IT'S A DRAW</h1>
    <button onclick="restart()">Start again</button>
</c:if>



<script>
    function restart() {
        console.log('Restarting game');
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
                console.log('Game restarted');
            }
        });
    }
</script>


</body>
</html>