<%
    HttpSession sesion = request.getSession();
    String email=(String)sesion.getAttribute("email");
    
    sesion.invalidate();
    response.sendRedirect("index.jsp");
%>
