environment_cf=",\"customfield_17422\" : {\"value\":  \"Local\"}"
program_field=",\"customfield_12700\" :  \"137\""
j_body="{
        \"fields\": {
           \"project\":
           {
              \"key\": \"LIT\"
           },
           \"summary\": \"New Axel Version Released\",
           \"description\": \"New Axel Version Released\",
           \"issuetype\": {
              \"id\": \"5\"
           },
            \"versions\" : [{ \"name\": \"lit-current-production\"}],
            \"components\" : [{ \"name\": \"LIT-BTD\"}],
            \"assignee\" : {\"name\":\"aashqar\"},
            \"priority\": {\"id\": \"10100\"}
            ${environment_cf}
            ${program_field}
        }
    }"
ticketID_req=`curl --silent -u opsbot:bugz111a -X POST -H "Content-Type: application/json" https://jira.atypon.com/rest/api/2/issue/ -d "${j_body}" `
echo "${ticketID_req}"
