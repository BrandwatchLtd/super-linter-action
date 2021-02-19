#!/usr/bin/env bash

RUN_LOCAL="${RUN_LOCAL}" 

if [ -z "${RUN_LOCAL}" ]; then
    RUN_LOCAL='false'
fi
RUN_LOCAL="${RUN_LOCAL,,}"
if [[ ${RUN_LOCAL} != "false" ]]; then
	GITHUB_WORKSPACE="/tmp/lint/"
fi

export OUTPUT_DETAILS=detailed
export OUTPUT_FORMAT=tap
export DISABLE_ERRORS=true
mkdir super-linter.report 

echo "Workspace path: $GITHUB_WORKSPACE"
RELATIVE_RULES_PATH=$(realpath --relative-to=${GITHUB_WORKSPACE} /rules/)
echo "Rules path relative to workspace: $RELATIVE_RULES_PATH"
export LINTER_RULES_PATH=$RELATIVE_RULES_PATH
/action/lib/linter.sh
echo "Report dir contents"
ls super-linter.report
cat super-linter.report/super-linter-JAVA.tap
