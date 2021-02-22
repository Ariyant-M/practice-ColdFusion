<cfset today = "hello">
<cftrace var = "today" text = "I am expecting this to be Friday" type = "information" inline = "yes">
<cfset today = "dummy">
<cftrace var = "today" text = "I am expecting this to be Friday" type = "information" inline = "yes" abort = "Yes" >