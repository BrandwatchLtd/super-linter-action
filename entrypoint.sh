#!/usr/bin/env bash

RUN_LOCAL="${RUN_LOCAL}" 

if [ -z "${RUN_LOCAL}" ]; then
    RUN_LOCAL='false'
fi
RUN_LOCAL="${RUN_LOCAL,,}"
if [[ ${RUN_LOCAL} != "false" ]]; then
	GITHUB_WORKSPACE="/tmp/lint/"
fi

echo "Workspace path: $GITHUB_WORKSPACE"
RELATIVE_RULES_PATH=$(realpath --relative-to=${GITHUB_WORKSPACE} /rules/)
echo "Rules path relative to workspace: $RELATIVE_RULES_PATH"
export LINTER_RULES_PATH=$RELATIVE_RULES_PATH
echo "Debugging Git Start!!!!!!!!!!!!!!!!!!!!"
git branch -a
git --no-pager log --oneline | head -n 20
echo "Debugging Git End!!!!!!!!!!!!!!!!!!!!"
/action/lib/linter.sh
