#!/usr/bin/env bash
all_modules=($(./gradlew projects | grep -oh "':.*" | tr -d \'\:))


str="<!DOCTYPE html>
<html>
<body>

<h1>Amazing report website</h1>"

for project in ${all_modules[@]}; do
  proj=($(echo $project | tr -d '\r' ))
  aws s3 cp ./$proj/build/reports/ s3://demo-reports-devops-demo/$proj --acl public-read --recursive > /dev/null
  #splitPath=(${path//\// }) # Splits on /
  #module=${splitPath[0]}
  str=$str"
  <h3>$proj</h3>
  <p><a href="$proj/pmd/main.html">pmd</a></p>
  <p><a href="$proj/checkstyle/main.html">checkstyle</a></p>
  <p><a href="$proj/spotbugs/main.xml">spotbugs</a></p>
  <p><a href="$proj/tests/test/index.html">unit tests</a></p
  "
  for filename in `find ./$proj/build/reports/pitest/ -maxdepth 1 -mindepth 1 -type d`; do
      IFS='/' read -r -a array <<< "$filename"
      str=$str"<p><a href="$proj/pitest/${array[-1]}/index.html">pitest ${array[-1]} </a></p>"
  done
  str=$str
done
str=$str"
</body>
</html>
"
echo $str > index.html
aws s3 cp index.html s3://demo-reports-devops-demo/index.html --acl public-read > /dev/null
rm index.html
