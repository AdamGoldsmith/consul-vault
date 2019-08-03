#!/usr/bin/sh

scriptname=$(basename $0)
envfile="./env_rc.sh"		# Change this value to save using -e option every time, or populate this file to use it
USAGE="Usage : ${scriptname} [-e env_file] [-s <service>] [-t tag1,tag2,tag3] [-i inventory file/dir] [-n] [-h]"
HELP="Deploy, manage or destroy HA consul + vault environment.

${USAGE}\n
  -e = File to source for environment variables (defaults to supplied empty file [./env_rc.sh])
  -s = Service name [consul|vault|haproxy] (Optional - all if omitted)
  -t = Tags [tag1,tag2,tag3] (Optional - all necessary tags for full deployment if omitted)
  -i = Inventory source (defaults to ./inv.d as defined in ansible.cfg)
  -n = No execution, just display the ansible command that would run
  -h = Show usage

Examples\n
1) Deploy complete consul + vault + HAProxy environment

   ./deploy.sh

   Equivalent to running \"ansible-playbook playbooks/site.yml --tags 'epel,install,terraform,init,unseal,configure,approle,sshkeysign'\"

2) Stop consul service on all consul hosts

   ./deploy -s consul -t stop

   Equivalent to running \"ansible-playbook playbooks/consul.yml --tags 'stop'\"

3) Remove complete consul + vault + HAProxy environment

  ./deploy -t 'remove'

  Equivalent to running \"ansible-playbook playbooks/site.yml --tags 'remove'\"
"

while getopts e:s:t:i:nh name
do
  case ${name} in
  e)	envfile=${OPTARG};;
  s)    service=${OPTARG};;
  t)	tags=${OPTARG:-};;
  i)	inventory=${OPTARG};;
  n)	norun=1;;
  h)    printf "\n${HELP}\n"; exit;;
  \?)   printf "\nBad usage!\n${USAGE}\n"; exit 1;;
  esac
done 2>/dev/null

if [[ -r ${envfile} ]]
then
  printf "\nSourcing environment file: ${envfile}\n"
  . ${envfile}
fi

if [[ -n ${inventory} && ! -e ${inventory} ]]
then
  printf "\nSpecified inventory file or directory does not exist! (${inventory})\n\n"
  exit 1
fi

cmd="ansible-playbook playbooks/${service:-site}.yml ${inventory:+"-i ${inventory} "}--tags '${tags:-epel,install,terraform,init,unseal,configure,approle,sshkeysign}'"

printf "\n${cmd}\n"
[[ -z ${norun} ]] && eval ${cmd} || printf "\n"

