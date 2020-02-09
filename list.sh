#data
file="repos"
#read the file into an array
lines=`cat $file`
#loop
for line in $lines; do
  #format of each line is url,projname. this will get each in a variable
  A="$(cut -d',' -f1 <<<"$line")"
  B="$(cut -d',' -f2 <<<"$line")"
  echo "$B"
done