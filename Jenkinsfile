//Jenkins pipelines are stored in shared libaries. Please see: https://github.com/NREL/nrel_cbci_jenkins_libs

@Library('cbci_shared_libs@code_reuse2') _

// We are using the pipeline-github Jenkins plugin
// And we use pullRequest in there, so we need to test whether we are in a PR context
// cf: https://github.com/jenkinsci/pipeline-github-plugin#usage-1

echo "CHANGE_ID=${env.CHANGE_ID}"
echo "CHANGE_TARGET=${env.CHANGE_TARGET}"

if (env.CHANGE_ID) {

  echo "Calling test_code_reuse"

  test_code_reuse()
}
