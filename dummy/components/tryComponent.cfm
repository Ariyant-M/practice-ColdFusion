<!---using cfinvoke--->
<cfinvoke component="FourTimes" method="fourTimesFunc" returnvariable="result">
	<cfinvokeargument name="num" value="3">
</cfinvoke>
<cfoutput>
	<p>result using cfinvoke is : #result#</p>
</cfoutput>
<!---uisng cfobject--->
<cfobject component="FourTimes" name="output" />
<cfset result1 = output.fourTimesFunc() />
<cfoutput>
	<p>result using cfobject is : #result1#</p>
</cfoutput>
<!---using createObject--->
<cfset output2 = createObject("component","FourTimes")>
<cfset result2 = output2.fourTimesFunc(10)>
<cfoutput>
	<p>result using createobject is : #result2#</p>
</cfoutput>