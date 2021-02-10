<html>
	<head>
	</head>
	<body>
		<cfquery name="op">
			SELECT empID,empFirstName,empLastName, empEmail
			FROM employee
			ORDER BY empID ASC
		</cfquery>
		<cfdump var="#op#">
		<!---show data in the table form--->
		<table>
			<cfoutput query="op">
			<tr>
				<td>#empID# </td>
				<td>#empFirstName#</td>
				<td>#empLastName#</td>
				<td>#empEmail#</td>
			</tr>
			<cflog file="try" text="hello">
			</cfoutput>
		</table>
	</body>
</html>