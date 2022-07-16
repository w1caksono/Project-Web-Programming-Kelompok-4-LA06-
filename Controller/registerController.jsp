<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>

<%!
    boolean checkContainsNumber(String s){
        for(char c:s.toCharArray()){
            if(Character.isDigit(c))
                return true;
        }
        return false;
    }

    boolean checkContainsLetter(String s){
        for(char c:s.toCharArray()){
            if(Character.isLetter(c))
                return true;
        }
        return false;
    }
%>

<%
    if(session.getAttribute("role") != null || request.getParameter("email") == null){
        response.sendRedirect("../home.jsp");
        return;
    }

	try {
		Connect con = Connect.getConnection();
        String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
		
        if(name.equals(""))
            response.sendRedirect("../register.jsp?err=1");
        else if(name.length() < 3)
            response.sendRedirect("../register.jsp?err=2");
		else if(email.equals(""))
			response.sendRedirect("../register.jsp?err=3");
        else if(!email.contains("@") || !email.contains("."))
            response.sendRedirect("../register.jsp?err=4");
        else if(email.contains("@.") || email.contains(".@"))
            response.sendRedirect("../register.jsp?err=6");
        else if(email.split("@").length != 2)
            response.sendRedirect("../register.jsp?err=5");
        else if(password.equals(""))
            response.sendRedirect("../register.jsp?err=8");
		else if(password.length() < 6)
            response.sendRedirect("../register.jsp?err=9");
        else if(!checkContainsLetter(password))
            response.sendRedirect("../register.jsp?err=10");
        else if(!checkContainsNumber(password))
            response.sendRedirect("../register.jsp?err=11");
        else if(!confirmPassword.equals(password))
            response.sendRedirect("../register.jsp?err=12");
		else {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users where email = ?");
			ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                response.sendRedirect("../register.jsp?err=7");
                return;
            }
            
            ps = con.prepareStatement("insert into users value(null,?,?,?,?)");
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, password);
                    ps.setString(4, "member");
                    ps.execute();
            
            response.sendRedirect("../login.jsp");
		}
	}
	catch(Exception e) {}
%>
