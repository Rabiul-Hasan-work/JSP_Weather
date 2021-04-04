<%-- 
    Document   : index
    Created on : Apr 4, 2021, 11:50:51 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 

    if(request.getParameter("submit")!=null)
    {
        String city = request.getParameter("city");
        String maxt = request.getParameter("maxt");
        String mint = request.getParameter("mint");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_weather","root","paimon");
        pst = con.prepareStatement("insert into weathers(city,maxt,mint)values(?,?,?)");
        pst.setString(1, city);
        pst.setString(2, maxt);
        pst.setString(3, mint);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Addeddd");     
    </script> 
    <%             
    }
   %>


<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 align="center">Weather Data Storage by JSP</h1>
        <form  method="POST" action="#" >
        <div align="center">
            <label class="form-label"></label>
            <input type="text" class="form-control" placeholder="City" name="city" id="city" required >
        </div>
        <div align="center">
            <label class="form-label"></label>
            <input type="text" class="form-control" placeholder="Maximum Temperature" name="maxt" id="maxt" required >
        </div>
        <div align="center">
            <label class="form-label"></label>
            <input type="text" class="form-control" placeholder="Minimum Temperature" name="mint" id="mint" required >
        </div>
        </br>
        <div align="Center">
            <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
            <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
        </div>
        </br>
        <div align="center"><a href="#link" class="btn btn-info" role="button">Link Button</a>
        </div>
        <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>City</th>
                                    <th>MAX_TEMP</th>
                                    <th>MIN_TEMP</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_weather","root","paimon");
                                
                                  String query = "select * from weathers";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("city") %></td>
                                 <td><%=rs.getString("maxt") %></td>
                                 <td><%=rs.getString("mint") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>
        </form>
    </body>
</html>
