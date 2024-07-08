<cfscript>
    function renderCFML(required string cfml){
		var out = "";
		var fn = createUUID();
		fileWrite("ram://#fn#.cfm", cfml, "utf-8");

        savecontent variable="out" {
            include "/ram/#fn#.cfm";
        }

		fileDelete("ram://#fn#.cfm");
        return out;
    }

    commands = deserializeJSON(fileRead(expandPath("./commands.json")));

</cfscript>

<cfoutput>
	<cfset start = getTickCount() />
	<cfloop from="1" to="10" index="i">
		#renderCFML(commands[1])#<br />
	</cfloop>
	#getTickCount() - start# ms<br/>

	#renderCFML(commands[2])#<br />
	<cfdump var="#variables#" />
</cfoutput>