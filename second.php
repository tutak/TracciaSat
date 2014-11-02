<?php

	/*Il file PHP second i parametri che gli vengono passati reagisce in modo diverso, nel primo caso produce XML in output secondo i parametri dell'utente e nel secondo caso aggiorna il Database  */
	if (!isset($_GET['dat'],$_GET['tim'],$_GET['spee'],$_GET['LON'],$_GET['LA'],$_GET['IMEI'])){ 
		   
		function parseToXML($htmlStr) 
		{ 
			$xmlStr=str_replace('<','&lt;',$htmlStr); 
			$xmlStr=str_replace('>','&gt;',$xmlStr); 
			$xmlStr=str_replace('"','&quot;',$xmlStr); 
			$xmlStr=str_replace("'",'&#39;',$xmlStr); 
			$xmlStr=str_replace("&",'&amp;',$xmlStr); 
			return $xmlStr; 
		} 
		// Apri connession verso il server mySQL
		$connection=mysql_connect ("localhost","root","alphabravo");
		if (!$connection) {
			die('Not connected : ' . mysql_error());
				}
									
		// Rende il Database mySQL attiva
		$db_selected = mysql_select_db("tracciasat", $connection);
		if (!$db_selected) {
			die ('Can\'t use db : ' . mysql_error());
				}
							
		// Seleziona le righe dalla tabella sessione che esistono con il IMEI specificato e esistono entra le date passate
		$start = mysql_escape_string($_GET[strt]);
		$end = mysql_escape_string($_GET[end]);
		$IMEI = mysql_escape_string($_GET[id]);
				
		$query = "SELECT * FROM sessione WHERE Dat BETWEEN '$start' AND '$end' AND IMEI = '$IMEI'";
		$result = mysql_query($query);
		if (!$result) {
			die('Invalid query: ' . mysql_error());
				}
		header("Content-type: text/xml");
		// Inizio del file XML, echo node padre
		echo '<markers>';
		
		// Itera tra le righe,creando dei nodi XML per ognuno di loro
		while ($row = @mysql_fetch_assoc($result)){
			echo '<marker ';
			echo 'IMEI="' . parseToXML($row['IMEI']) . '" ';
			echo 'Velocity="' . parseToXML($row['Velocity']) . '" ';
			echo 'Ora="' . parseToXML($row['Ora']) . '" ';
			echo 'Data="' . parseToXML($row['Dat']) . '" ';
			echo 'lat="' . $row['Latitudine'] . '" ';
			echo 'lng="' . $row['Longitudine'] . '" ';
			echo '/>';
													}
	
		// Fine del file XML
			echo '</markers>';

			}
        else{

		// Il secondo caso dove aggiorna il Database con i parametri passati automaticamente dal dispositivo
		$con = mysql_connect("localhost","root","alphabravo");
		if(!$con){
			die('Could not connect: ' . mysql_error());
			}
		else{
			mysql_select_db("tracciasat", $con);
			$resul=mysql_query("select * FROM dispositivo") or die("Error couldn't execute query: " . mysql_error());
			while($row=mysql_fetch_array($resul)){
			if($row['IMEI']!= $_GET['IMEI']){
				$updat=mysql_query("INSERT INTO dispositivo VALUES('$IMEI");
							}
			}


			$date = mysql_escape_string($_GET[dat]);
			$time = mysql_escape_string($_GET[tim]);
			$longitude = mysql_escape_string($_GET[LON]);
			$latitude = mysql_escape_string($_GET[LA]);
			$speed = mysql_escape_string($_GET[spee]);
											
			$sq=mysql_query("INSERT INTO sessione VALUES ('$date','$time','$longitude','$latitude','$IMEI','$speed')") or die("Error inserting new data: " . mysql_error());
												
			echo " 1 record aggiunto";
			mysql_close($con);
				}}
?>
			
