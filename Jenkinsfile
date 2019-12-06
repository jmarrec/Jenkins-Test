//Jenkins pipelines are stored in shared libaries. Please see: https://github.com/NREL/nrel_cbci_jenkins_libs

@Library('cbci_shared_libs@OpenStudio-resources-CI') _

// We are using the pipeline-github Jenkins plugin
// And we use pullRequest in there, so we need to test whether we are in a PR context
// cf: https://github.com/jenkinsci/pipeline-github-plugin#usage-1

echo "CHANGE_ID=${env.CHANGE_ID}"
echo "CHANGE_TARGET=${env.CHANGE_TARGET}"

def pr_pattern = ~/Companion Pull Request: https:\/\/github\.com\/NREL\/OpenStudio\/pull\/(\d{4,})/
def pr_matcher = pullRequest.body =~ pr_pattern
String pr_number;
if (pr_matcher.find()) {
  pr_number = pr_matcher[0][1];
} else {
  pr_number = "PR_NOT_FOUND";
}

def branch_pattern = ~/Branch: (develop3?)/
def branch_matcher = pullRequest.body =~ branch_pattern
String os_branch;
if (branch_matcher.find()) {
  os_branch = branch_matcher[0][1];
} else {
  os_branch = "BRANCH_NOT_FOUND";
}

echo "pr_number=${pr_number}, os_branch=${os_branch}";

if (env.CHANGE_ID) {
  openstudio_resources()
}
