<html>
	<head>
	</head>
	<body>
		<cftry>
			<cfquery datasource="hello" name="op">
				SELECT empID,empFirstName,empLastName, empEmail
				FROM employee
				ORDER BY empID ASC
			</cfquery>
			<cfthrow>
			<cfcatch type="application">
				<cfoutput>
					<p>am in catch part #cfcatch.Messsage#</p>
				</cfoutput>
				<cfthrow message="database error">
			</cfcatch>
		</cftry>
		<!---show data in the table form--->
		<!---
		<table>
			<cfoutput query="op">
			<tr>
				<td>#empID# </td>
				<td>#empFirstName#</td>
				<td>#empLastName#</td>
				<td>#empEmail#</td>
			</tr>
			</cfoutput>
		</table>
		--->
	</body>
</html>