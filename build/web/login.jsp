<%@page import="java.net.MalformedURLException"%>
<%@page import="java.net.URL"%>
<%@page import="java.rmi.Naming"%>
<%@page import="java.rmi.NotBoundException"%>
<%@page import="java.rmi.RemoteException"%>
<%@page import="javax.xml.namespace.QName"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="favorDrop.LogikI"%>

<% 
URL url = new URL("http://52.213.91.0:18372/FavorDropSoap?wsdl");
QName qname = new QName("http://favorDrop/", "LogikService");
Service service = Service.create(url, qname);
LogikI g = service.getPort(LogikI.class);
out.print("Login virker");
// hvis brugernavn="Jacob" og adgangskode="hemli" logges der ind.
// dette burde selvfølgelig hentes fra en database eller lign.
String token = g.login(request.getParameter("brugernavn"),request.getParameter("adgangskode"));
if ("Not authorized".equals(token)) {
// fjern attributten "logget ind" fra sessionen
session.removeAttribute("logget ind");
out.println("Forkert brugernavn eller adgangskode.");
response.sendRedirect("index.jsp");
}
else
{
// sæt attributten "logget ind" i sessionen
session.setAttribute("logget ind", "ja");
session.setAttribute("brugernavn", request.getParameter("brugernavn"));
session.setAttribute("adgangskode", request.getParameter("adgangskode"));
session.setAttribute("token", token);
out.println("Du er logget korrekt ind.");
response.sendRedirect(request.getContextPath() + "/favorinfosite.jsp");
}
%>
