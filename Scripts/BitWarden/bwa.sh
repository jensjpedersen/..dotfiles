#!/bin/bash 
#
if [[ -z $BW_SESSION ]]; then 
    echo "Session variable does not exist." 
    exit 1
fi

echo "username:"
read -r username
echo "password:"
read -r password
echo "uri:"
read -r uri
name=$(echo "$uri" | sed 's|https://www\.\(.*\)\..*|\1|')

cat <<EOF | bw encode | bw create item
{
  "organizationId": null,
  "collectionIds": null,
  "folderId": null,
  "type": 1,
  "name": "${name}",
  "notes": null,
  "favorite": false,
  "fields": [],
  "login": {
      "uris": [
        {
          "match": null,
          "uri": "${uri}"
        }
      ],
      "username": "${username}",
      "password": "${password}",
      "totp": null,
      "passwordRevisionDate": null
    },
  "secureNote": null,
  "card": null,
  "identity": null,
  "reprompt": 0
}
EOF
