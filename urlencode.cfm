<h3>URLEncodedFormat Example</h3> 
<cfoutput>
<cfset s = "My url-encoded string has special characters & other; stuff"> 
<cfif IsDefined("url.myExample")> 
<p>The url variable url.myExample was passed from the previous link 
its value is: 
<cfset encoded = urlEncodedFormat(url.myExample)>
<cfset decode = urlDecode(encoded)>
<b>"#encoded#"</b> 
<br>
<p> url decoded value is: #decode# </p>
</cfif> 
<p>This function returns a URL encoded string. 
<p> <A HREF = "urlencode.cfm?myExample=#URLEncodedFormat(s)# 
</cfoutput>">Click me</A>

