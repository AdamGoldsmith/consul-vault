#!/bin/bash

scriptname=$(basename "$0")
USAGE="Usage : ${scriptname} [-s <service>] [-t tag1,tag2,tag3] [-n] [-h]"
HELP="Deploy, manage or destroy HA consul + vault environment.

${USAGE}\n
  -s = Service name [consul|vault|haproxy] (Optional - all if omitted)
  -t = Tags [tag1,tag2,tag3] (Optional - all necessary tags for full deployment if omitted)
  -n = No execution, just display the ansible command that would run
  -h = Show usage

Examples\n
1) Deploy complete consul + vault + HAProxy environment

   ./deploy.sh

   Equivalent to running \"ansible-playbook playbooks/site.yml --tags 'epel,install,init,unseal,configure,approle,sshkeysign'\"

2) Stop consul service on all consul hosts

   ./deploy -s consul -t stop

   Equivalent to running \"ansible-playbook playbooks/consul.yml --tags 'stop'\"

3) Remove complete consul + vault + HAProxy environment

  ./deploy -t 'remove'

  Equivalent to running \"ansible-playbook playbooks/site.yml --tags 'remove'\"
"

while getopts s:t:nh name
do
  case ${name} in
  s)    service=${OPTARG};;
  t)	tags=${OPTARG:-};;
  n)	norun=1;;
  h)	printf "\n%s\n" "${HELP}"; exit;;
  \?)	printf "\nBad usage!\n\n%s\n\n" "${USAGE}"; exit 1;;
  esac
done 2>/dev/null

[[ -n "${tags}" ]] && cmd_tags=" --tags ${tags}"
cmd="ansible-playbook playbooks/${service:-site}.yml${cmd_tags}"

printf "\n%s\n" "${cmd}"
[[ -z ${norun} ]] && eval "${cmd}" || printf "\n"

