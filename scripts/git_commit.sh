#!/bin/bash
set -e

current_branch=$(git branch | grep \* | cut -d ' ' -f2)
jira_task_regex="^[A-Z]+-[0-9]+$"
git_commit_message_prefix=""

[[ $current_branch =~ $jira_task_regex ]] && git_commit_message_prefix="[$current_branch] "

git commit -m "${git_commit_message_prefix}${1}" -m "$2"
