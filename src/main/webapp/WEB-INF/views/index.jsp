<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%
    String msg = (String) session.getAttribute("msg");
    if(msg != null) {

%>

<script>
    alert("<%= msg%>");
</script>


<h1 class="text-primary">Hello, world!</h1>

<%
    session.removeAttribute("msg"); // 보여준 뒤 제\
    }
%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />