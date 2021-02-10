<!---
  --- FourTimes
  --- ---------
  ---
  --- author: Ariyantm
  --- date:   19/1/21
  --->
<cfcomponent output="false">
	<cffunction name="fourTimesFunc" returntype="numeric">
		<cfargument name="num" required="true" default="1">
		<cfset var num2 = arguments.num * 4>
		<cfreturn num2>
	</cffunction>
</cfcomponent>