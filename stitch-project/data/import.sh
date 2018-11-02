HOST=''
DATABASE=''
COLLECTION=''
USER=''
PASSWORD=''
FILE=''
verbose='false'

print_usage() {
  printf "This script was created to automate the import process for mongoimport. Please specify the following values on the command line using the arguments -h -d -u -f -p\n"
  printf "Usage:\n"
  printf "  -d <database>\n"
  printf "  -c <collection\n"
  printf "  -u <user>\n"
  printf "  -p <password>\n"
}

while getopts 'u:p:h:d:c:f:v' flag; do
  case "${flag}" in
    h) HOST=${OPTARG} ;;
    d) DATABASE=${OPTARG} ;;
    c) COLLECTION="${OPTARG}" ;;
    u) USER="${OPTARG}" ;;
    f) FILE="${OPTARG}" ;;
    p) PASSWORD="${OPTARG}" ;;
    v) VERBOSE='true' ;;
    *) print_usage
       exit 1 ;;
   esac
done
if [ -z $USER -o -z $DATABASE ]; then
   print_usage
   exit 1;
fi
   echo "DATABASE: ${DATABASE}"
   echo "COLLECTION: ${COLLECTION}"
   echo "USER: ${USER}"
   echo "PASSWORD: ${PASSWORD}"
   echo "FILE: ${FILE}"
   echo

echo mongoimport --host ${CLUSTER} --ssl --username ${USER} --password ${PASSWORD} --authenticationDatabase admin --db ${DATABASE} --collection ${COLLECTION} --type csv --file ${FILE} --headerline
mongoimport --host ${CLUSTER} --ssl --username ${USER} --password ${PASSWORD} --authenticationDatabase admin --db ${DATABASE} --collection ${COLLECTION} --type csv --file ${FILE} --headerline
