<%-- 
    Document   : index
    Created on : 12-04-2017, 21:18:07
    Author     : TheDave
--%>
<html>
<head><title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css"
</head>
<body>
<div>
    <p2>FavorDrop Admin Login</p2>
<br>
  <form method="post" action="login.jsp">
    <label for="fname">Brugernavn</label>
    <input type="text" id="brugerid" name="brugernavn" placeholder="Dit studienummer">

    <label for="lname">Adgangskode</label>
    <input type="password" id="pwd" name="adgangskode" placeholder="Din personlige kode til kurset">  
    <input type="submit" value="Gå videre">
  </form>
</div>
</body>
</html>
