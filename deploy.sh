#!/usr/bin/sh

scriptname=$(basename $0)
envfile="./env_rc.sh"		# Change this value to save using -e option every time, or populate this file to use it
USAGE="Usage : ${scriptname} [-e env_file] [-s <service>] [-t tag1,tag2,tag3] [-m tag1,tag2,tag3] [-i inventory file/dir] [-n] [-h]"
HELP="Deploy, manage or destroy HA consul + vault environment.

${USAGE}\n
  -e = File to source for environment variables (defaults to supplied empty file [./env_rc.sh])
  -s = Service name [consul|vault|haproxy] (Optional - all if omitted)
  -t = Tags [tag1,tag2,tag3] (Optional - all necessary tags for full deployment if omitted)
  -m = Skip [tag1,tag2,tag3] (Optional - no tags skipped if omitted)
  -i = Inventory source (defaults to ./inv.d as defined in ansible.cfg)
  -n = No execution, just display the ansible command that would run
  -h = Show usage

Examples\n
1) Deploy complete consul + vault + HAProxy environment (all necessary terraform data located in defalt env file)

   ./deploy.sh

   Equivalent to running \"ansible-playbook playbooks/site.yml --tags 'epel,install,terraform,init,unseal,configure,approle,sshkeysign'\"

2) Stop consul service on all consul hosts

   ./deploy -s consul -t stop

   Equivalent to running \"ansible-playbook playbooks/consul.yml --tags 'stop'\"

3) Remove complete consul + vault + HAProxy environment

  ./deploy -t 'remove'

  Equivalent to running \"ansible-playbook playbooks/site.yml --tags 'remove'\"

4) Deploy complete consul + vault + HAProxy environment on Digital Ocean only (all necessary terraform data located in defalt env file)

  ./deploy.sh -i inv.d/digitalocean

  Equivalent to running \"ansible-playbook playbooks/site.yml -i inv.d/digitalocean --tags 'epel,install,terraform,init,unseal,configure,approle,sshkeysign'\"
"

while getopts e:s:t:m:i:nh name
do
  case ${name} in
  e)	envfile=${OPTARG};;
  s)    service=${OPTARG};;
  t)	tags=${OPTARG:-};;
  m)	skip=${OPTARG:-};;
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

#cmd="ansible-playbook playbooks/${service:-site}.yml ${inventory:+"-i ${inventory} "}--tags '${tags:-epel,install,terraform,init,unseal,configure,approle,sshkeysign}' ${skip:+"--skip-tags ${skip} "}"
cmd="ansible-playbook playbooks/${service:-site}.yml ${inventory:+"-i ${inventory} "}${tags:+"--tags ${tags} "}${skip:+"--skip-tags ${skip} "}"

printf "\n${cmd}\n"
[[ -z ${norun} ]] && eval ${cmd} || printf "\n"

