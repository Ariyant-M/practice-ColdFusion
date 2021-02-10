<!DOCTYPE html>
<html>
<head>
	<title>script</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<!---bootstrap CDN--->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script src=" https://code.jquery.com/jquery-3.5.1.min.js " integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
	<cfscript>
		// queryExecute('query',[parameters],{option})
		sql = 'SELECT * FROM TBL_PRODUCTLIST WHERE FLD_PRODUCTID > :id';
		parameter = structNew();
		parameter.id = {value = 5, cfsqltype="cf_sql_integer"};
		option = {datasource : 'myAppDB'};
		option1 = {datasource : 'myAppDB', result ="product"}; 
		// used for getting primary key(generated) by using product.generatedKey
		myQuery = queryExecute(sql,parameter,option);
		writeDump(myQuery);
		queryExecute(sql,parameter,option1);
		writeDump(product);

		users = queryNew( "firstname", "varchar", [{"firstname":"Han"}] );
		subUsers = queryExecute( "select * from users", {}, { dbtype="query" } );
		writedump( subUsers );
	</cfscript>
</body>
</html>