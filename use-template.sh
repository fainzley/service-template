#!/bin/bash

bold='\033[0m\033[1m'     # Bold
normal='\033[0m'          # Normal
cyan='\033[0;36m'         # Regular cyan
bred='\033[1;31m'         # Bold red
bgreen='\033[1;32m'       # Bold green
bcyan='\033[1;36m'        # Bold cyan

tick='\xE2\x9C\x94'
cross='\xE2\x9C\x98'
asterisk='\xE2\x9C\xA4'

printf "${bold}This script will edit the files in the template for you.\n\n"

printf "${bgreen}? ${bold}README.md title (e.g. 'Service Name'): ${cyan}"
read title
printf "${bgreen}? ${bold}Repository name (e.g. 'service-name'): ${cyan}"
read name
printf "${bgreen}? ${bold}Service description: ${cyan}"
read desc

printf "\n"

# replace a pattern in a file and print a description if it is successful
replaceInFile() {
  FILE=$1
  PATTERN=$2
  DESCRIPTION=$3

  sed -i "" -e "${PATTERN}" $FILE >/dev/null
  if [ $? -eq 0 ]; then
    printf "${bgreen}${tick} ${bold}${DESCRIPTION} in ${bcyan}${FILE}${bold}.\n"
  else
    printf "${bred}${cross} ${bold}Could not edit ${bcyan}${FILE}${bold}.\n"
    exit 1
  fi
}

replaceInFile "package-lock.json" "s/service-template/${name}/g" "Changed project name, repository URL, and homepage URL"
replaceInFile "package.json" "s/service-template/${name}/g" "Changed project name, repository URL, and homepage URL"
replaceInFile "package.json" "s/A template for micro-services deployed to AWS with Pulumi/${desc}/g" "Changed project description"
replaceInFile "package.json" "/use-template/d" "Remove init-template script"

mv -f README.template.md README.md
if [ $? -eq 0 ]; then
  printf "${bgreen}${tick} ${bold}Updated ${bcyan}README.md${bold} to use the template.\n"
else
  printf "${bred}${cross} ${bold}Could not edit ${bcyan}README.md${bold}.\n"
  exit 1
fi

replaceInFile "README.md" "s/Service Name Title/${title}/g" "Changed the title"
replaceInFile "README.md" "s/A template for micro-services deployed to AWS with Pulumi/${desc}/g" "Changed the project description"

# remove npm command to init-template and the init-template script itselt
rm use-template.sh
printf "${bgreen}${tick} ${bold}Removed the use-template.sh script.\n"

git remote remove origin
printf "${bgreen}${tick} ${bold}Removed the git remote.\n"

printf "\n${bgreen}${asterisk} ${bold}All done. You can now add a new remote, commit and push like so:\n"
printf "\n${bold}git remote add origin new-remote-url\n"
printf "${bold}git add --all\n"
printf "${bold}git push -u origin master\n\n"
