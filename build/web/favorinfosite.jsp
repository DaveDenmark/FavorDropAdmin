<%@page import="java.util.ArrayList"%>
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
        <a  href="favorinfosite.jsp">Opdater</a>
        
        
<%
URL url = new URL("http://52.213.91.0:18372/FavorDropSoap?wsdl");
QName qname = new QName("http://favorDrop/", "LogikService");
Service service = Service.create(url, qname);
LogikI g = service.getPort(LogikI.class);
String token = (String) session.getAttribute("token");
session.setAttribute("Orders", g.getCompletedOrdersLength(token));
session.setAttribute("Brugere", g.getClientsA(token));
session.setAttribute("Partnere", g.getPartnersA(token));
session.setAttribute("OrdersNew", g.getOrdersNew(token));
session.setAttribute("OrdersInService", g.getOrdersInService(token));
%>


<table>
  <tr>
    <th>Antal Favor Drop Færdige ordrer</th>
    <th>Antal Favor Drop brugere</th>
    <th>Antal Favor Drop Partnere</th>
  </tr>
  <tr>
    <td>${sessionScope.Orders}</td>
    <td>${sessionScope.Brugere}</td>    
    <td>${sessionScope.Partnere}</td>
  </tr>
</table>
  
  <h1>OrdreID oversigt</h1>
  <table>
      <tr>
          <th>Nye Favor Drop ordre</th>
          <th>Igangværende Favor Drop ordre</th>
      </tr>
      
      <tr>
          <td>
           ${sessionScope.OrdersNew}
          <p>Slet igangværende ordre ved at indtaste dets OrdreID</p>
          <form action="favorinfosite.jsp">
          <input type="text" placeholder="Indtast ordreID" name="orderNewID" required="required" minLength="5" maxLength="5">
          <input type="submit" value="Fjern denne ordre">
          
          <%
          session.setAttribute("orderNewID", request.getParameter("orderNewID"));
          g.deleteOrderNew(token,(String)session.getAttribute("orderNewID"));
          %>
          </form>
          </td>
          
          <td>
          ${sessionScope.OrdersInService}
          <p>Slet ny ordre ved at indtaste dets OrdreID</p>
          <form action="favorinfosite.jsp">
          <input type="text" placeholder="Indtast ordreID" name="orderInServiceID" required="required" minLength="5" maxLength="5">
          <input type="submit" value="Fjern denne ordre">
          
          <%
          session.setAttribute("orderInServiceID", request.getParameter("orderInServiceID"));
          g.deleteOrderInService(token,(String)session.getAttribute("orderInServiceID"));   
          %>
          </form>
          </td>
          
      </tr> 
  </table>

</body>
</html>