<!--- convert array to list --->
<h3>convert array to list</h3>
<cfscript>
       myArray=["Google","Microsoft","Adobe","Facebook","Amazon"];
       myConvertedList=myArray.toList();
       WriteOutput(myConvertedList);
</cfscript>


<cfset myList = arrayToList(myArray, "|")>
<cfoutput>
	<p> list is: #myList# </p>
</cfoutput>


<!--- binary encode decode --->
<h3>Binary encode decode</h3>
<cfscript>
 
	function base64ToHex( String base64Value ){
        var binaryValue = binaryDecode( base64Value, "base64" );
        var hexValue = binaryEncode( binaryValue, "hex" );
        return( lcase( hexValue ) );
    }
    function base64ToString( String base64Value ){
        var binaryValue = binaryDecode( base64Value, "base64" );
        var stringValue = toString( binaryValue );
        return( stringValue );
    }
    function hexToBase64( String hexValue ){
        var binaryValue = binaryDecode( hexValue, "hex" );
        var base64Value = binaryEncode( binaryValue, "base64" );
        return( base64Value );
    }
    function hexToString( String hexValue ){
        var binaryValue = binaryDecode( hexValue, "hex" );
        var stringValue = toString( binaryValue );
        return( stringValue );
    }
    function stringToBase64( String stringValue ){
        var binaryValue = stringToBinary( stringValue );
        var base64Value = binaryEncode( binaryValue, "base64" );
        return( base64Value );
    }
    function stringToBinary( String stringValue ){
        var base64Value = toBase64( stringValue );
        var binaryValue = toBinary( base64Value );
        return( binaryValue );
    }
    function stringToHex( String stringValue ){
        var binaryValue = stringToBinary( stringValue );
        var hexValue = binaryEncode( binaryValue, "hex" );
        return( lcase( hexValue ) );
    }
    // ------------------------------------------------------ //
    // ------------------------------------------------------ //
    message = "GoodMorning! What's Up?";
    writeOutput( "Original :: " & message );
    writeOutput( "<br>" );
    // Now, let's check to the String-to-XXX conversions.
    writeOutput( "" );
    messageAsHex = stringToHex( message );
    writeOutput( "Hex :: " & messageAsHex );
    writeOutput( "" );
    messageAsBase64 = stringToBase64( message );
    writeOutput( "<br>Base64 :: " & messageAsBase64 );
    writeOutput( "" );
    messageAsBinary = stringToBinary( message );
    writeOutput( "<br>Binary :: B" & arrayLen( messageAsBinary ) );
    writeOutput( "" );
     
</cfscript>

<!--- character encode decode --->
<h3>Character Encoding Conversion</h3> 
<!--- Do the conversions. --->
<cfscript> 
myString="Hello ColdFusion";
charEncoding='utf-8';
chardecode=CharsetDecode(myString, charEncoding); 
charencode=CharsetEncode(chardecode, charEncoding); 
</cfscript> 
  
<!--- Display the input values and results. --->
<cfoutput>
<p><b>The string:</b> 
#myString#</p> 
<p><b>The character encoding:</b> #charEncoding#</p> 
  
<h3>Results of the operations:</h3> 
<p><b>Dump of the string converted to a binary object by CharsetDecode: 
</b> 
<cfdump var="#chardecode#"></p> 
<p><b>The binary object converted back to a string by CharsetEncode: 
</b> 
#charencode#</p> 
</cfoutput>

