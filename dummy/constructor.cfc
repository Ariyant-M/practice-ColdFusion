<cfcomponent output="false">
	<cffunction
		name="Init"
		access="public"
		returntype="string"
		output="false">

		<!--- Define arguments. --->
		<cfargument
			name="Name"
			type="string"
			required="true" />

		<cfset greet = "hello ">
		<cfset var name1 = greet & arguments.Name />

		<cfreturn name1/>
	</cffunction>

</cfcomponent>