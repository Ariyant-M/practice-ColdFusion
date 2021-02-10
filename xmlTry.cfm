<!DOCTYPE html>
<html>
<head>
	<title>xml</title>
</head>
<body>
	<cfscript>
	    myxml = fileRead(expandPath("./example.xml"));
	    mydoc = XmlParse(myxml);
	    writeDump(var = mydoc, label = "using script");
	</cfscript>
	<cfset mydoc = XmlParse(ExpandPath("./example.xml"))>
	<cfdump var="#mydoc#" label="using tag">
</body>
</html>