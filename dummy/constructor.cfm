<cfset objPerson = CreateObject( "component", "constructor" ).Init(
	Name = "mohit"
	) />
<p>explicit construstor: <cfdump var="#objperson#"></p	>
<br>
<cfscript>
	objP = new constructor(Name = "ariyant");
	writeOutput("implicit constructor: ");
	writeOutput(objP);
</cfscript>