<%-- 
    Document   : update
    Created on : Apr 4, 2021, 4:11:06 PM
    Author     : lenovo
--%>
<%@page import="java.sql.*" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 

    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String city = request.getParameter("city");
        String maxt = request.getParameter("maxt");
        String mint = request.getParameter("mint");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_weather","root","paimon");
        pst = con.prepareStatement("update weathers set city = ?, maxt = ?, mint = ? where id = ?");
        pst.setString(1, city);
        pst.setString(2, maxt);
        pst.setString(3, mint);
        pst.setString(4, id);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Updatedd");     
    </script> 
    <%             
    }
   %>
