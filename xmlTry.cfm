<!DOCTYPE html>
<html>
<head>
	<title>xml</title>
</head>
<body>
	<!--- reading data from xml file --->
	<cfscript>
	    myxml = fileRead(expandPath("./example.xml"));
	    mydoc = myxml;
	    writeOutput("<h1>without XmlParse<br></h1>");
	    writeDump(var = mydoc);
	    mydoc = XmlParse(myxml);
	    writeDump(var = mydoc, label = "with XmlParse using script");
	</cfscript>
	<cfset mydoc = XmlParse(ExpandPath("./example.xml"))>
	<cfdump var="#mydoc.xmlRoot.xmlChildren[1].xmlChildren[3].XmlText#" label="using tag">
	<br>
	<cfdump var="#mydoc.xmlRoot.xmlChildren[1].description.XmlText#" label="using tag">
	<br>
	<cfdump var="#mydoc.xmlRoot.xmlChildren[4].XmlAttributes#" label="using tag">

	<!--- write into xml file --->
	<cfquery name="getdata">
		SELECT FLD_PRODUCTID, FLD_PRODUCTNAME, FLD_PRODUCTDETAILS FROM TBL_PRODUCTLIST
	</cfquery>
	<cfxml variable="productxml">
		<allProduct>
			<cfoutput query = getdata>
				<product productid = "#FLD_PRODUCTID#">
					<productid>#FLD_PRODUCTID#</productid>
					<productname>#FLD_PRODUCTNAME#</productname>
					<productdetails>#FLD_PRODUCTDETAILS#</productdetails>
				</product>
			</cfoutput>
		</allProduct>
	</cfxml>
	<cfset filewrite("#expandpath('./out.xml')#", productxml)>
	<cfdump var="#productxml#">

	<!--- accessing xml by loop --->
	<br>
	<h1>using loop</h1>
	<cfloop array="#productxml.xmlRoot.xmlChildren#" index="i">
		<cfoutput>
			<p>productid: #i.productid#</p>
			<p>productname: #i.productname#</p>
			<p>productdetails: #i.productdetails#</p>
		</cfoutput>
	</cfloop> 

	<!--- creating query from an xml file --->
	<cfscript>
		artQuery = QueryNew("name, price, description, calories");
		queryAddRow(artQuery, arraylen(mydoc.breakfast_menu.food));

		for (i = 1; i lte arraylen(mydoc.breakfast_menu.food); i++){
		    thisItem = mydoc.breakfast_menu.food[i];
		    QuerySetCell(artQuery, "name", thisItem.name.XmlText, i);
		    QuerySetCell(artQuery, "price", thisItem.price.XmlText, i);
		    QuerySetCell(artQuery, "description", thisItem.description.XmlText, i);
		    QuerySetCell(artQuery, "calories", thisItem.calories.XmlText, i);

		}
		writedump(artQuery);
	</cfscript>

	<!--- search in xml file --->
	
</body>
</html>