program_field=",\"customfield_12700\" :  \"137\""
version=$1
j_body="{
        \"fields\": {
           \"project\":
           {
              \"key\": \"LIT\"
           },
           \"summary\": \"Release Axel (version ${version})\",
           \"description\": \"A new release of Axel is required for several bugs, customizations, and improvements\",
           \"issuetype\": {
              \"name\": \"Task.\"
           },
            \"versions\" : [{ \"name\": \"lit-current-production\"}],
            \"components\" : [{ \"name\": \"LIT-BTD\"}],
            \"assignee\" : {\"name\":\"aashqar\"},
            \"priority\": {\"id\": \"10100\"}
            ${program_field}
        }
    }"
ticketID_req=`curl --silent -u opsbot:bugz111a -X POST -H "Content-Type: application/json" https://jira.atypon.com/rest/api/2/issue/ -d "${j_body}" `
echo "${ticketID_req}"
