<%@page import="java.net.MalformedURLException"%>
<%@page import="java.net.URL"%>
<%@page import="java.rmi.Naming"%>
<%@page import="java.rmi.NotBoundException"%>
<%@page import="java.rmi.RemoteException"%>
<%@page import="javax.xml.namespace.QName"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="favorDrop.LogikI"%>

<html>
<head><title>Redirection</title></head>
<body>
<% 
URL url = new URL("http://localhost:18372/FavorDropSoap?wsdl");
QName qname = new QName("http://favorDrop/", "LogikService");
Service service = Service.create(url, qname);
LogikI g = service.getPort(LogikI.class);

// hvis brugernavn="Jacob" og adgangskode="hemli" logges der ind.
// dette burde selvf�lgelig hentes fra en database eller lign.
if (g.login2(request.getParameter("brugernavn"),request.getParameter("adgangskode"))) {
// s�t attributten "logget ind" i sessionen
session.setAttribute("logget ind", "ja");
session.setAttribute("brugernavn", request.getParameter("brugernavn"));
session.setAttribute("adgangskode", request.getParameter("adgangskode"));
out.println("Du er logget korrekt ind.");
request.getRequestDispatcher("highscore.jsp").forward(request, response);
}
else
{
// fjern attributten "logget ind" fra sessionen
session.removeAttribute("logget ind");
out.println("Forkert brugernavn eller adgangskode.");
response.sendRedirect("index.jsp");
}
%>
Du kan nu pr�ve at g� videre til <a href="highscore.jsp">den beskyttede side</a>
eller g� tilbage og logge ind igen.
</body>
</html>
