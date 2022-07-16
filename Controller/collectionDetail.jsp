<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>

<%
    int userid = (request.getParameter("userid") != null)?Integer.parseInt(request.getParameter("userid")):0;
    out.println(userid);
    String name = request.getParameter("page");
    int food_id = 0;
    int qty = Integer.parseInt(request.getParameter("qty"));

    Connect con = Connect.getConnection();

    PreparedStatement prepst = con.prepareStatement("SELECT id FROM foods WHERE name = ?");
    prepst.setString(1, name);

    ResultSet rs = prepst.executeQuery();

    if(rs.next()){
        food_id = rs.getInt("id");    
    }

    prepst = con.prepareStatement("INSERT INTO `cart` (`user_id`, `food_id`, `quantity`) VALUES (?, ?, ?) ");
    prepst.setInt(1, userid);
    prepst.setInt(2, food_id);
    prepst.setInt(3, qty);
    prepst.execute();

    response.sendRedirect("../collectionDetail.jsp?page=" + name);
%>