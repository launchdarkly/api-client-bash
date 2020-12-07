#!/usr/bin/env bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! swagger-codegen (https://github.com/swagger-api/swagger-codegen)
# ! FROM SWAGGER SPECIFICATION IN JSON.
# !
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#
# This is a Bash client for LaunchDarkly REST API.
#
# LICENSE:
# http://www.apache.org/licenses/LICENSE-2.0.html
#
# CONTACT:
# support@launchdarkly.com
#
# MORE INFORMATION:
# 
#

# For improved pattern matching in case statemets
shopt -s extglob

###############################################################################
#
# Make sure Bash is at least in version 4.3
#
###############################################################################
if ! ( (("${BASH_VERSION:0:1}" == "4")) && (("${BASH_VERSION:2:1}" >= "3")) ) \
  && ! (("${BASH_VERSION:0:1}" >= "5")); then
    echo ""
    echo "Sorry - your Bash version is ${BASH_VERSION}"
    echo ""
    echo "You need at least Bash 4.3 to run this script."
    echo ""
    exit 1
fi

###############################################################################
#
# Global variables
#
###############################################################################

##
# The filename of this script for help messages
script_name=$(basename "$0")

##
# Map for headers passed after operation as KEY:VALUE
declare -A header_arguments


##
# Map for operation parameters passed after operation as PARAMETER=VALUE
# These will be mapped to appropriate path or query parameters
# The values in operation_parameters are arrays, so that multiple values
# can be provided for the same parameter if allowed by API specification
declare -A operation_parameters

