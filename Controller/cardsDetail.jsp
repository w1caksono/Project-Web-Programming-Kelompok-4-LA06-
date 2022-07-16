<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>

<%
    int userid = Integer.parseInt(request.getParameter("user_id"));
    out.println(userid);
    String name = request.getParameter("page");
    int card_id = 0;
    int qty = Integer.parseInt(request.getParameter("qty"));

    Connect con = Connect.getConnection();

    PreparedStatement prepst = con.prepareStatement("SELECT id FROM partywares WHERE name = ?");
    prepst.setString(1, name);

    ResultSet rs = prepst.executeQuery();

    if(rs.next()){
        card_id = rs.getInt("id");    
    }

    prepst = con.prepareStatement("INSERT INTO `cart` (`user_id`, `card_id`, `quantity`) VALUES (?, ?, ?) ");
    prepst.setInt(1, userid);
    prepst.setInt(2, card_id);
    prepst.setInt(3, qty);
    prepst.execute();

    response.sendRedirect("../cardsDetail.jsp?page=" + name);
%>