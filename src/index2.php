<!DOCTYPE html>
<html>
<body>

<?php
$txt1 = getenv("DATABASE_NAME");

 $dbHost=getenv("DATABASE_HOST");  //Database host
 $dbUser=getenv("DATABASE_USER");   //Database username
 $dbPassword=getenv("DATABASE_PASSWORD"); //Database password
 $dbDatabase=getenv("DATABASE_NAME"); //Database name

echo "<h2>" . "dbHost:" .  $dbHost .  "</h2>";
echo "<h2>" . "dbUser :" .  $dbUser .  "</h2>";
echo "<h2>" . "dbPassword :" .  $dbPassword .  "</h2>";
echo "<h2>".  "dbDatabase : " .  $dbDatabase .  "</h2>";

?> 

<?php
phpinfo(); ?>

</body>
</html>

