#!/usr/bin/env bash

function stub_yarn_test() {
  replacement_text='"test": "exit 0"'
  file="$PWD/package.json"
  test_line=8
  sed -i.bak "${test_line}s/.*/${replacement_text}/" $file && rm $file.bak
}

function restore_yarn_test() {
  replacement_text='     "test": "exit 1"'
  file="$PWD/package.json"
  test_line=8
  sed -i.bak "${test_line}s/.*/${replacement_text}/" $file && rm $file.bak
}

function remove_created_commit() {
  git reset --hard HEAD~ &> /dev/null
}

# it should display message when no package are updated
# given
current_dir=$PWD
directory_under_test='./yarn-directory'
expected_output="Package               Old          New
--------------------------------------
lodash            4.17.19      4.17.20"
expected_commit_message="Bump lodash from 4.17.19 to 4.17.20"

cd $directory_under_test || exit
{ npm install --quiet lodash@4.17.19  &> /dev/null; } 2>&1
stub_yarn_test

# when
result=$(/bin/bash ../../yarn-bump | tail -n 4)
commit_message=$(git log -1 --pretty=%B)

restore_yarn_test
cd "$current_dir" || exit

# then
if [[ "$commit_message" = "$expected_commit_message" ]]; then
  remove_created_commit
else
  exit 1
fi

if [[ "$result" = "$expected_output" ]]; then
  exit 0
else
  exit 1
fi
