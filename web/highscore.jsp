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
<p1>Her ses en specifik spillers historik</p1>

<%
URL url = new URL("http://localhost:18372/FavorDropSoap?wsdl");
QName qname = new QName("http://favorDrop/", "LogikService");
Service service = Service.create(url, qname);
LogikI g = service.getPort(LogikI.class);
%>
<table>
  <tr>
    <th></th>
    <th>Vunde spil</th>
    <th>Tabte spil</th>
  </tr>
</table>

</body>
</html>