<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>USER 테이블 확인</title>
</head>
<body>
<h2>USER 테이블 데이터</h2>

<%
    String url = "jdbc:mariadb://localhost:3306/springboard";
    String user = "root";
    String password = "1234";

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        Statement stmt = conn.createStatement();

        // 테이블 조회 쿼리
        ResultSet rs = stmt.executeQuery("SELECT * FROM USER");

        while (rs.next()) {
            String id = rs.getString("id");
            out.println("<p>ID: " + id + "</p>");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>에러 발생: " + e.getMessage() + "</p>");
    }
%>

</body>
</html>