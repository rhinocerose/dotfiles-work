while read line
do
       sudo apt install -y $line
done < $1
