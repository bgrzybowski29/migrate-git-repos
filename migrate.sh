file="repos"
lines=`cat $file`
for line in $lines; do
  A="$(cut -d',' -f1 <<<"$line")"
  B="$(cut -d',' -f2 <<<"$line")"
  echo "creating $B"
  git clone $A.git
  cd $B
  hub create -p
  git remote add gh https://github.com/bgrzybowski29/$B
  git push gh master
  cd ..
  rm -rf $B
done
