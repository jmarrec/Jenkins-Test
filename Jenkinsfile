//Jenkins pipelines are stored in shared libaries. Please see: https://github.com/NREL/nrel_cbci_jenkins_libs

@Library('cbci_shared_libs@code_reuse2') _

echo "CHANGE_ID=${env.CHANGE_ID}"
echo "CHANGE_TARGET=${env.CHANGE_TARGET}"
echo "env=${env}"

echo "Calling test_code_reuse"

test_code_reuse()
