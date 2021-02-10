<!---using cfinvoke--->
<cfinvoke component="components.FourTimes" method="fourTimesFunc" returnvariable="result">
	<cfinvokeargument name="num" value="3">
</cfinvoke>
<cfoutput>
	<p>result using cfinvoke is : #result#</p>
</cfoutput>
<!---using cfobject--->
<!---try to catch error and print the error--->
<cftry>
<cfobject component="components.FourTimes" name="output" />
<cfset result1 = output.fourTimesFunc(4) />
<cfoutput>
	<p>result using cfobject is : #result1#</p>
</cfoutput>
<cfcatch type="any">
	<cfoutput>
	<ul>
		<li><b>Message:</b> #cfcatch.Message#
		<li><b>Detail:</b> #cfcatch.Detail#
		<li><b>ErrorCode</b> #cfcatch.Type#
	</ul>
	</cfoutput>
</cfcatch>
</cftry>
<!---using createObject--->
<cfset output2 = createObject("component","components.FourTimes")>
<cfset result2 = output2.fourTimesFunc(10)>
<cfdump var = "#result2#">
<cfoutput>
	<p>result using createobject is : #result2#</p>
</cfoutput>