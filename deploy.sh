#!/usr/bin/sh

scriptname=$(basename $0)
USAGE="Usage : ${scriptname} [-s <service>] [-t tag1,tag2,tag3] [-h]"
HELP="Deploy, manage or destroy HA consul + vault environment.

${USAGE}\n
  -s = Service name [consul|vault] (Optional - both if omitted)
  -t = Tags [tag1,tag2,tag3] (Optional - all necessary tags for full deployment if omitted)
  -h = Show usage

Examples\n
1) Deploy complete consul + vault environment

   ./deploy.sh

   Equivalent to running \"ansible-playbook -i inventory site.yml --tags 'epel,install,init,unseal,configure,approle'\"

2) Stop consul service on all consul hosts

   ./deploy -s consul -t stop

   Equivalent to running \"ansible-playbook -i inventory consul.yml --tags 'stop'\"

3) Remove complete consul + vault environment

  ./deploy -t 'remove'

  Equivalent to running \"ansible-playbook -i inventory site.yml --tags 'remove'\"
"

while getopts s:t:h name
do
  case ${name} in
  s)    service=${OPTARG};;
  t)	tags=${OPTARG:-};;
  h)    printf "\n${HELP}\n"; exit;;
  \?)   printf "\nBad usage!\n${USAGE}\n"; exit 1;;
  esac
done 2>/dev/null

cmd="ansible-playbook -i inventory ${service:-site}.yml --tags '${tags:-epel,install,init,unseal,configure,approle}'"

printf "\n${cmd}\n"
eval ${cmd}

