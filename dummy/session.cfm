<html>
	<head>
	</head>
	<body>
		<cflock timeout= "20" scope="Session">
			<cfset Session.firstName = "Ariyant">
			<cfset Session.lastName = "Meher">
		</cflock>
		<cflock timeout="20" scope="Session" type="Readonly">
			<cfdump var="#Session#">
			<cfoutput>
				<p>name is #Session.firstName# #Session.lastName#</p>
				<p>#cookie.person.lastname#</p>
			</cfoutput>
			<!---
			<cfset getPageContext().getSession().invalidate()>
			<cfdump var="#Session#">
			--->
		</cflock>
	</body>
</html>
<!---
<cfset StructClear(Session)>
--->