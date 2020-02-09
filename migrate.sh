#data
file="repos2"
#read the file into an array
lines=`cat $file`
#loop
for line in $lines; do
  #format of each line is url,projname. this will get each in a variable
  A="$(cut -d',' -f1 <<<"$line")"
  B="$(cut -d',' -f2 <<<"$line")"
  echo "creating $B"
  #clone the proj to local
  git clone $A.git
  #change dir to the the proj
  cd $B
  #create the proj in your own GitHub, not enterprise
  hub create -p
  #add the remote repo you just created
  git remote add gh https://github.com/bgrzybowski29/$B
  #push proj to the remote repo(your own GitHub).
  git push gh master
  #change back one folder
  cd ..
  #remove the local folder\repo
  rm -rf $B
done
