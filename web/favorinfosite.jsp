<%@page import="java.net.MalformedURLException"%>
<%@page import="java.net.URL"%>
<%@page import="java.rmi.Naming"%>
<%@page import="java.rmi.NotBoundException"%>
<%@page import="java.rmi.RemoteException"%>
<%@page import="javax.xml.namespace.QName"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="favorDrop.LogikI"%>


<%
// se om attributten "logget ind" er sat i sessionen
if (session.getAttribute("logget ind") == null) {
// brugeren er ikke logget ind, så send ham tilbage til login-siden
response.sendRedirect("index.jsp");
}
%>
<html>
<head><title>Statistik</title>
  <link rel="stylesheet" type="text/css" href="styles.css"
</head>
<body>
    
        <img id="logoid" src="assets/favordroplogo250.png"></img>
        <br>
        <h1>Velkommen til Favor Drop Admin site</h1>
        <p1>Her ses Favor Drops antal af ordrer, brugere og partnere</p1>
        <a href="favorinfosite.jsp">Opdater</a>
        
<%
//URL url = new URL("http://ubuntu4.javabog.dk:18372/FavorDropSoap?wsdl");
URL url = new URL("http://localhost:18372/FavorDropSoap?wsdl");
QName qname = new QName("http://favorDrop/", "LogikService");
Service service = Service.create(url, qname);
LogikI g = service.getPort(LogikI.class);
String orders = g.getSuccededOrdersA(request.getParameter("brugernavn"),request.getParameter("adgangskode"));
session.setAttribute("Orders", g.getSuccededOrdersA((String)session.getAttribute("brugernavn"),(String)session.getAttribute("adgangskode")));
session.setAttribute("Brugere", g.getClientsA((String)session.getAttribute("brugernavn"),(String)session.getAttribute("adgangskode")));
session.setAttribute("Partnere", g.getPartnersA((String)session.getAttribute("brugernavn"),(String)session.getAttribute("adgangskode")));
%>
<table>
  <tr>
    <th>Antal Ordrer</th>
    <th>Antal brugere</th>
    <th>Antal Partnere</th>
  </tr>
  <tr>
    <td>${sessionScope.Orders}</td>
    <td>${sessionScope.Brugere}</td>    
    <td>${sessionScope.Partnere}</td>
  
  
  </tr>
</table>

</body>
</html>