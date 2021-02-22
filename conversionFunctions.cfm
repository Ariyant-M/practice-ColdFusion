<!--- convert array to list --->
<u><h3>convert array to list</h3></u>
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
<u><h3>Binary encode decode</h3></u>
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
<u><h3>Character Encoding Conversion</h3></u> 
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

<!--- SerializeJSON --->
<u><h3>SerializeJSON</h3></u>
<h4>struct to JSON</h4>
<cfscript>
	emp = structNew();
	emp.firstname = 'ariyant';
	emp.lastname = 'meher';
	writeOutput(serializeJSON(emp));
</cfscript>
<h4>query to JSON</h4>

<cfscript>
	query = "SELECT FLD_PRODUCTID,  FLD_PRODUCTNAME, FLD_PRODUCTDETAILS FROM TBL_PRODUCTLIST";
	option = {datasource : 'myAppDB'};
	res = queryExecute(query,{},option);
	writeDump(serializeJSON(res));
</cfscript>

<h4>add metaData</h4>
<cfscript>
	emp.firstname = 'Yes';
	emp.lastname = 'man';
	metaData = {firstname : {type : 'string', name : 'fName'}};
	emp.SetMetaData(metaData);
	writeOutput(serializeJSON(emp));
</cfscript>

<!--- using setMetaData function --->
<h4>using setMetaData dunction</h4>
<cfscript>
	emp.address = {"doorno": "148", "street":"10 Downing Street", "country": "UK"};
	emp.address.setmetadata({"doorno": {type: "string", name: "DoorNo"},"street": "string","country": "string"});
	metadata = {firstname: {type: "string", name: "fname"}};
	emp.setmetadata(metadata);
	writeoutput(SerializeJSON(emp));
</cfscript>

<!--- set metaData for Array --->
<h4>metaData for array(items:)</h4>
<cfscript>
   example = structnew();
   example.firstname = "Yes";
   example.lastname = "Man";
   example.inputs = ["2500.12", 4.0, "Yes", "False", "339090", {"q1": "Yes"}, ["1","2","3"]];
   example.setmetadata({firstname: "string", inputs: {items: ["numeric", "integer", "string", "boolean", "string", 
   {q1: "boolean"}, {items: "string"}]}});
   writeoutput(serializeJSON(example));
</cfscript>

<h5> use 'ignore: true' in metaData to ignore in JSON</h5>
<h5>use 'structName.getMetadata()' to see metaData</h5>

<!--- RETRIEVING METADATA --->
<h4>Retrieving metaData</h4>
<cfscript>
    inputs = ["2500.12", 4.0, "Yes", "False", "339090", {"q1": "Yes"}, ["1","2","3"]];
    inputs.setmetadata({items: ["string", "integer", "string", "boolean", "string", {q1: "string"}, {items: "string"}]});
    writeOutput(serializeJSON(inputs));
    writedump(inputs.getMetadata());
</cfscript>

<!--- DeserializeJSON --->
<u><h3>DeserializeJSON</h3></u>
<cfscript>
	writeDump(deserializeJSON(serializeJSON(inputs)));
</cfscript>