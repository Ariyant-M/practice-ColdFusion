<cfscript>
	writeOutput("SHA-256:	");
    writeOutput(hash("message", "SHA-256", "UTF-8"));
    writeOutput("<br>SHA-512:	");
    writeOutput(hash("message", "SHA-512", "UTF-8")) ;
</cfscript>

<cfscript>
    x=hmac("Message","key","HMACRIPEMD160");
    writeOutput(x) ;
    //HMACMD5, HMACRIPEMD160, HMACSHA1, HMACSHA224, HMACSHA256, HMACSHA384, HMACSHA512
</cfscript>