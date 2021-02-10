<cfcomponent output="false" >
	<cfset this.name = "AppCFC" />
	<cfset this.ApplicationTimeout = CreateTimeSpan( 0, 0, 20, 0 ) />
	<cfset this.datasource="cfDatabase">
	<!---
	<cfset this.componentpaths = expandPath('/CF/parctice/practice/components')>
	--->
	<cfset this.sessionManagement = "true">
	<cfset this.sessionTimeout = #CreateTimeSpan(0,0,1,0)#>
	<!---OnApplicationStart method--->
	<cffunction
		name="OnApplicationStart"
		returntype="boolean">

		<!---
		<cflog file="try" text="executing the OnApplicationStart">
		<cfoutput>
			<p>In the OnApplicationStart</p>
		</cfoutput>
		--->
		<!--- Return out. --->
		<cfreturn true />
	</cffunction>


	<!---OnSessionStart method--->
	<cffunction
		name="OnSessionStart"
		returntype="void">
		<cfcookie name="person">

		<cfset cookie.person.lastname="Santiago">
		<cfoutput>
			<p>In the OnSessionStart</p>
		</cfoutput>
		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<!---OnRequestStart method--->
	<cffunction name="OnRequestStart" returntype="boolean">
		<!--- Define arguments. --->
		<cfargument name="TargetPage" type="string" required="true" />
		<!---
		<cflog file="try" text="executing the OnRequestStart">
		<cfoutput>
			<p>In the OnRequestStart</p>
		</cfoutput>
		--->
		<!--- Return out. --->
		<cfreturn true />
	</cffunction>


	<!---on request--->
	<cffunction
		name="OnRequest"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">

		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>

		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />

		<!--- Return out. --->
		<cfreturn />
	</cffunction>


	<!---onRequestEnd--->
	<cffunction
		name="OnRequestEnd"
		access="public"
		returntype="void"
		output="true">

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<!---onsessionEnd method--->
	<cffunction
		name="OnSessionEnd"
		access="public"
		returntype="void"
		output="false">

		<!--- Define arguments. --->
		<cfargument
			name="SessionScope"
			type="struct"
			required="true"
			/>

		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<!---on error method--->
	<cffunction name="OnError" returntype="void" >

		<!--- Define arguments. --->
		<cfargument name="Exception" type="any" required="true" />

		<cfargument name="EventName" type="string" required="false" default="" />
		<p>in Application.cfc at onerror method</p>
		<cfoutput>
		<p>#Arguments.Exception.Message#</p>
		</cfoutput>
		<!--- Return out. --->
		<cfreturn />
	</cffunction>


</cfcomponent>