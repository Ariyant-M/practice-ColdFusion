<!DOCTYPE html>
<html>
<head>
	<title>Cache</title>
</head>
<body>
	<cfscript>
		//put data in the cache
		// cachePut( id, value, [timeSpan], [idleTime] );
		data = { name = 'foo', key = 'bar' };
	    cachePut( 'dummy', data);
	    data = cacheGet('dummy');
	    writeDump(data);
	    cachePut( 'learncfinaweek', 7 );
	    cachePut( 'learncfinaday', 1 );
	    writeDump( var='#cacheGetAllIds()#' );
	    writeDump( var='#cacheGetMetaData( 'learncfinaweek' )#' );

	</cfscript>

	<cfscript>
		//get data from cache
	    function getData() {
	        var key = 'id_for_cached_data';
	        var data = cacheGet( key );
	        if( isNull( data ) ) {
	            var data = { name = 'foo', key = 'bar' };
	            cachePut( key, data);
	        }
	        return data;
	    }
	        writeDump(getData());
	</cfscript>

	<cfscript>
	    function getPage() {
	        var key = 'coldfusion.adobe.com';
	        var webpage = cacheGet( key );
	        if( isNull( webpage ) ) {
	            var req = '';
	            cfhttp( url="https://coldfusion.adobe.com/", resolveurl=true, result="req" );
	            var webpage = req.filecontent;
	            cachePut( key, webpage,createTimespan(0, 0, 5, 0), createTimespan(0, 0, 2, 0) );
	        }
	        return webpage;
	    }
	    writeDump(getpage());

	    //removing data form cache manually
	    //cacheRemove('coldfusion.adobe.com');
	</cfscript>
</body>
</html>