##
# Declare colors with autodection if output is terminal
if [ -t 1 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    MAGENTA="$(tput setaf 5)"
    CYAN="$(tput setaf 6)"
    WHITE="$(tput setaf 7)"
    BOLD="$(tput bold)"
    OFF="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    MAGENTA=""
    CYAN=""
    WHITE=""
    BOLD=""
    OFF=""
fi

declare -a result_color_table=( "$WHITE" "$WHITE" "$GREEN" "$YELLOW" "$WHITE" "$MAGENTA" "$WHITE" )

##
# This array stores the minimum number of required occurrences for parameter
# 0 - optional
# 1 - required
declare -A operation_parameters_minimum_occurrences
operation_parameters_minimum_occurrences["deleteToken:::tokenId"]=1
operation_parameters_minimum_occurrences["getToken:::tokenId"]=1
operation_parameters_minimum_occurrences["getTokens:::showAll"]=0
operation_parameters_minimum_occurrences["patchToken:::tokenId"]=1
operation_parameters_minimum_occurrences["patchToken:::patchDelta"]=1
operation_parameters_minimum_occurrences["postToken:::tokenBody"]=1
operation_parameters_minimum_occurrences["resetToken:::tokenId"]=1
operation_parameters_minimum_occurrences["resetToken:::expiry"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::before"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::after"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::q"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::limit"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::spec"]=0
operation_parameters_minimum_occurrences["getAuditLogEntry:::resourceId"]=1
operation_parameters_minimum_occurrences["deleteCustomRole:::customRoleKey"]=1
operation_parameters_minimum_occurrences["getCustomRole:::customRoleKey"]=1
operation_parameters_minimum_occurrences["patchCustomRole:::customRoleKey"]=1
operation_parameters_minimum_occurrences["patchCustomRole:::patchDelta"]=1
operation_parameters_minimum_occurrences["postCustomRole:::customRoleBody"]=1
operation_parameters_minimum_occurrences["getEvaluations:::envId"]=1
operation_parameters_minimum_occurrences["getEvaluations:::flagKey"]=1
operation_parameters_minimum_occurrences["getEvent:::type"]=1
operation_parameters_minimum_occurrences["getStream:::source"]=1
operation_parameters_minimum_occurrences["getStreamBySDK:::source"]=1
operation_parameters_minimum_occurrences["getStreamSDKVersion:::source"]=1
operation_parameters_minimum_occurrences["deleteDestination:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteDestination:::environmentKey"]=1
operation_parameters_minimum_occurrences["deleteDestination:::destinationId"]=1
operation_parameters_minimum_occurrences["getDestination:::projectKey"]=1
operation_parameters_minimum_occurrences["getDestination:::environmentKey"]=1
operation_parameters_minimum_occurrences["getDestination:::destinationId"]=1
operation_parameters_minimum_occurrences["patchDestination:::projectKey"]=1
operation_parameters_minimum_occurrences["patchDestination:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchDestination:::destinationId"]=1
operation_parameters_minimum_occurrences["patchDestination:::PatchOnly"]=1
operation_parameters_minimum_occurrences["postDestination:::projectKey"]=1
operation_parameters_minimum_occurrences["postDestination:::environmentKey"]=1
operation_parameters_minimum_occurrences["postDestination:::destinationBody"]=1
operation_parameters_minimum_occurrences["deleteEnvironment:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteEnvironment:::environmentKey"]=1
operation_parameters_minimum_occurrences["getEnvironment:::projectKey"]=1
operation_parameters_minimum_occurrences["getEnvironment:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchEnvironment:::projectKey"]=1
operation_parameters_minimum_occurrences["patchEnvironment:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchEnvironment:::patchDelta"]=1
operation_parameters_minimum_occurrences["postEnvironment:::projectKey"]=1
operation_parameters_minimum_occurrences["postEnvironment:::environmentBody"]=1
operation_parameters_minimum_occurrences["resetEnvironmentMobileKey:::projectKey"]=1
operation_parameters_minimum_occurrences["resetEnvironmentMobileKey:::environmentKey"]=1
operation_parameters_minimum_occurrences["resetEnvironmentMobileKey:::expiry"]=0
operation_parameters_minimum_occurrences["resetEnvironmentSDKKey:::projectKey"]=1
operation_parameters_minimum_occurrences["resetEnvironmentSDKKey:::environmentKey"]=1
operation_parameters_minimum_occurrences["resetEnvironmentSDKKey:::expiry"]=0
operation_parameters_minimum_occurrences["copyFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["copyFeatureFlag:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["copyFeatureFlag:::featureFlagCopyBody"]=1
operation_parameters_minimum_occurrences["deleteFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteFeatureFlag:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargets:::projectKey"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargets:::environmentKey"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargets:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlag:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlag:::env"]=0
operation_parameters_minimum_occurrences["getFeatureFlagChangeRequest:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagChangeRequest:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagChangeRequest:::environmentKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=1
operation_parameters_minimum_occurrences["getFeatureFlagChangeRequests:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagChangeRequests:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagChangeRequests:::environmentKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatus:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatus:::environmentKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatus:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatusAcrossEnvironments:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatusAcrossEnvironments:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatuses:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatuses:::environmentKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlags:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlags:::env"]=0
operation_parameters_minimum_occurrences["getFeatureFlags:::summary"]=0
operation_parameters_minimum_occurrences["getFeatureFlags:::archived"]=0
operation_parameters_minimum_occurrences["getFeatureFlags:::limit"]=0
operation_parameters_minimum_occurrences["getFeatureFlags:::offset"]=0
operation_parameters_minimum_occurrences["getFeatureFlags:::filter"]=0
operation_parameters_minimum_occurrences["getFeatureFlags:::sort"]=0
operation_parameters_minimum_occurrences["getFeatureFlags:::tag"]=0
operation_parameters_minimum_occurrences["patchExpiringUserTargets:::projectKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargets:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargets:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargets:::SemanticPatchWithComment"]=1
operation_parameters_minimum_occurrences["patchFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["patchFeatureFlag:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["patchFeatureFlag:::patchComment"]=1
operation_parameters_minimum_occurrences["postApplyFeatureFlagChangeRequest:::projectKey"]=1
operation_parameters_minimum_occurrences["postApplyFeatureFlagChangeRequest:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["postApplyFeatureFlagChangeRequest:::environmentKey"]=1
operation_parameters_minimum_occurrences["postApplyFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=1
operation_parameters_minimum_occurrences["postApplyFeatureFlagChangeRequest:::featureFlagChangeRequestApplyConfigBody"]=1
operation_parameters_minimum_occurrences["postFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["postFeatureFlag:::featureFlagBody"]=1
operation_parameters_minimum_occurrences["postFeatureFlag:::clone"]=0
operation_parameters_minimum_occurrences["postFeatureFlagChangeRequest:::projectKey"]=1
operation_parameters_minimum_occurrences["postFeatureFlagChangeRequest:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["postFeatureFlagChangeRequest:::environmentKey"]=1
operation_parameters_minimum_occurrences["postFeatureFlagChangeRequest:::featureFlagChangeRequestConfigBody"]=0
operation_parameters_minimum_occurrences["postReviewFeatureFlagChangeRequest:::projectKey"]=1
operation_parameters_minimum_occurrences["postReviewFeatureFlagChangeRequest:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["postReviewFeatureFlagChangeRequest:::environmentKey"]=1
operation_parameters_minimum_occurrences["postReviewFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=1
operation_parameters_minimum_occurrences["postReviewFeatureFlagChangeRequest:::featureFlagChangeRequestReviewConfigBody"]=1
operation_parameters_minimum_occurrences["deleteIntegrationSubscription:::integrationKey"]=1
operation_parameters_minimum_occurrences["deleteIntegrationSubscription:::integrationId"]=1
operation_parameters_minimum_occurrences["getIntegrationSubscription:::integrationKey"]=1
operation_parameters_minimum_occurrences["getIntegrationSubscription:::integrationId"]=1
operation_parameters_minimum_occurrences["getIntegrationSubscriptions:::integrationKey"]=1
operation_parameters_minimum_occurrences["patchIntegrationSubscription:::integrationKey"]=1
operation_parameters_minimum_occurrences["patchIntegrationSubscription:::integrationId"]=1
operation_parameters_minimum_occurrences["patchIntegrationSubscription:::patchDelta"]=1
operation_parameters_minimum_occurrences["postIntegrationSubscription:::integrationKey"]=1
operation_parameters_minimum_occurrences["postIntegrationSubscription:::subscriptionBody"]=1
operation_parameters_minimum_occurrences["deleteProject:::projectKey"]=1
operation_parameters_minimum_occurrences["getProject:::projectKey"]=1
operation_parameters_minimum_occurrences["patchProject:::projectKey"]=1
operation_parameters_minimum_occurrences["patchProject:::patchDelta"]=1
operation_parameters_minimum_occurrences["postProject:::projectBody"]=1
operation_parameters_minimum_occurrences["deleteRelayProxyConfig:::id"]=1
operation_parameters_minimum_occurrences["getRelayProxyConfig:::id"]=1
operation_parameters_minimum_occurrences["patchRelayProxyConfig:::id"]=1
operation_parameters_minimum_occurrences["patchRelayProxyConfig:::patchDelta"]=1
operation_parameters_minimum_occurrences["postRelayAutoConfig:::relayProxyConfigBody"]=1
operation_parameters_minimum_occurrences["resetRelayProxyConfig:::id"]=1
operation_parameters_minimum_occurrences["resetRelayProxyConfig:::expiry"]=0
operation_parameters_minimum_occurrences["deleteMember:::memberId"]=1
operation_parameters_minimum_occurrences["getMember:::memberId"]=1
operation_parameters_minimum_occurrences["getMembers:::limit"]=0
operation_parameters_minimum_occurrences["getMembers:::offset"]=0
operation_parameters_minimum_occurrences["getMembers:::filter"]=0
operation_parameters_minimum_occurrences["getMembers:::sort"]=0
operation_parameters_minimum_occurrences["patchMember:::memberId"]=1
operation_parameters_minimum_occurrences["patchMember:::patchDelta"]=1
operation_parameters_minimum_occurrences["postMembers:::membersBody"]=1
operation_parameters_minimum_occurrences["deleteUserSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteUserSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["deleteUserSegment:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargetsOnSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargetsOnSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargetsOnSegment:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["getUserSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["getUserSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUserSegment:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["getUserSegments:::projectKey"]=1
operation_parameters_minimum_occurrences["getUserSegments:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUserSegments:::tag"]=0
operation_parameters_minimum_occurrences["patchExpiringUserTargetsOnSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargetsOnSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargetsOnSegment:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargetsOnSegment:::SemanticPatchWithComment"]=1
operation_parameters_minimum_occurrences["patchUserSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["patchUserSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchUserSegment:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["patchUserSegment:::PatchOnly"]=1
operation_parameters_minimum_occurrences["postUserSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["postUserSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["postUserSegment:::userSegmentBody"]=1
operation_parameters_minimum_occurrences["updatedUnboundedSegmentTargets:::projectKey"]=1
operation_parameters_minimum_occurrences["updatedUnboundedSegmentTargets:::environmentKey"]=1
operation_parameters_minimum_occurrences["updatedUnboundedSegmentTargets:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["updatedUnboundedSegmentTargets:::unboundedSegmentTargetsBody"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargetsForUser:::projectKey"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargetsForUser:::environmentKey"]=1
operation_parameters_minimum_occurrences["getExpiringUserTargetsForUser:::userKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSetting:::projectKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSetting:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSetting:::userKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSetting:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSettings:::projectKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSettings:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSettings:::userKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargetsForFlags:::projectKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargetsForFlags:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargetsForFlags:::userKey"]=1
operation_parameters_minimum_occurrences["patchExpiringUserTargetsForFlags:::SemanticPatchWithComment"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::projectKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::environmentKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::userKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::userSettingsBody"]=1
operation_parameters_minimum_occurrences["deleteUser:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteUser:::environmentKey"]=1
operation_parameters_minimum_occurrences["deleteUser:::userKey"]=1
operation_parameters_minimum_occurrences["getSearchUsers:::projectKey"]=1
operation_parameters_minimum_occurrences["getSearchUsers:::environmentKey"]=1
operation_parameters_minimum_occurrences["getSearchUsers:::q"]=0
operation_parameters_minimum_occurrences["getSearchUsers:::limit"]=0
operation_parameters_minimum_occurrences["getSearchUsers:::offset"]=0
operation_parameters_minimum_occurrences["getSearchUsers:::after"]=0
operation_parameters_minimum_occurrences["getUser:::projectKey"]=1
operation_parameters_minimum_occurrences["getUser:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUser:::userKey"]=1
operation_parameters_minimum_occurrences["getUsers:::projectKey"]=1
operation_parameters_minimum_occurrences["getUsers:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUsers:::limit"]=0
operation_parameters_minimum_occurrences["getUsers:::h"]=0
operation_parameters_minimum_occurrences["getUsers:::scrollId"]=0
operation_parameters_minimum_occurrences["deleteWebhook:::resourceId"]=1
operation_parameters_minimum_occurrences["getWebhook:::resourceId"]=1
operation_parameters_minimum_occurrences["patchWebhook:::resourceId"]=1
operation_parameters_minimum_occurrences["patchWebhook:::patchDelta"]=1
operation_parameters_minimum_occurrences["postWebhook:::webhookBody"]=1

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["deleteToken:::tokenId"]=0
operation_parameters_maximum_occurrences["getToken:::tokenId"]=0
operation_parameters_maximum_occurrences["getTokens:::showAll"]=0
operation_parameters_maximum_occurrences["patchToken:::tokenId"]=0
operation_parameters_maximum_occurrences["patchToken:::patchDelta"]=0
operation_parameters_maximum_occurrences["postToken:::tokenBody"]=0
operation_parameters_maximum_occurrences["resetToken:::tokenId"]=0
operation_parameters_maximum_occurrences["resetToken:::expiry"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::before"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::after"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::q"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::limit"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::spec"]=0
operation_parameters_maximum_occurrences["getAuditLogEntry:::resourceId"]=0
operation_parameters_maximum_occurrences["deleteCustomRole:::customRoleKey"]=0
operation_parameters_maximum_occurrences["getCustomRole:::customRoleKey"]=0
operation_parameters_maximum_occurrences["patchCustomRole:::customRoleKey"]=0
operation_parameters_maximum_occurrences["patchCustomRole:::patchDelta"]=0
operation_parameters_maximum_occurrences["postCustomRole:::customRoleBody"]=0
operation_parameters_maximum_occurrences["getEvaluations:::envId"]=0
operation_parameters_maximum_occurrences["getEvaluations:::flagKey"]=0
operation_parameters_maximum_occurrences["getEvent:::type"]=0
operation_parameters_maximum_occurrences["getStream:::source"]=0
operation_parameters_maximum_occurrences["getStreamBySDK:::source"]=0
operation_parameters_maximum_occurrences["getStreamSDKVersion:::source"]=0
operation_parameters_maximum_occurrences["deleteDestination:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteDestination:::environmentKey"]=0
operation_parameters_maximum_occurrences["deleteDestination:::destinationId"]=0
operation_parameters_maximum_occurrences["getDestination:::projectKey"]=0
operation_parameters_maximum_occurrences["getDestination:::environmentKey"]=0
operation_parameters_maximum_occurrences["getDestination:::destinationId"]=0
operation_parameters_maximum_occurrences["patchDestination:::projectKey"]=0
operation_parameters_maximum_occurrences["patchDestination:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchDestination:::destinationId"]=0
operation_parameters_maximum_occurrences["patchDestination:::PatchOnly"]=0
operation_parameters_maximum_occurrences["postDestination:::projectKey"]=0
operation_parameters_maximum_occurrences["postDestination:::environmentKey"]=0
operation_parameters_maximum_occurrences["postDestination:::destinationBody"]=0
operation_parameters_maximum_occurrences["deleteEnvironment:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteEnvironment:::environmentKey"]=0
operation_parameters_maximum_occurrences["getEnvironment:::projectKey"]=0
operation_parameters_maximum_occurrences["getEnvironment:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchEnvironment:::projectKey"]=0
operation_parameters_maximum_occurrences["patchEnvironment:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchEnvironment:::patchDelta"]=0
operation_parameters_maximum_occurrences["postEnvironment:::projectKey"]=0
operation_parameters_maximum_occurrences["postEnvironment:::environmentBody"]=0
operation_parameters_maximum_occurrences["resetEnvironmentMobileKey:::projectKey"]=0
operation_parameters_maximum_occurrences["resetEnvironmentMobileKey:::environmentKey"]=0
operation_parameters_maximum_occurrences["resetEnvironmentMobileKey:::expiry"]=0
operation_parameters_maximum_occurrences["resetEnvironmentSDKKey:::projectKey"]=0
operation_parameters_maximum_occurrences["resetEnvironmentSDKKey:::environmentKey"]=0
operation_parameters_maximum_occurrences["resetEnvironmentSDKKey:::expiry"]=0
operation_parameters_maximum_occurrences["copyFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["copyFeatureFlag:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["copyFeatureFlag:::featureFlagCopyBody"]=0
operation_parameters_maximum_occurrences["deleteFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteFeatureFlag:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargets:::projectKey"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargets:::environmentKey"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargets:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlag:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlag:::env"]=0
operation_parameters_maximum_occurrences["getFeatureFlagChangeRequest:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagChangeRequest:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagChangeRequest:::environmentKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=0
operation_parameters_maximum_occurrences["getFeatureFlagChangeRequests:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagChangeRequests:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagChangeRequests:::environmentKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatus:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatus:::environmentKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatus:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatusAcrossEnvironments:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatusAcrossEnvironments:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatuses:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatuses:::environmentKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::env"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::summary"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::archived"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::limit"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::offset"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::filter"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::sort"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::tag"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargets:::projectKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargets:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargets:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargets:::SemanticPatchWithComment"]=0
operation_parameters_maximum_occurrences["patchFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["patchFeatureFlag:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["patchFeatureFlag:::patchComment"]=0
operation_parameters_maximum_occurrences["postApplyFeatureFlagChangeRequest:::projectKey"]=0
operation_parameters_maximum_occurrences["postApplyFeatureFlagChangeRequest:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["postApplyFeatureFlagChangeRequest:::environmentKey"]=0
operation_parameters_maximum_occurrences["postApplyFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=0
operation_parameters_maximum_occurrences["postApplyFeatureFlagChangeRequest:::featureFlagChangeRequestApplyConfigBody"]=0
operation_parameters_maximum_occurrences["postFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["postFeatureFlag:::featureFlagBody"]=0
operation_parameters_maximum_occurrences["postFeatureFlag:::clone"]=0
operation_parameters_maximum_occurrences["postFeatureFlagChangeRequest:::projectKey"]=0
operation_parameters_maximum_occurrences["postFeatureFlagChangeRequest:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["postFeatureFlagChangeRequest:::environmentKey"]=0
operation_parameters_maximum_occurrences["postFeatureFlagChangeRequest:::featureFlagChangeRequestConfigBody"]=0
operation_parameters_maximum_occurrences["postReviewFeatureFlagChangeRequest:::projectKey"]=0
operation_parameters_maximum_occurrences["postReviewFeatureFlagChangeRequest:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["postReviewFeatureFlagChangeRequest:::environmentKey"]=0
operation_parameters_maximum_occurrences["postReviewFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=0
operation_parameters_maximum_occurrences["postReviewFeatureFlagChangeRequest:::featureFlagChangeRequestReviewConfigBody"]=0
operation_parameters_maximum_occurrences["deleteIntegrationSubscription:::integrationKey"]=0
operation_parameters_maximum_occurrences["deleteIntegrationSubscription:::integrationId"]=0
operation_parameters_maximum_occurrences["getIntegrationSubscription:::integrationKey"]=0
operation_parameters_maximum_occurrences["getIntegrationSubscription:::integrationId"]=0
operation_parameters_maximum_occurrences["getIntegrationSubscriptions:::integrationKey"]=0
operation_parameters_maximum_occurrences["patchIntegrationSubscription:::integrationKey"]=0
operation_parameters_maximum_occurrences["patchIntegrationSubscription:::integrationId"]=0
operation_parameters_maximum_occurrences["patchIntegrationSubscription:::patchDelta"]=0
operation_parameters_maximum_occurrences["postIntegrationSubscription:::integrationKey"]=0
operation_parameters_maximum_occurrences["postIntegrationSubscription:::subscriptionBody"]=0
operation_parameters_maximum_occurrences["deleteProject:::projectKey"]=0
operation_parameters_maximum_occurrences["getProject:::projectKey"]=0
operation_parameters_maximum_occurrences["patchProject:::projectKey"]=0
operation_parameters_maximum_occurrences["patchProject:::patchDelta"]=0
operation_parameters_maximum_occurrences["postProject:::projectBody"]=0
operation_parameters_maximum_occurrences["deleteRelayProxyConfig:::id"]=0
operation_parameters_maximum_occurrences["getRelayProxyConfig:::id"]=0
operation_parameters_maximum_occurrences["patchRelayProxyConfig:::id"]=0
operation_parameters_maximum_occurrences["patchRelayProxyConfig:::patchDelta"]=0
operation_parameters_maximum_occurrences["postRelayAutoConfig:::relayProxyConfigBody"]=0
operation_parameters_maximum_occurrences["resetRelayProxyConfig:::id"]=0
operation_parameters_maximum_occurrences["resetRelayProxyConfig:::expiry"]=0
operation_parameters_maximum_occurrences["deleteMember:::memberId"]=0
operation_parameters_maximum_occurrences["getMember:::memberId"]=0
operation_parameters_maximum_occurrences["getMembers:::limit"]=0
operation_parameters_maximum_occurrences["getMembers:::offset"]=0
operation_parameters_maximum_occurrences["getMembers:::filter"]=0
operation_parameters_maximum_occurrences["getMembers:::sort"]=0
operation_parameters_maximum_occurrences["patchMember:::memberId"]=0
operation_parameters_maximum_occurrences["patchMember:::patchDelta"]=0
operation_parameters_maximum_occurrences["postMembers:::membersBody"]=0
operation_parameters_maximum_occurrences["deleteUserSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteUserSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["deleteUserSegment:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargetsOnSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargetsOnSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargetsOnSegment:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["getUserSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["getUserSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUserSegment:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["getUserSegments:::projectKey"]=0
operation_parameters_maximum_occurrences["getUserSegments:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUserSegments:::tag"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargetsOnSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargetsOnSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargetsOnSegment:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargetsOnSegment:::SemanticPatchWithComment"]=0
operation_parameters_maximum_occurrences["patchUserSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["patchUserSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchUserSegment:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["patchUserSegment:::PatchOnly"]=0
operation_parameters_maximum_occurrences["postUserSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["postUserSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["postUserSegment:::userSegmentBody"]=0
operation_parameters_maximum_occurrences["updatedUnboundedSegmentTargets:::projectKey"]=0
operation_parameters_maximum_occurrences["updatedUnboundedSegmentTargets:::environmentKey"]=0
operation_parameters_maximum_occurrences["updatedUnboundedSegmentTargets:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["updatedUnboundedSegmentTargets:::unboundedSegmentTargetsBody"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargetsForUser:::projectKey"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargetsForUser:::environmentKey"]=0
operation_parameters_maximum_occurrences["getExpiringUserTargetsForUser:::userKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSetting:::projectKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSetting:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSetting:::userKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSetting:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSettings:::projectKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSettings:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSettings:::userKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargetsForFlags:::projectKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargetsForFlags:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargetsForFlags:::userKey"]=0
operation_parameters_maximum_occurrences["patchExpiringUserTargetsForFlags:::SemanticPatchWithComment"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::projectKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::environmentKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::userKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::userSettingsBody"]=0
operation_parameters_maximum_occurrences["deleteUser:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteUser:::environmentKey"]=0
operation_parameters_maximum_occurrences["deleteUser:::userKey"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::projectKey"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::environmentKey"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::q"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::limit"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::offset"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::after"]=0
operation_parameters_maximum_occurrences["getUser:::projectKey"]=0
operation_parameters_maximum_occurrences["getUser:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUser:::userKey"]=0
operation_parameters_maximum_occurrences["getUsers:::projectKey"]=0
operation_parameters_maximum_occurrences["getUsers:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUsers:::limit"]=0
operation_parameters_maximum_occurrences["getUsers:::h"]=0
operation_parameters_maximum_occurrences["getUsers:::scrollId"]=0
operation_parameters_maximum_occurrences["deleteWebhook:::resourceId"]=0
operation_parameters_maximum_occurrences["getWebhook:::resourceId"]=0
operation_parameters_maximum_occurrences["patchWebhook:::resourceId"]=0
operation_parameters_maximum_occurrences["patchWebhook:::patchDelta"]=0
operation_parameters_maximum_occurrences["postWebhook:::webhookBody"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["deleteToken:::tokenId"]=""
operation_parameters_collection_type["getToken:::tokenId"]=""
operation_parameters_collection_type["getTokens:::showAll"]=""
operation_parameters_collection_type["patchToken:::tokenId"]=""
operation_parameters_collection_type["patchToken:::patchDelta"]=
operation_parameters_collection_type["postToken:::tokenBody"]=""
operation_parameters_collection_type["resetToken:::tokenId"]=""
operation_parameters_collection_type["resetToken:::expiry"]=""
operation_parameters_collection_type["getAuditLogEntries:::before"]=""
operation_parameters_collection_type["getAuditLogEntries:::after"]=""
operation_parameters_collection_type["getAuditLogEntries:::q"]=""
operation_parameters_collection_type["getAuditLogEntries:::limit"]=""
operation_parameters_collection_type["getAuditLogEntries:::spec"]=""
operation_parameters_collection_type["getAuditLogEntry:::resourceId"]=""
operation_parameters_collection_type["deleteCustomRole:::customRoleKey"]=""
operation_parameters_collection_type["getCustomRole:::customRoleKey"]=""
operation_parameters_collection_type["patchCustomRole:::customRoleKey"]=""
operation_parameters_collection_type["patchCustomRole:::patchDelta"]=
operation_parameters_collection_type["postCustomRole:::customRoleBody"]=""
operation_parameters_collection_type["getEvaluations:::envId"]=""
operation_parameters_collection_type["getEvaluations:::flagKey"]=""
operation_parameters_collection_type["getEvent:::type"]=""
operation_parameters_collection_type["getStream:::source"]=""
operation_parameters_collection_type["getStreamBySDK:::source"]=""
operation_parameters_collection_type["getStreamSDKVersion:::source"]=""
operation_parameters_collection_type["deleteDestination:::projectKey"]=""
operation_parameters_collection_type["deleteDestination:::environmentKey"]=""
operation_parameters_collection_type["deleteDestination:::destinationId"]=""
operation_parameters_collection_type["getDestination:::projectKey"]=""
operation_parameters_collection_type["getDestination:::environmentKey"]=""
operation_parameters_collection_type["getDestination:::destinationId"]=""
operation_parameters_collection_type["patchDestination:::projectKey"]=""
operation_parameters_collection_type["patchDestination:::environmentKey"]=""
operation_parameters_collection_type["patchDestination:::destinationId"]=""
operation_parameters_collection_type["patchDestination:::PatchOnly"]=
operation_parameters_collection_type["postDestination:::projectKey"]=""
operation_parameters_collection_type["postDestination:::environmentKey"]=""
operation_parameters_collection_type["postDestination:::destinationBody"]=""
operation_parameters_collection_type["deleteEnvironment:::projectKey"]=""
operation_parameters_collection_type["deleteEnvironment:::environmentKey"]=""
operation_parameters_collection_type["getEnvironment:::projectKey"]=""
operation_parameters_collection_type["getEnvironment:::environmentKey"]=""
operation_parameters_collection_type["patchEnvironment:::projectKey"]=""
operation_parameters_collection_type["patchEnvironment:::environmentKey"]=""
operation_parameters_collection_type["patchEnvironment:::patchDelta"]=
operation_parameters_collection_type["postEnvironment:::projectKey"]=""
operation_parameters_collection_type["postEnvironment:::environmentBody"]=""
operation_parameters_collection_type["resetEnvironmentMobileKey:::projectKey"]=""
operation_parameters_collection_type["resetEnvironmentMobileKey:::environmentKey"]=""
operation_parameters_collection_type["resetEnvironmentMobileKey:::expiry"]=""
operation_parameters_collection_type["resetEnvironmentSDKKey:::projectKey"]=""
operation_parameters_collection_type["resetEnvironmentSDKKey:::environmentKey"]=""
operation_parameters_collection_type["resetEnvironmentSDKKey:::expiry"]=""
operation_parameters_collection_type["copyFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["copyFeatureFlag:::featureFlagKey"]=""
operation_parameters_collection_type["copyFeatureFlag:::featureFlagCopyBody"]=""
operation_parameters_collection_type["deleteFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["deleteFeatureFlag:::featureFlagKey"]=""
operation_parameters_collection_type["getExpiringUserTargets:::projectKey"]=""
operation_parameters_collection_type["getExpiringUserTargets:::environmentKey"]=""
operation_parameters_collection_type["getExpiringUserTargets:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlag:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlag:::env"]="multi"
operation_parameters_collection_type["getFeatureFlagChangeRequest:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlagChangeRequest:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlagChangeRequest:::environmentKey"]=""
operation_parameters_collection_type["getFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=""
operation_parameters_collection_type["getFeatureFlagChangeRequests:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlagChangeRequests:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlagChangeRequests:::environmentKey"]=""
operation_parameters_collection_type["getFeatureFlagStatus:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlagStatus:::environmentKey"]=""
operation_parameters_collection_type["getFeatureFlagStatus:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlagStatusAcrossEnvironments:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlagStatusAcrossEnvironments:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlagStatuses:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlagStatuses:::environmentKey"]=""
operation_parameters_collection_type["getFeatureFlags:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlags:::env"]="multi"
operation_parameters_collection_type["getFeatureFlags:::summary"]=""
operation_parameters_collection_type["getFeatureFlags:::archived"]=""
operation_parameters_collection_type["getFeatureFlags:::limit"]=""
operation_parameters_collection_type["getFeatureFlags:::offset"]=""
operation_parameters_collection_type["getFeatureFlags:::filter"]=""
operation_parameters_collection_type["getFeatureFlags:::sort"]=""
operation_parameters_collection_type["getFeatureFlags:::tag"]=""
operation_parameters_collection_type["patchExpiringUserTargets:::projectKey"]=""
operation_parameters_collection_type["patchExpiringUserTargets:::environmentKey"]=""
operation_parameters_collection_type["patchExpiringUserTargets:::featureFlagKey"]=""
operation_parameters_collection_type["patchExpiringUserTargets:::SemanticPatchWithComment"]=""
operation_parameters_collection_type["patchFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["patchFeatureFlag:::featureFlagKey"]=""
operation_parameters_collection_type["patchFeatureFlag:::patchComment"]=""
operation_parameters_collection_type["postApplyFeatureFlagChangeRequest:::projectKey"]=""
operation_parameters_collection_type["postApplyFeatureFlagChangeRequest:::featureFlagKey"]=""
operation_parameters_collection_type["postApplyFeatureFlagChangeRequest:::environmentKey"]=""
operation_parameters_collection_type["postApplyFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=""
operation_parameters_collection_type["postApplyFeatureFlagChangeRequest:::featureFlagChangeRequestApplyConfigBody"]=""
operation_parameters_collection_type["postFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["postFeatureFlag:::featureFlagBody"]=""
operation_parameters_collection_type["postFeatureFlag:::clone"]=""
operation_parameters_collection_type["postFeatureFlagChangeRequest:::projectKey"]=""
operation_parameters_collection_type["postFeatureFlagChangeRequest:::featureFlagKey"]=""
operation_parameters_collection_type["postFeatureFlagChangeRequest:::environmentKey"]=""
operation_parameters_collection_type["postFeatureFlagChangeRequest:::featureFlagChangeRequestConfigBody"]=""
operation_parameters_collection_type["postReviewFeatureFlagChangeRequest:::projectKey"]=""
operation_parameters_collection_type["postReviewFeatureFlagChangeRequest:::featureFlagKey"]=""
operation_parameters_collection_type["postReviewFeatureFlagChangeRequest:::environmentKey"]=""
operation_parameters_collection_type["postReviewFeatureFlagChangeRequest:::featureFlagChangeRequestId"]=""
operation_parameters_collection_type["postReviewFeatureFlagChangeRequest:::featureFlagChangeRequestReviewConfigBody"]=""
operation_parameters_collection_type["deleteIntegrationSubscription:::integrationKey"]=""
operation_parameters_collection_type["deleteIntegrationSubscription:::integrationId"]=""
operation_parameters_collection_type["getIntegrationSubscription:::integrationKey"]=""
operation_parameters_collection_type["getIntegrationSubscription:::integrationId"]=""
operation_parameters_collection_type["getIntegrationSubscriptions:::integrationKey"]=""
operation_parameters_collection_type["patchIntegrationSubscription:::integrationKey"]=""
operation_parameters_collection_type["patchIntegrationSubscription:::integrationId"]=""
operation_parameters_collection_type["patchIntegrationSubscription:::patchDelta"]=
operation_parameters_collection_type["postIntegrationSubscription:::integrationKey"]=""
operation_parameters_collection_type["postIntegrationSubscription:::subscriptionBody"]=""
operation_parameters_collection_type["deleteProject:::projectKey"]=""
operation_parameters_collection_type["getProject:::projectKey"]=""
operation_parameters_collection_type["patchProject:::projectKey"]=""
operation_parameters_collection_type["patchProject:::patchDelta"]=
operation_parameters_collection_type["postProject:::projectBody"]=""
operation_parameters_collection_type["deleteRelayProxyConfig:::id"]=""
operation_parameters_collection_type["getRelayProxyConfig:::id"]=""
operation_parameters_collection_type["patchRelayProxyConfig:::id"]=""
operation_parameters_collection_type["patchRelayProxyConfig:::patchDelta"]=
operation_parameters_collection_type["postRelayAutoConfig:::relayProxyConfigBody"]=""
operation_parameters_collection_type["resetRelayProxyConfig:::id"]=""
operation_parameters_collection_type["resetRelayProxyConfig:::expiry"]=""
operation_parameters_collection_type["deleteMember:::memberId"]=""
operation_parameters_collection_type["getMember:::memberId"]=""
operation_parameters_collection_type["getMembers:::limit"]=""
operation_parameters_collection_type["getMembers:::offset"]=""
operation_parameters_collection_type["getMembers:::filter"]=""
operation_parameters_collection_type["getMembers:::sort"]=""
operation_parameters_collection_type["patchMember:::memberId"]=""
operation_parameters_collection_type["patchMember:::patchDelta"]=
operation_parameters_collection_type["postMembers:::membersBody"]=
operation_parameters_collection_type["deleteUserSegment:::projectKey"]=""
operation_parameters_collection_type["deleteUserSegment:::environmentKey"]=""
operation_parameters_collection_type["deleteUserSegment:::userSegmentKey"]=""
operation_parameters_collection_type["getExpiringUserTargetsOnSegment:::projectKey"]=""
operation_parameters_collection_type["getExpiringUserTargetsOnSegment:::environmentKey"]=""
operation_parameters_collection_type["getExpiringUserTargetsOnSegment:::userSegmentKey"]=""
operation_parameters_collection_type["getUserSegment:::projectKey"]=""
operation_parameters_collection_type["getUserSegment:::environmentKey"]=""
operation_parameters_collection_type["getUserSegment:::userSegmentKey"]=""
operation_parameters_collection_type["getUserSegments:::projectKey"]=""
operation_parameters_collection_type["getUserSegments:::environmentKey"]=""
operation_parameters_collection_type["getUserSegments:::tag"]=""
operation_parameters_collection_type["patchExpiringUserTargetsOnSegment:::projectKey"]=""
operation_parameters_collection_type["patchExpiringUserTargetsOnSegment:::environmentKey"]=""
operation_parameters_collection_type["patchExpiringUserTargetsOnSegment:::userSegmentKey"]=""
operation_parameters_collection_type["patchExpiringUserTargetsOnSegment:::SemanticPatchWithComment"]=""
operation_parameters_collection_type["patchUserSegment:::projectKey"]=""
operation_parameters_collection_type["patchUserSegment:::environmentKey"]=""
operation_parameters_collection_type["patchUserSegment:::userSegmentKey"]=""
operation_parameters_collection_type["patchUserSegment:::PatchOnly"]=
operation_parameters_collection_type["postUserSegment:::projectKey"]=""
operation_parameters_collection_type["postUserSegment:::environmentKey"]=""
operation_parameters_collection_type["postUserSegment:::userSegmentBody"]=""
operation_parameters_collection_type["updatedUnboundedSegmentTargets:::projectKey"]=""
operation_parameters_collection_type["updatedUnboundedSegmentTargets:::environmentKey"]=""
operation_parameters_collection_type["updatedUnboundedSegmentTargets:::userSegmentKey"]=""
operation_parameters_collection_type["updatedUnboundedSegmentTargets:::unboundedSegmentTargetsBody"]=""
operation_parameters_collection_type["getExpiringUserTargetsForUser:::projectKey"]=""
operation_parameters_collection_type["getExpiringUserTargetsForUser:::environmentKey"]=""
operation_parameters_collection_type["getExpiringUserTargetsForUser:::userKey"]=""
operation_parameters_collection_type["getUserFlagSetting:::projectKey"]=""
operation_parameters_collection_type["getUserFlagSetting:::environmentKey"]=""
operation_parameters_collection_type["getUserFlagSetting:::userKey"]=""
operation_parameters_collection_type["getUserFlagSetting:::featureFlagKey"]=""
operation_parameters_collection_type["getUserFlagSettings:::projectKey"]=""
operation_parameters_collection_type["getUserFlagSettings:::environmentKey"]=""
operation_parameters_collection_type["getUserFlagSettings:::userKey"]=""
operation_parameters_collection_type["patchExpiringUserTargetsForFlags:::projectKey"]=""
operation_parameters_collection_type["patchExpiringUserTargetsForFlags:::environmentKey"]=""
operation_parameters_collection_type["patchExpiringUserTargetsForFlags:::userKey"]=""
operation_parameters_collection_type["patchExpiringUserTargetsForFlags:::SemanticPatchWithComment"]=""
operation_parameters_collection_type["putFlagSetting:::projectKey"]=""
operation_parameters_collection_type["putFlagSetting:::environmentKey"]=""
operation_parameters_collection_type["putFlagSetting:::userKey"]=""
operation_parameters_collection_type["putFlagSetting:::featureFlagKey"]=""
operation_parameters_collection_type["putFlagSetting:::userSettingsBody"]=""
operation_parameters_collection_type["deleteUser:::projectKey"]=""
operation_parameters_collection_type["deleteUser:::environmentKey"]=""
operation_parameters_collection_type["deleteUser:::userKey"]=""
operation_parameters_collection_type["getSearchUsers:::projectKey"]=""
operation_parameters_collection_type["getSearchUsers:::environmentKey"]=""
operation_parameters_collection_type["getSearchUsers:::q"]=""
operation_parameters_collection_type["getSearchUsers:::limit"]=""
operation_parameters_collection_type["getSearchUsers:::offset"]=""
operation_parameters_collection_type["getSearchUsers:::after"]=""
operation_parameters_collection_type["getUser:::projectKey"]=""
operation_parameters_collection_type["getUser:::environmentKey"]=""
operation_parameters_collection_type["getUser:::userKey"]=""
operation_parameters_collection_type["getUsers:::projectKey"]=""
operation_parameters_collection_type["getUsers:::environmentKey"]=""
operation_parameters_collection_type["getUsers:::limit"]=""
operation_parameters_collection_type["getUsers:::h"]=""
operation_parameters_collection_type["getUsers:::scrollId"]=""
operation_parameters_collection_type["deleteWebhook:::resourceId"]=""
operation_parameters_collection_type["getWebhook:::resourceId"]=""
operation_parameters_collection_type["patchWebhook:::resourceId"]=""
operation_parameters_collection_type["patchWebhook:::patchDelta"]=
operation_parameters_collection_type["postWebhook:::webhookBody"]=""


##
# Map for body parameters passed after operation as
# PARAMETER==STRING_VALUE or PARAMETER:=NUMERIC_VALUE
# These will be mapped to top level json keys ( { "PARAMETER": "VALUE" })
declare -A body_parameters

##
# These arguments will be directly passed to cURL
curl_arguments=""

##
# The host for making the request
host=""

##
# The user credentials for basic authentication
basic_auth_credential=""

##
# The user API key
apikey_auth_credential=""

##
# If true, the script will only output the actual cURL command that would be
# used
print_curl=false

##
# The operation ID passed on the command line
operation=""

##
# The provided Accept header value
header_accept=""

##
# The provided Content-type header value
header_content_type=""

##
# If there is any body content on the stdin pass it to the body of the request
body_content_temp_file=""

##
# If this variable is set to true, the request will be performed even
# if parameters for required query, header or body values are not provided
# (path parameters are still required).
force=false

##
# Declare some mime types abbreviations for easier content-type and accepts
# headers specification
declare -A mime_type_abbreviations
# text/*
mime_type_abbreviations["text"]="text/plain"
mime_type_abbreviations["html"]="text/html"
mime_type_abbreviations["md"]="text/x-markdown"
mime_type_abbreviations["csv"]="text/csv"
mime_type_abbreviations["css"]="text/css"
mime_type_abbreviations["rtf"]="text/rtf"
# application/*
mime_type_abbreviations["json"]="application/json"
mime_type_abbreviations["xml"]="application/xml"
mime_type_abbreviations["yaml"]="application/yaml"
mime_type_abbreviations["js"]="application/javascript"
mime_type_abbreviations["bin"]="application/octet-stream"
mime_type_abbreviations["rdf"]="application/rdf+xml"
# image/*
mime_type_abbreviations["jpg"]="image/jpeg"
mime_type_abbreviations["png"]="image/png"
mime_type_abbreviations["gif"]="image/gif"
mime_type_abbreviations["bmp"]="image/bmp"
mime_type_abbreviations["tiff"]="image/tiff"


##############################################################################
#
# Escape special URL characters
# Based on table at http://www.w3schools.com/tags/ref_urlencode.asp
#
##############################################################################
url_escape() {
    local raw_url="$1"

    value=$(sed -e 's/ /%20/g' \
       -e 's/!/%21/g' \
       -e 's/"/%22/g' \
       -e 's/#/%23/g' \
       -e 's/\&/%26/g' \
       -e 's/'\''/%28/g' \
       -e 's/(/%28/g' \
       -e 's/)/%29/g' \
       -e 's/:/%3A/g' \
       -e 's/\t/%09/g' \
       -e 's/?/%3F/g' <<<"$raw_url");

    echo "$value"
}

##############################################################################
#
# Lookup the mime type abbreviation in the mime_type_abbreviations array.
# If not present assume the user provided a valid mime type
#
##############################################################################
lookup_mime_type() {
    local mime_type="$1"

    if [[ ${mime_type_abbreviations[$mime_type]} ]]; then
        echo "${mime_type_abbreviations[$mime_type]}"
    else
        echo "$mime_type"
    fi
}

##############################################################################
#
# Converts an associative array into a list of cURL header
# arguments (-H "KEY: VALUE")
#
##############################################################################
header_arguments_to_curl() {
    local headers_curl=""
    local api_key_header=""
    local api_key_header_in_cli=""
    api_key_header="Authorization"

    for key in "${!header_arguments[@]}"; do
        headers_curl+="-H \"${key}: ${header_arguments[${key}]}\" "
        if [[ "${key}XX" == "${api_key_header}XX" ]]; then
            api_key_header_in_cli="YES"
        fi
    done
    #
    # If the api_key was not provided in the header, try one from the
    # environment variable
    #
    if [[ -z $api_key_header_in_cli && -n $apikey_auth_credential ]]; then
        headers_curl+="-H \"${api_key_header}: ${apikey_auth_credential}\""
    fi
    headers_curl+=" "

    echo "${headers_curl}"
}

##############################################################################
#
# Converts an associative array into a simple JSON with keys as top
# level object attributes
#
# \todo Add conversion of more complex attributes using paths
#
##############################################################################
body_parameters_to_json() {
    local body_json="-d '{"
    local count=0
    for key in "${!body_parameters[@]}"; do
        if [[ $((count++)) -gt 0 ]]; then
            body_json+=", "
        fi
        body_json+="\"${key}\": ${body_parameters[${key}]}"
    done
    body_json+="}'"

    if [[ "${#body_parameters[@]}" -eq 0 ]]; then
        echo ""
    else
        echo "${body_json}"
    fi
}

##############################################################################
#
# Helper method for showing error because for example echo in
# build_request_path() is evaluated as part of command line not printed on
# output. Anyway better idea for resource clean up ;-).
#
##############################################################################
ERROR_MSG=""
function finish {
    if [[ -n "$ERROR_MSG" ]]; then
        echo >&2 "${OFF}${RED}$ERROR_MSG"
        echo >&2 "${OFF}Check usage: '${script_name} --help'"
    fi
}
trap finish EXIT


##############################################################################
#
# Validate and build request path including query parameters
#
##############################################################################
build_request_path() {
    local path_template=$1
    local -n path_params=$2
    local -n query_params=$3


    #
    # Check input parameters count against minimum and maximum required
    #
    if [[ "$force" = false ]]; then
        local was_error=""
        for qparam in "${query_params[@]}" "${path_params[@]}"; do
            local parameter_values
            mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

            #
            # Check if the number of provided values is not less than minimum required
            #
            if [[ ${#parameter_values[@]} -lt ${operation_parameters_minimum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too few values provided for '${qparam}' parameter."
                was_error=true
            fi

            #
            # Check if the number of provided values is not more than maximum
            #
            if [[ ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} -gt 0 \
                  && ${#parameter_values[@]} -gt ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too many values provided for '${qparam}' parameter"
                was_error=true
            fi
        done
        if [[ -n "$was_error" ]]; then
            exit 1
        fi
    fi

    # First replace all path parameters in the path
    for pparam in "${path_params[@]}"; do
        local path_regex="(.*)(\\{$pparam\\})(.*)"
        if [[ $path_template =~ $path_regex ]]; then
            path_template=${BASH_REMATCH[1]}${operation_parameters[$pparam]}${BASH_REMATCH[3]}
        fi
    done

    local query_request_part=""

    local count=0
    for qparam in "${query_params[@]}"; do
        # Get the array of parameter values
        local parameter_value=""
        local parameter_values
        mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

        if [[ -n "${parameter_values[*]}" ]]; then
            if [[ $((count++)) -gt 0 ]]; then
                query_request_part+="&"
            fi
        fi


        #
        # Append parameters without specific cardinality
        #
        local collection_type="${operation_parameters_collection_type["${operation}:::${qparam}"]}"
        if [[ "${collection_type}" == "" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'mutli' collections i.e. param=value1&param=value2&...
        #
        elif [[ "${collection_type}" == "multi" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'csv' collections i.e. param=value1,value2,...
        #
        elif [[ "${collection_type}" == "csv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=","
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'ssv' collections i.e. param="value1 value2 ..."
        #
        elif [[ "${collection_type}" == "ssv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=" "
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'tsv' collections i.e. param="value1\tvalue2\t..."
        #
        elif [[ "${collection_type}" == "tsv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="\\t"
                fi
                parameter_value+="${qvalue}"
            done
        else
            echo "Unsupported collection format \"${collection_type}\""
            exit 1
        fi

        if [[ -n "${parameter_value}" ]]; then
            query_request_part+="${parameter_value}"
        fi

    done


    # Now append query parameters - if any
    if [[ -n "${query_request_part}" ]]; then
        path_template+="?${query_request_part}"
    fi

    echo "$path_template"
}



###############################################################################
#
# Print main help message
#
###############################################################################
print_help() {
cat <<EOF

${BOLD}${WHITE}LaunchDarkly REST API command line client (API version 3.10.0)${OFF}

${BOLD}${WHITE}Usage${OFF}

  ${GREEN}${script_name}${OFF} [-h|--help] [-V|--version] [--about] [${RED}<curl-options>${OFF}]
           [-ac|--accept ${GREEN}<mime-type>${OFF}] [-ct,--content-type ${GREEN}<mime-type>${OFF}]
           [--host ${CYAN}<url>${OFF}] [--dry-run] [-nc|--no-colors] ${YELLOW}<operation>${OFF} [-h|--help]
           [${BLUE}<headers>${OFF}] [${MAGENTA}<parameters>${OFF}] [${MAGENTA}<body-parameters>${OFF}]

  - ${CYAN}<url>${OFF} - endpoint of the REST service without basepath

  - ${RED}<curl-options>${OFF} - any valid cURL options can be passed before ${YELLOW}<operation>${OFF}
  - ${GREEN}<mime-type>${OFF} - either full mime-type or one of supported abbreviations:
                   (text, html, md, csv, css, rtf, json, xml, yaml, js, bin,
                    rdf, jpg, png, gif, bmp, tiff)
  - ${BLUE}<headers>${OFF} - HTTP headers can be passed in the form ${YELLOW}HEADER${OFF}:${BLUE}VALUE${OFF}
  - ${MAGENTA}<parameters>${OFF} - REST operation parameters can be passed in the following
                   forms:
                   * ${YELLOW}KEY${OFF}=${BLUE}VALUE${OFF} - path or query parameters
  - ${MAGENTA}<body-parameters>${OFF} - simple JSON body content (first level only) can be build
                        using the following arguments:
                        * ${YELLOW}KEY${OFF}==${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": "${BLUE}VALUE${OFF}", ... }'
                        * ${YELLOW}KEY${OFF}:=${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": ${BLUE}VALUE${OFF}, ... }'

EOF
    echo -e "${BOLD}${WHITE}Authentication methods${OFF}"
    echo -e ""
    echo -e "  - ${BLUE}Api-key${OFF} - add '${RED}Authorization:<api-key>${OFF}' after ${YELLOW}<operation>${OFF}"
    
    echo ""
    echo -e "${BOLD}${WHITE}Operations (grouped by tags)${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}[accessTokens]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteToken${OFF};Delete an access token by ID. (AUTH)
  ${CYAN}getToken${OFF};Get a single access token by ID. (AUTH)
  ${CYAN}getTokens${OFF};Returns a list of tokens in the account. (AUTH)
  ${CYAN}patchToken${OFF};Modify an access token by ID. (AUTH)
  ${CYAN}postToken${OFF};Create a new token. (AUTH)
  ${CYAN}resetToken${OFF};Reset an access token's secret key with an optional expiry time for the old key. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[auditLog]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getAuditLogEntries${OFF};Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query. (AUTH)
  ${CYAN}getAuditLogEntry${OFF};Use this endpoint to fetch a single audit log entry by its resouce ID. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[customRoles]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteCustomRole${OFF};Delete a custom role by key. (AUTH)
  ${CYAN}getCustomRole${OFF};Get one custom role by key. (AUTH)
  ${CYAN}getCustomRoles${OFF};Return a complete list of custom roles. (AUTH)
  ${CYAN}patchCustomRole${OFF};Modify a custom role by key. (AUTH)
  ${CYAN}postCustomRole${OFF};Create a new custom role. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[customerMetrics]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getEvaluations${OFF};Get events usage by event id and the feature flag key. (AUTH)
  ${CYAN}getEvent${OFF};Get events usage by event type. (AUTH)
  ${CYAN}getEvents${OFF};Get events usage endpoints. (AUTH)
  ${CYAN}getMAU${OFF};Get monthly active user data. (AUTH)
  ${CYAN}getMAUByCategory${OFF};Get monthly active user data by category. (AUTH)
  ${CYAN}getStream${OFF};Get a stream endpoint and return timeseries data. (AUTH)
  ${CYAN}getStreamBySDK${OFF};Get a stream timeseries data by source show sdk version metadata. (AUTH)
  ${CYAN}getStreamSDKVersion${OFF};Get a stream timeseries data by source and show all sdk version associated. (AUTH)
  ${CYAN}getStreams${OFF};Returns a list of all streams. (AUTH)
  ${CYAN}getUsage${OFF};Returns of the usage endpoints available. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[dataExportDestinations]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteDestination${OFF};Get a single data export destination by ID (AUTH)
  ${CYAN}getDestination${OFF};Get a single data export destination by ID (AUTH)
  ${CYAN}getDestinations${OFF};Returns a list of all data export destinations. (AUTH)
  ${CYAN}patchDestination${OFF};Perform a partial update to a data export destination. (AUTH)
  ${CYAN}postDestination${OFF};Create a new data export destination (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[environments]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteEnvironment${OFF};Delete an environment in a specific project. (AUTH)
  ${CYAN}getEnvironment${OFF};Get an environment given a project and key. (AUTH)
  ${CYAN}patchEnvironment${OFF};Modify an environment by ID. (AUTH)
  ${CYAN}postEnvironment${OFF};Create a new environment in a specified project with a given name, key, and swatch color. (AUTH)
  ${CYAN}resetEnvironmentMobileKey${OFF};Reset an environment's mobile key. The optional expiry for the old key is deprecated for this endpoint, so the old key will always expire immediately. (AUTH)
  ${CYAN}resetEnvironmentSDKKey${OFF};Reset an environment's SDK key with an optional expiry time for the old key. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[featureFlags]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}copyFeatureFlag${OFF};Copies the feature flag configuration from one environment to the same feature flag in another environment. (AUTH)
  ${CYAN}deleteFeatureFlag${OFF};Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application. (AUTH)
  ${CYAN}getExpiringUserTargets${OFF};Get expiring user targets for feature flag (AUTH)
  ${CYAN}getFeatureFlag${OFF};Get a single feature flag by key. (AUTH)
  ${CYAN}getFeatureFlagChangeRequest${OFF};Get a single change request for a feature flag (AUTH)
  ${CYAN}getFeatureFlagChangeRequests${OFF};Get all change requests for a feature flag (AUTH)
  ${CYAN}getFeatureFlagStatus${OFF};Get the status for a particular feature flag. (AUTH)
  ${CYAN}getFeatureFlagStatusAcrossEnvironments${OFF};Get the status for a particular feature flag across environments (AUTH)
  ${CYAN}getFeatureFlagStatuses${OFF};Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag. (AUTH)
  ${CYAN}getFeatureFlags${OFF};Get a list of all features in the given project. (AUTH)
  ${CYAN}patchExpiringUserTargets${OFF};Update, add, or delete expiring user targets on feature flag (AUTH)
  ${CYAN}patchFeatureFlag${OFF};Perform a partial update to a feature. (AUTH)
  ${CYAN}postApplyFeatureFlagChangeRequest${OFF};Apply change request for a feature flag (AUTH)
  ${CYAN}postFeatureFlag${OFF};Creates a new feature flag. (AUTH)
  ${CYAN}postFeatureFlagChangeRequest${OFF}; (AUTH)
  ${CYAN}postReviewFeatureFlagChangeRequest${OFF};Review change request for a feature flag (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[integrations]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteIntegrationSubscription${OFF};Delete an integration subscription by ID. (AUTH)
  ${CYAN}getIntegrationSubscription${OFF};Get a single integration subscription by ID. (AUTH)
  ${CYAN}getIntegrationSubscriptions${OFF};Get a list of all configured integrations of a given kind. (AUTH)
  ${CYAN}getIntegrations${OFF};Get a list of all configured audit log event integrations associated with this account. (AUTH)
  ${CYAN}patchIntegrationSubscription${OFF};Modify an integration subscription by ID. (AUTH)
  ${CYAN}postIntegrationSubscription${OFF};Create a new integration subscription of a given kind. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[projects]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteProject${OFF};Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account. (AUTH)
  ${CYAN}getProject${OFF};Fetch a single project by key. (AUTH)
  ${CYAN}getProjects${OFF};Returns a list of all projects in the account. (AUTH)
  ${CYAN}patchProject${OFF};Modify a project by ID. (AUTH)
  ${CYAN}postProject${OFF};Create a new project with the given key and name. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[relayProxyConfigurations]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteRelayProxyConfig${OFF};Delete a relay proxy configuration by ID. (AUTH)
  ${CYAN}getRelayProxyConfig${OFF};Get a single relay proxy configuration by ID. (AUTH)
  ${CYAN}getRelayProxyConfigs${OFF};Returns a list of relay proxy configurations in the account. (AUTH)
  ${CYAN}patchRelayProxyConfig${OFF};Modify a relay proxy configuration by ID. (AUTH)
  ${CYAN}postRelayAutoConfig${OFF};Create a new relay proxy config. (AUTH)
  ${CYAN}resetRelayProxyConfig${OFF};Reset a relay proxy configuration's secret key with an optional expiry time for the old key. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[root]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getRoot${OFF}; (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[teamMembers]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteMember${OFF};Delete a team member by ID. (AUTH)
  ${CYAN}getMe${OFF};Get the current team member associated with the token (AUTH)
  ${CYAN}getMember${OFF};Get a single team member by ID. (AUTH)
  ${CYAN}getMembers${OFF};Returns a list of all members in the account. (AUTH)
  ${CYAN}patchMember${OFF};Modify a team member by ID. (AUTH)
  ${CYAN}postMembers${OFF};Invite new members. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[userSegments]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteUserSegment${OFF};Delete a user segment. (AUTH)
  ${CYAN}getExpiringUserTargetsOnSegment${OFF};Get expiring user targets for user segment (AUTH)
  ${CYAN}getUserSegment${OFF};Get a single user segment by key. (AUTH)
  ${CYAN}getUserSegments${OFF};Get a list of all user segments in the given project. (AUTH)
  ${CYAN}patchExpiringUserTargetsOnSegment${OFF};Update, add, or delete expiring user targets on user segment (AUTH)
  ${CYAN}patchUserSegment${OFF};Perform a partial update to a user segment. (AUTH)
  ${CYAN}postUserSegment${OFF};Creates a new user segment. (AUTH)
  ${CYAN}updatedUnboundedSegmentTargets${OFF};Update targets included or excluded in an unbounded segment (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[userSettings]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getExpiringUserTargetsForUser${OFF};Get expiring dates on flags for user (AUTH)
  ${CYAN}getUserFlagSetting${OFF};Fetch a single flag setting for a user by key. (AUTH)
  ${CYAN}getUserFlagSettings${OFF};Fetch a single flag setting for a user by key. (AUTH)
  ${CYAN}patchExpiringUserTargetsForFlags${OFF};Update, add, or delete expiring user targets for a single user on all flags (AUTH)
  ${CYAN}putFlagSetting${OFF};Specifically enable or disable a feature flag for a user based on their key. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[users]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteUser${OFF};Delete a user by ID. (AUTH)
  ${CYAN}getSearchUsers${OFF};Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource. (AUTH)
  ${CYAN}getUser${OFF};Get a user by key. (AUTH)
  ${CYAN}getUsers${OFF};List all users in the environment. Includes the total count of users. In each page, there will be up to 'limit' users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[webhooks]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteWebhook${OFF};Delete a webhook by ID. (AUTH)
  ${CYAN}getWebhook${OFF};Get a webhook by ID. (AUTH)
  ${CYAN}getWebhooks${OFF};Fetch a list of all webhooks. (AUTH)
  ${CYAN}patchWebhook${OFF};Modify a webhook by ID. (AUTH)
  ${CYAN}postWebhook${OFF};Create a webhook. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}Options${OFF}"
    echo -e "  -h,--help\\t\\t\\t\\tPrint this help"
    echo -e "  -V,--version\\t\\t\\t\\tPrint API version"
    echo -e "  --about\\t\\t\\t\\tPrint the information about service"
    echo -e "  --host ${CYAN}<url>${OFF}\\t\\t\\t\\tSpecify the host URL "
echo -e "              \\t\\t\\t\\t(e.g. 'https://app.launchdarkly.com')"

    echo -e "  --force\\t\\t\\t\\tForce command invocation in spite of missing"
    echo -e "         \\t\\t\\t\\trequired parameters or wrong content type"
    echo -e "  --dry-run\\t\\t\\t\\tPrint out the cURL command without"
    echo -e "           \\t\\t\\t\\texecuting it"
    echo -e "  -nc,--no-colors\\t\\t\\tEnforce print without colors, otherwise autodected"
    echo -e "  -ac,--accept ${YELLOW}<mime-type>${OFF}\\t\\tSet the 'Accept' header in the request"
    echo -e "  -ct,--content-type ${YELLOW}<mime-type>${OFF}\\tSet the 'Content-type' header in "
    echo -e "                                \\tthe request"
    echo ""
}


##############################################################################
#
# Print REST service description
#
##############################################################################
print_about() {
    echo ""
    echo -e "${BOLD}${WHITE}LaunchDarkly REST API command line client (API version 3.10.0)${OFF}"
    echo ""
    echo -e "License: Apache 2.0"
    echo -e "Contact: support@launchdarkly.com"
    echo ""
read -r -d '' appdescription <<EOF

Build custom integrations with the LaunchDarkly REST API
EOF
echo "$appdescription" | paste -sd' ' | fold -sw 80
}


##############################################################################
#
# Print REST api version
#
##############################################################################
print_version() {
    echo ""
    echo -e "${BOLD}LaunchDarkly REST API command line client (API version 3.10.0)${OFF}"
    echo ""
}

##############################################################################
#
# Print help for deleteToken operation
#
##############################################################################
print_deleteToken_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteToken - Delete an access token by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tokenId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The access token ID. ${YELLOW}Specify as: tokenId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getToken operation
#
##############################################################################
print_getToken_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getToken - Get a single access token by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tokenId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The access token ID. ${YELLOW}Specify as: tokenId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Token response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getTokens operation
#
##############################################################################
print_getTokens_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getTokens - Returns a list of tokens in the account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}showAll${OFF} ${BLUE}[boolean]${OFF}${OFF} - If set to true, and the authentication access token has the \"Admin\" role, personal access tokens for all members will be retrieved.${YELLOW} Specify as: showAll=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Tokens response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchToken operation
#
##############################################################################
print_patchToken_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchToken - Modify an access token by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tokenId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The access token ID. ${YELLOW}Specify as: tokenId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Token response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postToken operation
#
##############################################################################
print_postToken_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postToken - Create a new token.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Create a new access token." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Token response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for resetToken operation
#
##############################################################################
print_resetToken_help() {
    echo ""
    echo -e "${BOLD}${WHITE}resetToken - Reset an access token's secret key with an optional expiry time for the old key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tokenId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The access token ID. ${YELLOW}Specify as: tokenId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}expiry${OFF} ${BLUE}[integer]${OFF}${OFF} - An expiration time for the old token key, expressed as a Unix epoch time in milliseconds. By default, the token will expire immediately.${YELLOW} Specify as: expiry=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Token response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getAuditLogEntries operation
#
##############################################################################
print_getAuditLogEntries_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAuditLogEntries - Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}before${OFF} ${BLUE}[integer]${OFF}${OFF} - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have before this timestamp.${YELLOW} Specify as: before=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}after${OFF} ${BLUE}[integer]${OFF}${OFF} - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occurred after this timestamp.${YELLOW} Specify as: after=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}q${OFF} ${BLUE}[string]${OFF}${OFF} - Text to search for. You can search for the full or partial name of the resource involved or full or partial email address of the member who made the change.${YELLOW} Specify as: q=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF}${OFF} - A limit on the number of audit log entries to be returned, between 1 and 20.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}spec${OFF} ${BLUE}[string]${OFF}${OFF} - A resource specifier, allowing you to filter audit log listings by resource.${YELLOW} Specify as: spec=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Audit log entries response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getAuditLogEntry operation
#
##############################################################################
print_getAuditLogEntry_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAuditLogEntry - Use this endpoint to fetch a single audit log entry by its resouce ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}resourceId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The resource ID. ${YELLOW}Specify as: resourceId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Audit log entry response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteCustomRole operation
#
##############################################################################
print_deleteCustomRole_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteCustomRole - Delete a custom role by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customRoleKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The custom role key. ${YELLOW}Specify as: customRoleKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getCustomRole operation
#
##############################################################################
print_getCustomRole_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCustomRole - Get one custom role by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customRoleKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The custom role key. ${YELLOW}Specify as: customRoleKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Custom role response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getCustomRoles operation
#
##############################################################################
print_getCustomRoles_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCustomRoles - Return a complete list of custom roles.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Custom roles response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchCustomRole operation
#
##############################################################################
print_patchCustomRole_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchCustomRole - Modify a custom role by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customRoleKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The custom role key. ${YELLOW}Specify as: customRoleKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Custom role response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postCustomRole operation
#
##############################################################################
print_postCustomRole_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postCustomRole - Create a new custom role.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - New role or roles to create." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Custom role response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getEvaluations operation
#
##############################################################################
print_getEvaluations_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getEvaluations - Get events usage by event id and the feature flag key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}envId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment id for the flag evaluations in question. ${YELLOW}Specify as: envId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}flagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The key of the flag we want metrics for. ${YELLOW}Specify as: flagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Returns timeseries data and all sdk versions.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;The environment or flag you requested could not be found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getEvent operation
#
##############################################################################
print_getEvent_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getEvent - Get events usage by event type.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The type of event we would like to track. ${YELLOW}Specify as: type=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Returns timeseries data and all sdk versions.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;The stream source you requested could not be found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getEvents operation
#
##############################################################################
print_getEvents_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getEvents - Get events usage endpoints.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Returns timeseries data and all sdk versions.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getMAU operation
#
##############################################################################
print_getMAU_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getMAU - Get monthly active user data.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Returns timeseries data and all sdk versions.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getMAUByCategory operation
#
##############################################################################
print_getMAUByCategory_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getMAUByCategory - Get monthly active user data by category.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Returns timeseries data and all sdk versions.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getStream operation
#
##############################################################################
print_getStream_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getStream - Get a stream endpoint and return timeseries data.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}source${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The source of where the stream comes from. ${YELLOW}Specify as: source=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Responds with time series data on stream usage.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;The stream source you requested could not be found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getStreamBySDK operation
#
##############################################################################
print_getStreamBySDK_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getStreamBySDK - Get a stream timeseries data by source show sdk version metadata.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}source${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The source of where the stream comes from. ${YELLOW}Specify as: source=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Returns timeseries data and metadata on sdk version.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;The stream source you requested could not be found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getStreamSDKVersion operation
#
##############################################################################
print_getStreamSDKVersion_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getStreamSDKVersion - Get a stream timeseries data by source and show all sdk version associated.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}source${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The source of where the stream comes from. ${YELLOW}Specify as: source=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Returns timeseries data and all sdk versions.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;The stream source you requested could not be found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getStreams operation
#
##############################################################################
print_getStreams_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getStreams - Returns a list of all streams.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Stream usage endpoints${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUsage operation
#
##############################################################################
print_getUsage_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUsage - Returns of the usage endpoints available.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Usage endpoints${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteDestination operation
#
##############################################################################
print_deleteDestination_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteDestination - Get a single data export destination by ID${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}destinationId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The data export destination ID. ${YELLOW}Specify as: destinationId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getDestination operation
#
##############################################################################
print_getDestination_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDestination - Get a single data export destination by ID${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}destinationId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The data export destination ID. ${YELLOW}Specify as: destinationId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Destination response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getDestinations operation
#
##############################################################################
print_getDestinations_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDestinations - Returns a list of all data export destinations.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Destinations response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchDestination operation
#
##############################################################################
print_patchDestination_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchDestination - Perform a partial update to a data export destination.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}destinationId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The data export destination ID. ${YELLOW}Specify as: destinationId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Destination response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postDestination operation
#
##############################################################################
print_postDestination_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postDestination - Create a new data export destination${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Create a new data export destination." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Destination response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteEnvironment operation
#
##############################################################################
print_deleteEnvironment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteEnvironment - Delete an environment in a specific project.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getEnvironment operation
#
##############################################################################
print_getEnvironment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getEnvironment - Get an environment given a project and key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Environment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchEnvironment operation
#
##############################################################################
print_patchEnvironment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchEnvironment - Modify an environment by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Environment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postEnvironment operation
#
##############################################################################
print_postEnvironment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postEnvironment - Create a new environment in a specified project with a given name, key, and swatch color.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - New environment." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Environment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for resetEnvironmentMobileKey operation
#
##############################################################################
print_resetEnvironmentMobileKey_help() {
    echo ""
    echo -e "${BOLD}${WHITE}resetEnvironmentMobileKey - Reset an environment's mobile key. The optional expiry for the old key is deprecated for this endpoint, so the old key will always expire immediately.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}expiry${OFF} ${BLUE}[integer]${OFF}${OFF} - The expiry parameter is deprecated for this endpoint, so the old mobile key will always expire immediately. This parameter will be removed in an upcoming major API client version.${YELLOW} Specify as: expiry=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Environment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for resetEnvironmentSDKKey operation
#
##############################################################################
print_resetEnvironmentSDKKey_help() {
    echo ""
    echo -e "${BOLD}${WHITE}resetEnvironmentSDKKey - Reset an environment's SDK key with an optional expiry time for the old key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}expiry${OFF} ${BLUE}[integer]${OFF}${OFF} - An expiration time for the old environment SDK key, expressed as a Unix epoch time in milliseconds. By default, the key will expire immediately.${YELLOW} Specify as: expiry=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Environment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for copyFeatureFlag operation
#
##############################################################################
print_copyFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}copyFeatureFlag - Copies the feature flag configuration from one environment to the same feature flag in another environment.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Copy feature flag configurations between environments." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Flag configuration copy response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteFeatureFlag operation
#
##############################################################################
print_deleteFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteFeatureFlag - Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getExpiringUserTargets operation
#
##############################################################################
print_getExpiringUserTargets_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getExpiringUserTargets - Get expiring user targets for feature flag${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User targets of the requested feature flag.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlag operation
#
##############################################################################
print_getFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlag - Get a single feature flag by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}env${OFF} ${BLUE}[array[string]]${OFF}${OFF} - By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=[\"production\"] will restrict the returned configurations to just your production environment.${YELLOW} Specify as: env=value1 env=value2 env=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Flag response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlagChangeRequest operation
#
##############################################################################
print_getFeatureFlagChangeRequest_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlagChangeRequest - Get a single change request for a feature flag${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagChangeRequestId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag change request ID ${YELLOW}Specify as: featureFlagChangeRequestId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Feature flag change request response${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlagChangeRequests operation
#
##############################################################################
print_getFeatureFlagChangeRequests_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlagChangeRequests - Get all change requests for a feature flag${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Feature flag change requests response${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlagStatus operation
#
##############################################################################
print_getFeatureFlagStatus_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlagStatus - Get the status for a particular feature flag.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Status of the requested feature flag.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlagStatusAcrossEnvironments operation
#
##############################################################################
print_getFeatureFlagStatusAcrossEnvironments_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlagStatusAcrossEnvironments - Get the status for a particular feature flag across environments${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Status of the requested feature flag across environments${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlagStatuses operation
#
##############################################################################
print_getFeatureFlagStatuses_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlagStatuses - Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;List of feature flag statuses.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlags operation
#
##############################################################################
print_getFeatureFlags_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlags - Get a list of all features in the given project.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}env${OFF} ${BLUE}[array[string]]${OFF}${OFF} - By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=[\"production\"] will restrict the returned configurations to just your production environment.${YELLOW} Specify as: env=value1 env=value2 env=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}summary${OFF} ${BLUE}[boolean]${OFF}${OFF} - By default in api version >= 1, flags will _not_ include their list of prerequisites, targets or rules.  Set summary=0 to include these fields for each flag returned.${YELLOW} Specify as: summary=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}archived${OFF} ${BLUE}[boolean]${OFF}${OFF} - When set to 1, only archived flags will be included in the list of flags returned.  By default, archived flags are not included in the list of flags.${YELLOW} Specify as: archived=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF}${OFF} - The number of objects to return. Defaults to -1, which returns everything.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF}${OFF} - Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF}${OFF} - A comma-separated list of filters. Each filter is of the form field:value.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort${OFF} ${BLUE}[string]${OFF}${OFF} - A comma-separated list of fields to sort by. A field prefixed by a - will be sorted in descending order.${YELLOW} Specify as: sort=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag${OFF} ${BLUE}[string]${OFF}${OFF} - Filter by tag. A tag can be used to group flags across projects.${YELLOW} Specify as: tag=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Flags response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchExpiringUserTargets operation
#
##############################################################################
print_patchExpiringUserTargets_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchExpiringUserTargets - Update, add, or delete expiring user targets on feature flag${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a Semantic Patch representation of the desired changes to the resource. 'https://apidocs.launchdarkly.com/reference#updates-via-semantic-patches'. The addition of comments is also supported." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User targeting expirations on feature flag response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchFeatureFlag operation
#
##############################################################################
print_patchFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchFeatureFlag - Perform a partial update to a feature.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project, and an optional comment. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Feature flag response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postApplyFeatureFlagChangeRequest operation
#
##############################################################################
print_postApplyFeatureFlagChangeRequest_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postApplyFeatureFlagChangeRequest - Apply change request for a feature flag${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagChangeRequestId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag change request ID ${YELLOW}Specify as: featureFlagChangeRequestId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Apply a new feature flag change request" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Feature flag change request applied response${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postFeatureFlag operation
#
##############################################################################
print_postFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postFeatureFlag - Creates a new feature flag.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}clone${OFF} ${BLUE}[string]${OFF}${OFF} - The key of the feature flag to be cloned. The key identifies the flag in your code.  For example, setting clone=flagKey will copy the full targeting configuration for all environments (including on/off state) from the original flag to the new flag.${YELLOW} Specify as: clone=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Create a new feature flag." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Flag response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postFeatureFlagChangeRequest operation
#
##############################################################################
print_postFeatureFlagChangeRequest_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postFeatureFlagChangeRequest - ${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - Create a new feature flag change request" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Feature flag change request response${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postReviewFeatureFlagChangeRequest operation
#
##############################################################################
print_postReviewFeatureFlagChangeRequest_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postReviewFeatureFlagChangeRequest - Review change request for a feature flag${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagChangeRequestId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag change request ID ${YELLOW}Specify as: featureFlagChangeRequestId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Review a feature flag change request" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Feature flag change request reviewed response${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteIntegrationSubscription operation
#
##############################################################################
print_deleteIntegrationSubscription_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteIntegrationSubscription - Delete an integration subscription by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}integrationKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The key used to specify the integration kind. ${YELLOW}Specify as: integrationKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}integrationId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The integration ID. ${YELLOW}Specify as: integrationId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getIntegrationSubscription operation
#
##############################################################################
print_getIntegrationSubscription_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getIntegrationSubscription - Get a single integration subscription by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}integrationKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The key used to specify the integration kind. ${YELLOW}Specify as: integrationKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}integrationId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The integration ID. ${YELLOW}Specify as: integrationId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Integrations response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getIntegrationSubscriptions operation
#
##############################################################################
print_getIntegrationSubscriptions_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getIntegrationSubscriptions - Get a list of all configured integrations of a given kind.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}integrationKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The key used to specify the integration kind. ${YELLOW}Specify as: integrationKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Integrations response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getIntegrations operation
#
##############################################################################
print_getIntegrations_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getIntegrations - Get a list of all configured audit log event integrations associated with this account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Integrations response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;This is a beta API, you must pass beta in the LD-API-Version header to use it.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchIntegrationSubscription operation
#
##############################################################################
print_patchIntegrationSubscription_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchIntegrationSubscription - Modify an integration subscription by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}integrationKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The key used to specify the integration kind. ${YELLOW}Specify as: integrationKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}integrationId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The integration ID. ${YELLOW}Specify as: integrationId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Integrations response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postIntegrationSubscription operation
#
##############################################################################
print_postIntegrationSubscription_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postIntegrationSubscription - Create a new integration subscription of a given kind.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}integrationKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The key used to specify the integration kind. ${YELLOW}Specify as: integrationKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Create a new integration subscription." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Integrations response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteProject operation
#
##############################################################################
print_deleteProject_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteProject - Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getProject operation
#
##############################################################################
print_getProject_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getProject - Fetch a single project by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Project response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getProjects operation
#
##############################################################################
print_getProjects_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getProjects - Returns a list of all projects in the account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Projects response${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchProject operation
#
##############################################################################
print_patchProject_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchProject - Modify a project by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Project response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postProject operation
#
##############################################################################
print_postProject_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postProject - Create a new project with the given key and name.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Project keys must be unique within an account." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Successful Project response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteRelayProxyConfig operation
#
##############################################################################
print_deleteRelayProxyConfig_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteRelayProxyConfig - Delete a relay proxy configuration by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The relay proxy configuration ID ${YELLOW}Specify as: id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getRelayProxyConfig operation
#
##############################################################################
print_getRelayProxyConfig_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getRelayProxyConfig - Get a single relay proxy configuration by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The relay proxy configuration ID ${YELLOW}Specify as: id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Relay proxy config response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getRelayProxyConfigs operation
#
##############################################################################
print_getRelayProxyConfigs_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getRelayProxyConfigs - Returns a list of relay proxy configurations in the account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Relay proxy configs response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchRelayProxyConfig operation
#
##############################################################################
print_patchRelayProxyConfig_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchRelayProxyConfig - Modify a relay proxy configuration by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The relay proxy configuration ID ${YELLOW}Specify as: id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Relay proxy config response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postRelayAutoConfig operation
#
##############################################################################
print_postRelayAutoConfig_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postRelayAutoConfig - Create a new relay proxy config.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Create a new relay proxy configuration" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Relay proxy config response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;Access to the requested resource was denied.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for resetRelayProxyConfig operation
#
##############################################################################
print_resetRelayProxyConfig_help() {
    echo ""
    echo -e "${BOLD}${WHITE}resetRelayProxyConfig - Reset a relay proxy configuration's secret key with an optional expiry time for the old key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The relay proxy configuration ID ${YELLOW}Specify as: id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}expiry${OFF} ${BLUE}[integer]${OFF}${OFF} - An expiration time for the old relay proxy configuration key, expressed as a Unix epoch time in milliseconds. By default, the relay proxy configuration will expire immediately${YELLOW} Specify as: expiry=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Relay proxy config response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getRoot operation
#
##############################################################################
print_getRoot_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getRoot - ${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "You can issue a GET request to the root resource to find all of the resource categories supported by the API." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A list of links to available resources in the API.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteMember operation
#
##############################################################################
print_deleteMember_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteMember - Delete a team member by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}memberId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The member ID. ${YELLOW}Specify as: memberId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getMe operation
#
##############################################################################
print_getMe_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getMe - Get the current team member associated with the token${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Member response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getMember operation
#
##############################################################################
print_getMember_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getMember - Get a single team member by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}memberId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The member ID. ${YELLOW}Specify as: memberId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Member response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getMembers operation
#
##############################################################################
print_getMembers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getMembers - Returns a list of all members in the account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF}${OFF} - The number of objects to return. Defaults to -1, which returns everything.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF}${OFF} - Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF}${OFF} - A comma-separated list of filters. Each filter is of the form field:value.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort${OFF} ${BLUE}[string]${OFF}${OFF} - A comma-separated list of fields to sort by. A field prefixed by a - will be sorted in descending order.${YELLOW} Specify as: sort=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Members response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchMember operation
#
##############################################################################
print_patchMember_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchMember - Modify a team member by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}memberId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The member ID. ${YELLOW}Specify as: memberId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Member response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postMembers operation
#
##############################################################################
print_postMembers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postMembers - Invite new members.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - New members to invite." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Members response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteUserSegment operation
#
##############################################################################
print_deleteUserSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUserSegment - Delete a user segment.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getExpiringUserTargetsOnSegment operation
#
##############################################################################
print_getExpiringUserTargetsOnSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getExpiringUserTargetsOnSegment - Get expiring user targets for user segment${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User targeting expirations on user segment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserSegment operation
#
##############################################################################
print_getUserSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserSegment - Get a single user segment by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User segment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserSegments operation
#
##############################################################################
print_getUserSegments_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserSegments - Get a list of all user segments in the given project.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag${OFF} ${BLUE}[string]${OFF}${OFF} - Filter by tag. A tag can be used to group flags across projects.${YELLOW} Specify as: tag=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Segments response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchExpiringUserTargetsOnSegment operation
#
##############################################################################
print_patchExpiringUserTargetsOnSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchExpiringUserTargetsOnSegment - Update, add, or delete expiring user targets on user segment${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a Semantic Patch representation of the desired changes to the resource. 'https://apidocs.launchdarkly.com/reference#updates-via-semantic-patches'. The addition of comments is also supported." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User targeting expirations on user segment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchUserSegment operation
#
##############################################################################
print_patchUserSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchUserSegment - Perform a partial update to a user segment.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User segment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postUserSegment operation
#
##############################################################################
print_postUserSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postUserSegment - Creates a new user segment.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Create a new user segment." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;User segment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for updatedUnboundedSegmentTargets operation
#
##############################################################################
print_updatedUnboundedSegmentTargets_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updatedUnboundedSegmentTargets - Update targets included or excluded in an unbounded segment${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Add or remove user targets to the included or excluded lists on an unbounded segment" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getExpiringUserTargetsForUser operation
#
##############################################################################
print_getExpiringUserTargetsForUser_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getExpiringUserTargetsForUser - Get expiring dates on flags for user${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User targets of the requested feature flag.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserFlagSetting operation
#
##############################################################################
print_getUserFlagSetting_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserFlagSetting - Fetch a single flag setting for a user by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User flag setting response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserFlagSettings operation
#
##############################################################################
print_getUserFlagSettings_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserFlagSettings - Fetch a single flag setting for a user by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User flags settings response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchExpiringUserTargetsForFlags operation
#
##############################################################################
print_patchExpiringUserTargetsForFlags_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchExpiringUserTargetsForFlags - Update, add, or delete expiring user targets for a single user on all flags${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a Semantic Patch representation of the desired changes to the resource. 'https://apidocs.launchdarkly.com/reference#updates-via-semantic-patches'. The addition of comments is also supported." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User Targeting expiration for single user on all flags response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for putFlagSetting operation
#
##############################################################################
print_putFlagSetting_help() {
    echo ""
    echo -e "${BOLD}${WHITE}putFlagSetting - Specifically enable or disable a feature flag for a user based on their key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteUser operation
#
##############################################################################
print_deleteUser_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUser - Delete a user by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getSearchUsers operation
#
##############################################################################
print_getSearchUsers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getSearchUsers - Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}q${OFF} ${BLUE}[string]${OFF}${OFF} - Search query.${YELLOW} Specify as: q=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF}${OFF} - Pagination limit.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF}${OFF} - Specifies the first item to return in the collection.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}after${OFF} ${BLUE}[integer]${OFF}${OFF} - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occurred after this timestamp.${YELLOW} Specify as: after=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Users response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUser operation
#
##############################################################################
print_getUser_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUser - Get a user by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUsers operation
#
##############################################################################
print_getUsers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUsers - List all users in the environment. Includes the total count of users. In each page, there will be up to 'limit' users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF}${OFF} - Pagination limit.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}h${OFF} ${BLUE}[string]${OFF}${OFF} - This parameter is required when following \"next\" links.${YELLOW} Specify as: h=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}scrollId${OFF} ${BLUE}[string]${OFF}${OFF} - This parameter is required when following \"next\" links.${YELLOW} Specify as: scrollId=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Users response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteWebhook operation
#
##############################################################################
print_deleteWebhook_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteWebhook - Delete a webhook by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}resourceId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The resource ID. ${YELLOW}Specify as: resourceId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getWebhook operation
#
##############################################################################
print_getWebhook_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getWebhook - Get a webhook by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}resourceId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The resource ID. ${YELLOW}Specify as: resourceId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Webhook response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getWebhooks operation
#
##############################################################################
print_getWebhooks_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getWebhooks - Fetch a list of all webhooks.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Webhooks response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchWebhook operation
#
##############################################################################
print_patchWebhook_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchWebhook - Modify a webhook by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}resourceId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The resource ID. ${YELLOW}Specify as: resourceId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Webhook response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postWebhook operation
#
##############################################################################
print_postWebhook_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postWebhook - Create a webhook.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - New webhook." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Webhook response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}


##############################################################################
#
# Call deleteToken operation
#
##############################################################################
call_deleteToken() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(tokenId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/tokens/{tokenId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getToken operation
#
##############################################################################
call_getToken() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(tokenId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/tokens/{tokenId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getTokens operation
#
##############################################################################
call_getTokens() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(showAll  )
    local path

    if ! path=$(build_request_path "/api/v2/tokens" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchToken operation
#
##############################################################################
call_patchToken() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(tokenId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/tokens/{tokenId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postToken operation
#
##############################################################################
call_postToken() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/tokens" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call resetToken operation
#
##############################################################################
call_resetToken() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(tokenId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(expiry  )
    local path

    if ! path=$(build_request_path "/api/v2/tokens/{tokenId}/reset" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getAuditLogEntries operation
#
##############################################################################
call_getAuditLogEntries() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(before after q limit spec  )
    local path

    if ! path=$(build_request_path "/api/v2/auditlog" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getAuditLogEntry operation
#
##############################################################################
call_getAuditLogEntry() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(resourceId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/auditlog/{resourceId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call deleteCustomRole operation
#
##############################################################################
call_deleteCustomRole() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(customRoleKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles/{customRoleKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getCustomRole operation
#
##############################################################################
call_getCustomRole() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(customRoleKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles/{customRoleKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getCustomRoles operation
#
##############################################################################
call_getCustomRoles() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchCustomRole operation
#
##############################################################################
call_patchCustomRole() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(customRoleKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles/{customRoleKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postCustomRole operation
#
##############################################################################
call_postCustomRole() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call getEvaluations operation
#
##############################################################################
call_getEvaluations() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(envId flagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/evaluations/{envId}/{flagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getEvent operation
#
##############################################################################
call_getEvent() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(type)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/events/{type}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getEvents operation
#
##############################################################################
call_getEvents() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/events" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getMAU operation
#
##############################################################################
call_getMAU() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/mau" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getMAUByCategory operation
#
##############################################################################
call_getMAUByCategory() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/mau/bycategory" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getStream operation
#
##############################################################################
call_getStream() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(source)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/streams/{source}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getStreamBySDK operation
#
##############################################################################
call_getStreamBySDK() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(source)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/streams/{source}/bysdkversion" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getStreamSDKVersion operation
#
##############################################################################
call_getStreamSDKVersion() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(source)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/streams/{source}/sdkversions" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getStreams operation
#
##############################################################################
call_getStreams() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage/streams" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUsage operation
#
##############################################################################
call_getUsage() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/usage" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call deleteDestination operation
#
##############################################################################
call_deleteDestination() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey destinationId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/destinations/{projectKey}/{environmentKey}/{destinationId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getDestination operation
#
##############################################################################
call_getDestination() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey destinationId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/destinations/{projectKey}/{environmentKey}/{destinationId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getDestinations operation
#
##############################################################################
call_getDestinations() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/destinations" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchDestination operation
#
##############################################################################
call_patchDestination() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey destinationId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/destinations/{projectKey}/{environmentKey}/{destinationId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postDestination operation
#
##############################################################################
call_postDestination() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/destinations/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteEnvironment operation
#
##############################################################################
call_deleteEnvironment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getEnvironment operation
#
##############################################################################
call_getEnvironment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchEnvironment operation
#
##############################################################################
call_patchEnvironment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postEnvironment operation
#
##############################################################################
call_postEnvironment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call resetEnvironmentMobileKey operation
#
##############################################################################
call_resetEnvironmentMobileKey() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(expiry  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments/{environmentKey}/mobileKey" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call resetEnvironmentSDKKey operation
#
##############################################################################
call_resetEnvironmentSDKKey() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(expiry  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments/{environmentKey}/apiKey" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call copyFeatureFlag operation
#
##############################################################################
call_copyFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}/copy" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteFeatureFlag operation
#
##############################################################################
call_deleteFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getExpiringUserTargets operation
#
##############################################################################
call_getExpiringUserTargets() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlag operation
#
##############################################################################
call_getFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(env  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlagChangeRequest operation
#
##############################################################################
call_getFeatureFlagChangeRequest() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey environmentKey featureFlagChangeRequestId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{featureFlagChangeRequestId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlagChangeRequests operation
#
##############################################################################
call_getFeatureFlagChangeRequests() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlagStatus operation
#
##############################################################################
call_getFeatureFlagStatus() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlagStatusAcrossEnvironments operation
#
##############################################################################
call_getFeatureFlagStatusAcrossEnvironments() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flag-status/{projectKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlagStatuses operation
#
##############################################################################
call_getFeatureFlagStatuses() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flag-statuses/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlags operation
#
##############################################################################
call_getFeatureFlags() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(env summary archived limit offset filter sort tag  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchExpiringUserTargets operation
#
##############################################################################
call_patchExpiringUserTargets() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call patchFeatureFlag operation
#
##############################################################################
call_patchFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postApplyFeatureFlagChangeRequest operation
#
##############################################################################
call_postApplyFeatureFlagChangeRequest() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey environmentKey featureFlagChangeRequestId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{featureFlagChangeRequestId}/apply" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postFeatureFlag operation
#
##############################################################################
call_postFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(clone  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postFeatureFlagChangeRequest operation
#
##############################################################################
call_postFeatureFlagChangeRequest() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postReviewFeatureFlagChangeRequest operation
#
##############################################################################
call_postReviewFeatureFlagChangeRequest() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey environmentKey featureFlagChangeRequestId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{featureFlagChangeRequestId}/review" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteIntegrationSubscription operation
#
##############################################################################
call_deleteIntegrationSubscription() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(integrationKey integrationId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/integrations/{integrationKey}/{integrationId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getIntegrationSubscription operation
#
##############################################################################
call_getIntegrationSubscription() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(integrationKey integrationId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/integrations/{integrationKey}/{integrationId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getIntegrationSubscriptions operation
#
##############################################################################
call_getIntegrationSubscriptions() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(integrationKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/integrations/{integrationKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getIntegrations operation
#
##############################################################################
call_getIntegrations() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/integrations" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchIntegrationSubscription operation
#
##############################################################################
call_patchIntegrationSubscription() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(integrationKey integrationId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/integrations/{integrationKey}/{integrationId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postIntegrationSubscription operation
#
##############################################################################
call_postIntegrationSubscription() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(integrationKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/integrations/{integrationKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteProject operation
#
##############################################################################
call_deleteProject() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getProject operation
#
##############################################################################
call_getProject() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getProjects operation
#
##############################################################################
call_getProjects() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchProject operation
#
##############################################################################
call_patchProject() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postProject operation
#
##############################################################################
call_postProject() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteRelayProxyConfig operation
#
##############################################################################
call_deleteRelayProxyConfig() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/account/relay-auto-configs/{id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getRelayProxyConfig operation
#
##############################################################################
call_getRelayProxyConfig() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/account/relay-auto-configs/{id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getRelayProxyConfigs operation
#
##############################################################################
call_getRelayProxyConfigs() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/account/relay-auto-configs" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchRelayProxyConfig operation
#
##############################################################################
call_patchRelayProxyConfig() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/account/relay-auto-configs/{id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postRelayAutoConfig operation
#
##############################################################################
call_postRelayAutoConfig() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/account/relay-auto-configs" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call resetRelayProxyConfig operation
#
##############################################################################
call_resetRelayProxyConfig() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(expiry  )
    local path

    if ! path=$(build_request_path "/api/v2/account/relay-auto-configs/{id}/reset" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getRoot operation
#
##############################################################################
call_getRoot() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call deleteMember operation
#
##############################################################################
call_deleteMember() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(memberId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members/{memberId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getMe operation
#
##############################################################################
call_getMe() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members/me" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getMember operation
#
##############################################################################
call_getMember() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(memberId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members/{memberId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getMembers operation
#
##############################################################################
call_getMembers() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset filter sort  )
    local path

    if ! path=$(build_request_path "/api/v2/members" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchMember operation
#
##############################################################################
call_patchMember() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(memberId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members/{memberId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postMembers operation
#
##############################################################################
call_postMembers() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteUserSegment operation
#
##############################################################################
call_deleteUserSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}/{userSegmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getExpiringUserTargetsOnSegment operation
#
##############################################################################
call_getExpiringUserTargetsOnSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{userSegmentKey}/expiring-user-targets/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserSegment operation
#
##############################################################################
call_getUserSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}/{userSegmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserSegments operation
#
##############################################################################
call_getUserSegments() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(tag  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchExpiringUserTargetsOnSegment operation
#
##############################################################################
call_patchExpiringUserTargetsOnSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{userSegmentKey}/expiring-user-targets/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call patchUserSegment operation
#
##############################################################################
call_patchUserSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}/{userSegmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postUserSegment operation
#
##############################################################################
call_postUserSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call updatedUnboundedSegmentTargets operation
#
##############################################################################
call_updatedUnboundedSegmentTargets() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}/{userSegmentKey}/unbounded-users" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call getExpiringUserTargetsForUser operation
#
##############################################################################
call_getExpiringUserTargetsForUser() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{userKey}/expiring-user-targets/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserFlagSetting operation
#
##############################################################################
call_getUserFlagSetting() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserFlagSettings operation
#
##############################################################################
call_getUserFlagSettings() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchExpiringUserTargetsForFlags operation
#
##############################################################################
call_patchExpiringUserTargetsForFlags() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{userKey}/expiring-user-targets/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call putFlagSetting operation
#
##############################################################################
call_putFlagSetting() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteUser operation
#
##############################################################################
call_deleteUser() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getSearchUsers operation
#
##############################################################################
call_getSearchUsers() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(q limit offset after  )
    local path

    if ! path=$(build_request_path "/api/v2/user-search/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUser operation
#
##############################################################################
call_getUser() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUsers operation
#
##############################################################################
call_getUsers() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit h scrollId  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call deleteWebhook operation
#
##############################################################################
call_deleteWebhook() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(resourceId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks/{resourceId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getWebhook operation
#
##############################################################################
call_getWebhook() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(resourceId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks/{resourceId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getWebhooks operation
#
##############################################################################
call_getWebhooks() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchWebhook operation
#
##############################################################################
call_patchWebhook() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(resourceId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks/{resourceId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postWebhook operation
#
##############################################################################
call_postWebhook() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}



##############################################################################
#
# Main
#
##############################################################################


# Check dependencies
type curl >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'cURL' installed."; exit 1; }
type sed >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'sed' installed."; exit 1; }
type column >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'bsdmainutils' installed."; exit 1; }

#
# Process command line
#
# Pass all arguments before 'operation' to cURL except the ones we override
#
take_user=false
take_host=false
take_accept_header=false
take_contenttype_header=false

for key in "$@"; do
# Take the value of -u|--user argument
if [[ "$take_user" = true ]]; then
    basic_auth_credential="$key"
    take_user=false
    continue
fi
# Take the value of --host argument
if [[ "$take_host" = true ]]; then
    host="$key"
    take_host=false
    continue
fi
# Take the value of --accept argument
if [[ "$take_accept_header" = true ]]; then
    header_accept=$(lookup_mime_type "$key")
    take_accept_header=false
    continue
fi
# Take the value of --content-type argument
if [[ "$take_contenttype_header" = true ]]; then
    header_content_type=$(lookup_mime_type "$key")
    take_contenttype_header=false
    continue
fi
case $key in
    -h|--help)
    if [[ "x$operation" == "x" ]]; then
        print_help
        exit 0
    else
        eval "print_${operation}_help"
        exit 0
    fi
    ;;
    -V|--version)
    print_version
    exit 0
    ;;
    --about)
    print_about
    exit 0
    ;;
    -u|--user)
    take_user=true
    ;;
    --host)
    take_host=true
    ;;
    --force)
    force=true
    ;;
    -ac|--accept)
    take_accept_header=true
    ;;
    -ct|--content-type)
    take_contenttype_header=true
    ;;
    --dry-run)
    print_curl=true
    ;;
    -nc|--no-colors)
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        MAGENTA=""
        CYAN=""
        WHITE=""
        BOLD=""
        OFF=""
        result_color_table=( "" "" "" "" "" "" "" )
    ;;
    deleteToken)
    operation="deleteToken"
    ;;
    getToken)
    operation="getToken"
    ;;
    getTokens)
    operation="getTokens"
    ;;
    patchToken)
    operation="patchToken"
    ;;
    postToken)
    operation="postToken"
    ;;
    resetToken)
    operation="resetToken"
    ;;
    getAuditLogEntries)
    operation="getAuditLogEntries"
    ;;
    getAuditLogEntry)
    operation="getAuditLogEntry"
    ;;
    deleteCustomRole)
    operation="deleteCustomRole"
    ;;
    getCustomRole)
    operation="getCustomRole"
    ;;
    getCustomRoles)
    operation="getCustomRoles"
    ;;
    patchCustomRole)
    operation="patchCustomRole"
    ;;
    postCustomRole)
    operation="postCustomRole"
    ;;
    getEvaluations)
    operation="getEvaluations"
    ;;
    getEvent)
    operation="getEvent"
    ;;
    getEvents)
    operation="getEvents"
    ;;
    getMAU)
    operation="getMAU"
    ;;
    getMAUByCategory)
    operation="getMAUByCategory"
    ;;
    getStream)
    operation="getStream"
    ;;
    getStreamBySDK)
    operation="getStreamBySDK"
    ;;
    getStreamSDKVersion)
    operation="getStreamSDKVersion"
    ;;
    getStreams)
    operation="getStreams"
    ;;
    getUsage)
    operation="getUsage"
    ;;
    deleteDestination)
    operation="deleteDestination"
    ;;
    getDestination)
    operation="getDestination"
    ;;
    getDestinations)
    operation="getDestinations"
    ;;
    patchDestination)
    operation="patchDestination"
    ;;
    postDestination)
    operation="postDestination"
    ;;
    deleteEnvironment)
    operation="deleteEnvironment"
    ;;
    getEnvironment)
    operation="getEnvironment"
    ;;
    patchEnvironment)
    operation="patchEnvironment"
    ;;
    postEnvironment)
    operation="postEnvironment"
    ;;
    resetEnvironmentMobileKey)
    operation="resetEnvironmentMobileKey"
    ;;
    resetEnvironmentSDKKey)
    operation="resetEnvironmentSDKKey"
    ;;
    copyFeatureFlag)
    operation="copyFeatureFlag"
    ;;
    deleteFeatureFlag)
    operation="deleteFeatureFlag"
    ;;
    getExpiringUserTargets)
    operation="getExpiringUserTargets"
    ;;
    getFeatureFlag)
    operation="getFeatureFlag"
    ;;
    getFeatureFlagChangeRequest)
    operation="getFeatureFlagChangeRequest"
    ;;
    getFeatureFlagChangeRequests)
    operation="getFeatureFlagChangeRequests"
    ;;
    getFeatureFlagStatus)
    operation="getFeatureFlagStatus"
    ;;
    getFeatureFlagStatusAcrossEnvironments)
    operation="getFeatureFlagStatusAcrossEnvironments"
    ;;
    getFeatureFlagStatuses)
    operation="getFeatureFlagStatuses"
    ;;
    getFeatureFlags)
    operation="getFeatureFlags"
    ;;
    patchExpiringUserTargets)
    operation="patchExpiringUserTargets"
    ;;
    patchFeatureFlag)
    operation="patchFeatureFlag"
    ;;
    postApplyFeatureFlagChangeRequest)
    operation="postApplyFeatureFlagChangeRequest"
    ;;
    postFeatureFlag)
    operation="postFeatureFlag"
    ;;
    postFeatureFlagChangeRequest)
    operation="postFeatureFlagChangeRequest"
    ;;
    postReviewFeatureFlagChangeRequest)
    operation="postReviewFeatureFlagChangeRequest"
    ;;
    deleteIntegrationSubscription)
    operation="deleteIntegrationSubscription"
    ;;
    getIntegrationSubscription)
    operation="getIntegrationSubscription"
    ;;
    getIntegrationSubscriptions)
    operation="getIntegrationSubscriptions"
    ;;
    getIntegrations)
    operation="getIntegrations"
    ;;
    patchIntegrationSubscription)
    operation="patchIntegrationSubscription"
    ;;
    postIntegrationSubscription)
    operation="postIntegrationSubscription"
    ;;
    deleteProject)
    operation="deleteProject"
    ;;
    getProject)
    operation="getProject"
    ;;
    getProjects)
    operation="getProjects"
    ;;
    patchProject)
    operation="patchProject"
    ;;
    postProject)
    operation="postProject"
    ;;
    deleteRelayProxyConfig)
    operation="deleteRelayProxyConfig"
    ;;
    getRelayProxyConfig)
    operation="getRelayProxyConfig"
    ;;
    getRelayProxyConfigs)
    operation="getRelayProxyConfigs"
    ;;
    patchRelayProxyConfig)
    operation="patchRelayProxyConfig"
    ;;
    postRelayAutoConfig)
    operation="postRelayAutoConfig"
    ;;
    resetRelayProxyConfig)
    operation="resetRelayProxyConfig"
    ;;
    getRoot)
    operation="getRoot"
    ;;
    deleteMember)
    operation="deleteMember"
    ;;
    getMe)
    operation="getMe"
    ;;
    getMember)
    operation="getMember"
    ;;
    getMembers)
    operation="getMembers"
    ;;
    patchMember)
    operation="patchMember"
    ;;
    postMembers)
    operation="postMembers"
    ;;
    deleteUserSegment)
    operation="deleteUserSegment"
    ;;
    getExpiringUserTargetsOnSegment)
    operation="getExpiringUserTargetsOnSegment"
    ;;
    getUserSegment)
    operation="getUserSegment"
    ;;
    getUserSegments)
    operation="getUserSegments"
    ;;
    patchExpiringUserTargetsOnSegment)
    operation="patchExpiringUserTargetsOnSegment"
    ;;
    patchUserSegment)
    operation="patchUserSegment"
    ;;
    postUserSegment)
    operation="postUserSegment"
    ;;
    updatedUnboundedSegmentTargets)
    operation="updatedUnboundedSegmentTargets"
    ;;
    getExpiringUserTargetsForUser)
    operation="getExpiringUserTargetsForUser"
    ;;
    getUserFlagSetting)
    operation="getUserFlagSetting"
    ;;
    getUserFlagSettings)
    operation="getUserFlagSettings"
    ;;
    patchExpiringUserTargetsForFlags)
    operation="patchExpiringUserTargetsForFlags"
    ;;
    putFlagSetting)
    operation="putFlagSetting"
    ;;
    deleteUser)
    operation="deleteUser"
    ;;
    getSearchUsers)
    operation="getSearchUsers"
    ;;
    getUser)
    operation="getUser"
    ;;
    getUsers)
    operation="getUsers"
    ;;
    deleteWebhook)
    operation="deleteWebhook"
    ;;
    getWebhook)
    operation="getWebhook"
    ;;
    getWebhooks)
    operation="getWebhooks"
    ;;
    patchWebhook)
    operation="patchWebhook"
    ;;
    postWebhook)
    operation="postWebhook"
    ;;
    *==*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content as strings
    if [[ "$operation" ]]; then
        IFS='==' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]="\"${body_value}\""
    fi
    ;;
    *:=*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content without qoutes
    if [[ "$operation" ]]; then
        # ignore error about 'sep' being unused
        # shellcheck disable=SC2034
        IFS=':=' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]=${body_value}
    fi
    ;;
    +\([^=]\):*)
    # Parse header arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS=':' read -r header_name header_value <<< "$key"
        #
        # If the header key is the same as the api_key expected by API in the
        # header, override the ${apikey_auth_credential} variable
        #
        if [[ $header_name == "Authorization" ]]; then
            apikey_auth_credential=$header_value
        fi
        header_arguments[$header_name]=$header_value
    else
        curl_arguments+=" $key"
    fi
    ;;
    -)
    body_content_temp_file=$(mktemp)
    cat - > "$body_content_temp_file"
    ;;
    *=*)
    # Parse operation arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS='=' read -r parameter_name parameter_value <<< "$key"
        if [[ -z "${operation_parameters[$parameter_name]+foo}" ]]; then
            operation_parameters[$parameter_name]=$(url_escape "${parameter_value}")
        else
            operation_parameters[$parameter_name]+=":::"$(url_escape "${parameter_value}")
        fi
    else
        curl_arguments+=" $key"
    fi
    ;;
    *)
    # If we are before the operation, treat the arguments as cURL arguments
    if [[ "x$operation" == "x" ]]; then
        # Maintain quotes around cURL arguments if necessary
        space_regexp="[[:space:]]"
        if [[ $key =~ $space_regexp ]]; then
            curl_arguments+=" \"$key\""
        else
            curl_arguments+=" $key"
        fi
    fi
    ;;
