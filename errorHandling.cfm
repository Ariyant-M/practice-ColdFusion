<cftry>
   <cfthrow>
    <cfcatch type="any">
        <cfthrow
            message="I am an Error"
            type="specialError"
            detail="This is where I put extra detail">
    </cfcatch>
</cftry>
<cfdump var="#try#">