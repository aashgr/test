addWatchers(){
    jiraAPI=https://jira.atypon.com/rest/api/2
    jiraURL=${jiraAPI}/issue
    ticketID=$1
    watcher=$2
    curl --silent -u opsbot:bugz111a -X POST -H "Content-Type: application/json" ${jiraURL}/${ticketID}/watchers -d "\"${watcher}\""
}

create_ticket () {
   program_field=",\"customfield_12700\" :  \"137\""
   version=$1
   env=$2
   j_body="{
         \"fields\": {
            \"project\":
            {
               \"key\": \"LIT\"
            },
            \"summary\": \"Release Axel (version ${version}) - ${env}\",
            \"description\": \"A new Axel version released - Version ${version} (${env})\",
            \"issuetype\": {
               \"name\": \"Task.\"
            },
               \"versions\" : [{ \"name\": \"None\"}],
               \"components\" : [{ \"name\": \"Axel\"}],
               \"assignee\" : {\"name\":\"aashqar\"},
               \"priority\": {\"id\": \"10009\"}
               ${program_field}
         }
      }"
   ticketID_req=`curl --silent -u opsbot:bugz111a -X POST -H "Content-Type: application/json" https://jira.atypon.com/rest/api/2/issue/ -d "${j_body}" `
   ID=`echo ${ticketID_req} | jq -r '.key'`
   # addWatchers ${ID} "mshammout"
   # addWatchers ${ID} "qaMR"
   # addWatchers ${ID} "aqasem"
   # addWatchers ${ID} "mabuhasna"
   # addWatchers ${ID} "ops-shared"
   echo ${ID}
}

version_val=$1
create_ticket ${version_val} "Staging"
create_ticket ${version_val} "LTS"
create_ticket ${version_val} "Midtierbeta"