esac
done


# Check if user provided host name
if [[ -z "$host" ]]; then
    ERROR_MSG="ERROR: No hostname provided!!! You have to  provide on command line option '--host ...'"
    exit 1
fi

# Check if user specified operation ID
if [[ -z "$operation" ]]; then
    ERROR_MSG="ERROR: No operation specified!!!"
    exit 1
fi


# Run cURL command based on the operation ID
case $operation in
    deleteToken)
    call_deleteToken
    ;;
    getToken)
    call_getToken
    ;;
    getTokens)
    call_getTokens
    ;;
    patchToken)
    call_patchToken
    ;;
    postToken)
    call_postToken
    ;;
    resetToken)
    call_resetToken
    ;;
    getAuditLogEntries)
    call_getAuditLogEntries
    ;;
    getAuditLogEntry)
    call_getAuditLogEntry
    ;;
    deleteCustomRole)
    call_deleteCustomRole
    ;;
    getCustomRole)
    call_getCustomRole
    ;;
    getCustomRoles)
    call_getCustomRoles
    ;;
    patchCustomRole)
    call_patchCustomRole
    ;;
    postCustomRole)
    call_postCustomRole
    ;;
    getEvaluations)
    call_getEvaluations
    ;;
    getEvent)
    call_getEvent
    ;;
    getEvents)
    call_getEvents
    ;;
    getMAU)
    call_getMAU
    ;;
    getMAUByCategory)
    call_getMAUByCategory
    ;;
    getStream)
    call_getStream
    ;;
    getStreamBySDK)
    call_getStreamBySDK
    ;;
    getStreamSDKVersion)
    call_getStreamSDKVersion
    ;;
    getStreams)
    call_getStreams
    ;;
    getUsage)
    call_getUsage
    ;;
    deleteDestination)
    call_deleteDestination
    ;;
    getDestination)
    call_getDestination
    ;;
    getDestinations)
    call_getDestinations
    ;;
    patchDestination)
    call_patchDestination
    ;;
    postDestination)
    call_postDestination
    ;;
    deleteEnvironment)
    call_deleteEnvironment
    ;;
    getEnvironment)
    call_getEnvironment
    ;;
    patchEnvironment)
    call_patchEnvironment
    ;;
    postEnvironment)
    call_postEnvironment
    ;;
    resetEnvironmentMobileKey)
    call_resetEnvironmentMobileKey
    ;;
    resetEnvironmentSDKKey)
    call_resetEnvironmentSDKKey
    ;;
    copyFeatureFlag)
    call_copyFeatureFlag
    ;;
    deleteFeatureFlag)
    call_deleteFeatureFlag
    ;;
    getExpiringUserTargets)
    call_getExpiringUserTargets
    ;;
    getFeatureFlag)
    call_getFeatureFlag
    ;;
    getFeatureFlagChangeRequest)
    call_getFeatureFlagChangeRequest
    ;;
    getFeatureFlagChangeRequests)
    call_getFeatureFlagChangeRequests
    ;;
    getFeatureFlagStatus)
    call_getFeatureFlagStatus
    ;;
    getFeatureFlagStatusAcrossEnvironments)
    call_getFeatureFlagStatusAcrossEnvironments
    ;;
    getFeatureFlagStatuses)
    call_getFeatureFlagStatuses
    ;;
    getFeatureFlags)
    call_getFeatureFlags
    ;;
    patchExpiringUserTargets)
    call_patchExpiringUserTargets
    ;;
    patchFeatureFlag)
    call_patchFeatureFlag
    ;;
    postApplyFeatureFlagChangeRequest)
    call_postApplyFeatureFlagChangeRequest
    ;;
    postFeatureFlag)
    call_postFeatureFlag
    ;;
    postFeatureFlagChangeRequest)
    call_postFeatureFlagChangeRequest
    ;;
    postReviewFeatureFlagChangeRequest)
    call_postReviewFeatureFlagChangeRequest
    ;;
    deleteIntegrationSubscription)
    call_deleteIntegrationSubscription
    ;;
    getIntegrationSubscription)
    call_getIntegrationSubscription
    ;;
    getIntegrationSubscriptions)
    call_getIntegrationSubscriptions
    ;;
    getIntegrations)
    call_getIntegrations
    ;;
    patchIntegrationSubscription)
    call_patchIntegrationSubscription
    ;;
    postIntegrationSubscription)
    call_postIntegrationSubscription
    ;;
    deleteProject)
    call_deleteProject
    ;;
    getProject)
    call_getProject
    ;;
    getProjects)
    call_getProjects
    ;;
    patchProject)
    call_patchProject
    ;;
    postProject)
    call_postProject
    ;;
    deleteRelayProxyConfig)
    call_deleteRelayProxyConfig
    ;;
    getRelayProxyConfig)
    call_getRelayProxyConfig
    ;;
    getRelayProxyConfigs)
    call_getRelayProxyConfigs
    ;;
    patchRelayProxyConfig)
    call_patchRelayProxyConfig
    ;;
    postRelayAutoConfig)
    call_postRelayAutoConfig
    ;;
    resetRelayProxyConfig)
    call_resetRelayProxyConfig
    ;;
    getRoot)
    call_getRoot
    ;;
    deleteMember)
    call_deleteMember
    ;;
    getMe)
    call_getMe
    ;;
    getMember)
    call_getMember
    ;;
    getMembers)
    call_getMembers
    ;;
    patchMember)
    call_patchMember
    ;;
    postMembers)
    call_postMembers
    ;;
    deleteUserSegment)
    call_deleteUserSegment
    ;;
    getExpiringUserTargetsOnSegment)
    call_getExpiringUserTargetsOnSegment
    ;;
    getUserSegment)
    call_getUserSegment
    ;;
    getUserSegments)
    call_getUserSegments
    ;;
    patchExpiringUserTargetsOnSegment)
    call_patchExpiringUserTargetsOnSegment
    ;;
    patchUserSegment)
    call_patchUserSegment
    ;;
    postUserSegment)
    call_postUserSegment
    ;;
    updatedUnboundedSegmentTargets)
    call_updatedUnboundedSegmentTargets
    ;;
    getExpiringUserTargetsForUser)
    call_getExpiringUserTargetsForUser
    ;;
    getUserFlagSetting)
    call_getUserFlagSetting
    ;;
    getUserFlagSettings)
    call_getUserFlagSettings
    ;;
    patchExpiringUserTargetsForFlags)
    call_patchExpiringUserTargetsForFlags
    ;;
    putFlagSetting)
    call_putFlagSetting
    ;;
    deleteUser)
    call_deleteUser
    ;;
    getSearchUsers)
    call_getSearchUsers
    ;;
    getUser)
    call_getUser
    ;;
    getUsers)
    call_getUsers
    ;;
    deleteWebhook)
    call_deleteWebhook
    ;;
    getWebhook)
    call_getWebhook
    ;;
    getWebhooks)
    call_getWebhooks
    ;;
    patchWebhook)
    call_patchWebhook
    ;;
    postWebhook)
    call_postWebhook
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac
