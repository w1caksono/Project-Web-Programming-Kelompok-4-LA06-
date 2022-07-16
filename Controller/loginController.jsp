<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "connect.jsp" %>
<%
	if(session.getAttribute("role") != null || request.getParameter("email") == null){
        response.sendRedirect("../home.jsp");
        return;
    }

	try{
	    Connect con = Connect.getConnection();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Integer activeUser = 0;
		
		if(email.equals(""))
			response.sendRedirect("../login.jsp?err=1");
        else if(!email.contains("@") || !email.contains("."))
            response.sendRedirect("../login.jsp?err=2");
        else if(email.contains("@.") || email.contains(".@"))
            response.sendRedirect("../login.jsp?err=4");
        else if(email.split("@").length != 2)
            response.sendRedirect("../login.jsp?err=3");
        else if(password.equals(""))
            response.sendRedirect("../login.jsp?err=5");
		else{
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users where email = ? AND Password = ?");
			ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

			if(rs.next()){	
				
				if(application.getAttribute("activeUser")== null){
                    activeUser = 0;
				}
                else{
                    activeUser = (Integer)application.getAttribute("activeUser");
                }    
				activeUser++;
                application.setAttribute("activeUser",activeUser);
				
				String name = rs.getString("name");
				String role = rs.getString("role");
				int id = rs.getInt("id");
				email = rs.getString("email");

				session.setAttribute("name",name);
				session.setAttribute("role",role);
				session.setAttribute("userId", id);
				session.setAttribute("email",email);
				
				Cookie newCookie = new Cookie("name", name);
				newCookie.setMaxAge(86400);
				newCookie.setPath("/");
				response.addCookie(newCookie);
				
				response.sendRedirect("../home.jsp");
			}
			else{
				response.sendRedirect("../login.jsp?err=6");
			}
			
		}
	} catch(Exception e){}
%>