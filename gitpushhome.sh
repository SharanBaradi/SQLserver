git add .
echo "enter message for commit"
read n
echo $n
git commit -m "$n"
git push origin master