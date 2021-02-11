<!DOCTYPE html>
<html>
<head>
	<title>JSON</title>
</head>
<body>
	<cfset myStruct = {
	    items: {
	        item1:  {name: 'something', price: 1000},
	        item2:  {name: 'something else', price: 12.50},
	        item3:  {name: 'something more', price: "1,240.10"}
	    },
	    users: {
	        user1:  {id: 1, email: 'none@none.net'},
	        user2:  {id: 2, email: 'none@none.net'},
	        user3:  {id: 3, email: 'none@none.net'}
	    }
	}>

	<!--- convert struct to json --->
	<cfset jsonvar = serializeJSON(myStruct)>
	<cfdump var="#jsonvar#">


	<!--- convert JSON to struct --->
	<cfset cfvar = deserializeJSON(jsonvar)>
	<cfdump var="#cfvar#">
</body>
</html>