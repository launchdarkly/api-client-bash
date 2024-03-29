This repository contains a client library for LaunchDarkly's REST API. This client was automatically
generated from our [OpenAPI specification](https://github.com/launchdarkly/ld-openapi).

This REST API is for custom integrations, data export, or automating your feature flag workflows. *DO NOT* use this client library to include feature flags in your web or mobile application. To integrate feature flags with your application, please see the [SDK documentation](https://docs.launchdarkly.com/v2.0/docs)

# LaunchDarkly REST API Bash client - DEPRECATED 
## This project repo is no longer being maintained.
Other maintained [API clients](https://github.com/launchdarkly?q=api-client&type=&language=&sort=) can be found under our LaunchDarkly Github Organization.

## Overview
This is a Bash client script for accessing LaunchDarkly REST API service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x 

# Print the list of operations available on the service
$ ./ -h

# Print the service description
$ ./ --about

# Print detailed information about specific operation
$ ./ <operationId> -h

# Make GET request
./ --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
 -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Preview the cURL command without actually executing it
$  --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image
You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash
The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source .bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp .bash-completion /etc/bash-completion.d/
```

#### OS X
On OSX you might need to install bash-completion using Homebrew:
```shell
brew install bash-completion
```
and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh
In Zsh, the generated `_` Zsh completion file must be copied to one of the folders under `$FPATH` variable.


## Documentation for API Endpoints

All URIs are relative to */api/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AccessTokensApi* | [**deleteToken**](docs/AccessTokensApi.md#deletetoken) | **DELETE** /tokens/{tokenId} | Delete an access token by ID.
*AccessTokensApi* | [**getToken**](docs/AccessTokensApi.md#gettoken) | **GET** /tokens/{tokenId} | Get a single access token by ID.
*AccessTokensApi* | [**getTokens**](docs/AccessTokensApi.md#gettokens) | **GET** /tokens | Returns a list of tokens in the account.
*AccessTokensApi* | [**patchToken**](docs/AccessTokensApi.md#patchtoken) | **PATCH** /tokens/{tokenId} | Modify an access token by ID.
*AccessTokensApi* | [**postToken**](docs/AccessTokensApi.md#posttoken) | **POST** /tokens | Create a new token.
*AccessTokensApi* | [**resetToken**](docs/AccessTokensApi.md#resettoken) | **POST** /tokens/{tokenId}/reset | Reset an access token&#39;s secret key with an optional expiry time for the old key.
*AuditLogApi* | [**getAuditLogEntries**](docs/AuditLogApi.md#getauditlogentries) | **GET** /auditlog | Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.
*AuditLogApi* | [**getAuditLogEntry**](docs/AuditLogApi.md#getauditlogentry) | **GET** /auditlog/{resourceId} | Use this endpoint to fetch a single audit log entry by its resouce ID.
*CustomRolesApi* | [**deleteCustomRole**](docs/CustomRolesApi.md#deletecustomrole) | **DELETE** /roles/{customRoleKey} | Delete a custom role by key.
*CustomRolesApi* | [**getCustomRole**](docs/CustomRolesApi.md#getcustomrole) | **GET** /roles/{customRoleKey} | Get one custom role by key.
*CustomRolesApi* | [**getCustomRoles**](docs/CustomRolesApi.md#getcustomroles) | **GET** /roles | Return a complete list of custom roles.
*CustomRolesApi* | [**patchCustomRole**](docs/CustomRolesApi.md#patchcustomrole) | **PATCH** /roles/{customRoleKey} | Modify a custom role by key.
*CustomRolesApi* | [**postCustomRole**](docs/CustomRolesApi.md#postcustomrole) | **POST** /roles | Create a new custom role.
*CustomerMetricsApi* | [**getEvaluations**](docs/CustomerMetricsApi.md#getevaluations) | **GET** /usage/evaluations/{envId}/{flagKey} | Get events usage by event id and the feature flag key.
*CustomerMetricsApi* | [**getEvent**](docs/CustomerMetricsApi.md#getevent) | **GET** /usage/events/{type} | Get events usage by event type.
*CustomerMetricsApi* | [**getEvents**](docs/CustomerMetricsApi.md#getevents) | **GET** /usage/events | Get events usage endpoints.
*CustomerMetricsApi* | [**getMAU**](docs/CustomerMetricsApi.md#getmau) | **GET** /usage/mau | Get monthly active user data.
*CustomerMetricsApi* | [**getMAUByCategory**](docs/CustomerMetricsApi.md#getmaubycategory) | **GET** /usage/mau/bycategory | Get monthly active user data by category.
*CustomerMetricsApi* | [**getStream**](docs/CustomerMetricsApi.md#getstream) | **GET** /usage/streams/{source} | Get a stream endpoint and return timeseries data.
*CustomerMetricsApi* | [**getStreamBySDK**](docs/CustomerMetricsApi.md#getstreambysdk) | **GET** /usage/streams/{source}/bysdkversion | Get a stream timeseries data by source show sdk version metadata.
*CustomerMetricsApi* | [**getStreamSDKVersion**](docs/CustomerMetricsApi.md#getstreamsdkversion) | **GET** /usage/streams/{source}/sdkversions | Get a stream timeseries data by source and show all sdk version associated.
*CustomerMetricsApi* | [**getStreams**](docs/CustomerMetricsApi.md#getstreams) | **GET** /usage/streams | Returns a list of all streams.
*CustomerMetricsApi* | [**getUsage**](docs/CustomerMetricsApi.md#getusage) | **GET** /usage | Returns of the usage endpoints available.
*DataExportDestinationsApi* | [**deleteDestination**](docs/DataExportDestinationsApi.md#deletedestination) | **DELETE** /destinations/{projectKey}/{environmentKey}/{destinationId} | Get a single data export destination by ID
*DataExportDestinationsApi* | [**getDestination**](docs/DataExportDestinationsApi.md#getdestination) | **GET** /destinations/{projectKey}/{environmentKey}/{destinationId} | Get a single data export destination by ID
*DataExportDestinationsApi* | [**getDestinations**](docs/DataExportDestinationsApi.md#getdestinations) | **GET** /destinations | Returns a list of all data export destinations.
*DataExportDestinationsApi* | [**patchDestination**](docs/DataExportDestinationsApi.md#patchdestination) | **PATCH** /destinations/{projectKey}/{environmentKey}/{destinationId} | Perform a partial update to a data export destination.
*DataExportDestinationsApi* | [**postDestination**](docs/DataExportDestinationsApi.md#postdestination) | **POST** /destinations/{projectKey}/{environmentKey} | Create a new data export destination
*EnvironmentsApi* | [**deleteEnvironment**](docs/EnvironmentsApi.md#deleteenvironment) | **DELETE** /projects/{projectKey}/environments/{environmentKey} | Delete an environment in a specific project.
*EnvironmentsApi* | [**getEnvironment**](docs/EnvironmentsApi.md#getenvironment) | **GET** /projects/{projectKey}/environments/{environmentKey} | Get an environment given a project and key.
*EnvironmentsApi* | [**patchEnvironment**](docs/EnvironmentsApi.md#patchenvironment) | **PATCH** /projects/{projectKey}/environments/{environmentKey} | Modify an environment by ID. If you try to patch the environment by setting both required and requiredApprovalTags, it will result in an error. Users can specify either required approvals for all flags in an environment or those with specific tags, but not both. Only customers on an Enterprise plan can require approval for flag updates with either mechanism.
*EnvironmentsApi* | [**postEnvironment**](docs/EnvironmentsApi.md#postenvironment) | **POST** /projects/{projectKey}/environments | Create a new environment in a specified project with a given name, key, and swatch color.
*EnvironmentsApi* | [**resetEnvironmentMobileKey**](docs/EnvironmentsApi.md#resetenvironmentmobilekey) | **POST** /projects/{projectKey}/environments/{environmentKey}/mobileKey | Reset an environment&#39;s mobile key. The optional expiry for the old key is deprecated for this endpoint, so the old key will always expire immediately.
*EnvironmentsApi* | [**resetEnvironmentSDKKey**](docs/EnvironmentsApi.md#resetenvironmentsdkkey) | **POST** /projects/{projectKey}/environments/{environmentKey}/apiKey | Reset an environment&#39;s SDK key with an optional expiry time for the old key.
*FeatureFlagsApi* | [**copyFeatureFlag**](docs/FeatureFlagsApi.md#copyfeatureflag) | **POST** /flags/{projectKey}/{featureFlagKey}/copy | Copies the feature flag configuration from one environment to the same feature flag in another environment.
*FeatureFlagsApi* | [**deleteApprovalRequest**](docs/FeatureFlagsApi.md#deleteapprovalrequest) | **DELETE** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{approvalRequestId} | Delete an approval request for a feature flag config
*FeatureFlagsApi* | [**deleteFeatureFlag**](docs/FeatureFlagsApi.md#deletefeatureflag) | **DELETE** /flags/{projectKey}/{featureFlagKey} | Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
*FeatureFlagsApi* | [**deleteFlagConfigScheduledChanges**](docs/FeatureFlagsApi.md#deleteflagconfigscheduledchanges) | **DELETE** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes/{scheduledChangeId} | Delete a scheduled change on a feature flag in an environment.
*FeatureFlagsApi* | [**flagsProjectKeyEnvironmentKeyFeatureFlagKeyDependentFlagsGet**](docs/FeatureFlagsApi.md#flagsprojectkeyenvironmentkeyfeatureflagkeydependentflagsget) | **GET** /flags/{projectKey}/{environmentKey}/{featureFlagKey}/dependent-flags | Get dependent flags for the flag in the environment specified in path parameters
*FeatureFlagsApi* | [**flagsProjectKeyFeatureFlagKeyDependentFlagsGet**](docs/FeatureFlagsApi.md#flagsprojectkeyfeatureflagkeydependentflagsget) | **GET** /flags/{projectKey}/{featureFlagKey}/dependent-flags | Get dependent flags across all environments for the flag specified in the path parameters
*FeatureFlagsApi* | [**getApprovalRequest**](docs/FeatureFlagsApi.md#getapprovalrequest) | **GET** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{approvalRequestId} | Get a single approval request for a feature flag config
*FeatureFlagsApi* | [**getApprovalRequests**](docs/FeatureFlagsApi.md#getapprovalrequests) | **GET** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests | Get all approval requests for a feature flag config
*FeatureFlagsApi* | [**getExpiringUserTargets**](docs/FeatureFlagsApi.md#getexpiringusertargets) | **GET** /flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey} | Get expiring user targets for feature flag
*FeatureFlagsApi* | [**getFeatureFlag**](docs/FeatureFlagsApi.md#getfeatureflag) | **GET** /flags/{projectKey}/{featureFlagKey} | Get a single feature flag by key.
*FeatureFlagsApi* | [**getFeatureFlagStatus**](docs/FeatureFlagsApi.md#getfeatureflagstatus) | **GET** /flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey} | Get the status for a particular feature flag.
*FeatureFlagsApi* | [**getFeatureFlagStatusAcrossEnvironments**](docs/FeatureFlagsApi.md#getfeatureflagstatusacrossenvironments) | **GET** /flag-status/{projectKey}/{featureFlagKey} | Get the status for a particular feature flag across environments
*FeatureFlagsApi* | [**getFeatureFlagStatuses**](docs/FeatureFlagsApi.md#getfeatureflagstatuses) | **GET** /flag-statuses/{projectKey}/{environmentKey} | Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
*FeatureFlagsApi* | [**getFeatureFlags**](docs/FeatureFlagsApi.md#getfeatureflags) | **GET** /flags/{projectKey} | Get a list of all features in the given project.
*FeatureFlagsApi* | [**getFlagConfigScheduledChange**](docs/FeatureFlagsApi.md#getflagconfigscheduledchange) | **GET** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes/{scheduledChangeId} | Get a scheduled change on a feature flag by id.
*FeatureFlagsApi* | [**getFlagConfigScheduledChanges**](docs/FeatureFlagsApi.md#getflagconfigscheduledchanges) | **GET** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes | Get all scheduled workflows for a feature flag by key.
*FeatureFlagsApi* | [**getFlagConfigScheduledChangesConflicts**](docs/FeatureFlagsApi.md#getflagconfigscheduledchangesconflicts) | **POST** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes-conflicts | Lists conflicts between the given instructions and any existing scheduled changes for the feature flag. The actual HTTP verb should be REPORT, not POST.
*FeatureFlagsApi* | [**patchExpiringUserTargets**](docs/FeatureFlagsApi.md#patchexpiringusertargets) | **PATCH** /flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey} | Update, add, or delete expiring user targets on feature flag
*FeatureFlagsApi* | [**patchFeatureFlag**](docs/FeatureFlagsApi.md#patchfeatureflag) | **PATCH** /flags/{projectKey}/{featureFlagKey} | Perform a partial update to a feature.
*FeatureFlagsApi* | [**patchFlagConfigScheduledChange**](docs/FeatureFlagsApi.md#patchflagconfigscheduledchange) | **PATCH** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes/{scheduledChangeId} | Updates an existing scheduled-change on a feature flag in an environment.
*FeatureFlagsApi* | [**postApplyApprovalRequest**](docs/FeatureFlagsApi.md#postapplyapprovalrequest) | **POST** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{approvalRequestId}/apply | Apply approval request for a feature flag config
*FeatureFlagsApi* | [**postApprovalRequest**](docs/FeatureFlagsApi.md#postapprovalrequest) | **POST** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{approvalRequestId} | Create an approval request for a feature flag config
*FeatureFlagsApi* | [**postFeatureFlag**](docs/FeatureFlagsApi.md#postfeatureflag) | **POST** /flags/{projectKey} | Creates a new feature flag.
*FeatureFlagsApi* | [**postFlagConfigScheduledChanges**](docs/FeatureFlagsApi.md#postflagconfigscheduledchanges) | **POST** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/scheduled-changes | Creates a new scheduled change for a feature flag.
*FeatureFlagsApi* | [**postReviewApprovalRequest**](docs/FeatureFlagsApi.md#postreviewapprovalrequest) | **POST** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{approvalRequestId}/review | Review approval request for a feature flag config
*IntegrationsApi* | [**deleteIntegrationSubscription**](docs/IntegrationsApi.md#deleteintegrationsubscription) | **DELETE** /integrations/{integrationKey}/{integrationId} | Delete an integration subscription by ID.
*IntegrationsApi* | [**getIntegrationSubscription**](docs/IntegrationsApi.md#getintegrationsubscription) | **GET** /integrations/{integrationKey}/{integrationId} | Get a single integration subscription by ID.
*IntegrationsApi* | [**getIntegrationSubscriptions**](docs/IntegrationsApi.md#getintegrationsubscriptions) | **GET** /integrations/{integrationKey} | Get a list of all configured integrations of a given kind.
*IntegrationsApi* | [**getIntegrations**](docs/IntegrationsApi.md#getintegrations) | **GET** /integrations | Get a list of all configured audit log event integrations associated with this account.
*IntegrationsApi* | [**patchIntegrationSubscription**](docs/IntegrationsApi.md#patchintegrationsubscription) | **PATCH** /integrations/{integrationKey}/{integrationId} | Modify an integration subscription by ID.
*IntegrationsApi* | [**postIntegrationSubscription**](docs/IntegrationsApi.md#postintegrationsubscription) | **POST** /integrations/{integrationKey} | Create a new integration subscription of a given kind.
*ProjectsApi* | [**deleteProject**](docs/ProjectsApi.md#deleteproject) | **DELETE** /projects/{projectKey} | Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.
*ProjectsApi* | [**getProject**](docs/ProjectsApi.md#getproject) | **GET** /projects/{projectKey} | Fetch a single project by key.
*ProjectsApi* | [**getProjects**](docs/ProjectsApi.md#getprojects) | **GET** /projects | Returns a list of all projects in the account.
*ProjectsApi* | [**patchProject**](docs/ProjectsApi.md#patchproject) | **PATCH** /projects/{projectKey} | Modify a project by ID.
*ProjectsApi* | [**postProject**](docs/ProjectsApi.md#postproject) | **POST** /projects | Create a new project with the given key and name.
*RelayProxyConfigurationsApi* | [**deleteRelayProxyConfig**](docs/RelayProxyConfigurationsApi.md#deleterelayproxyconfig) | **DELETE** /account/relay-auto-configs/{id} | Delete a relay proxy configuration by ID.
*RelayProxyConfigurationsApi* | [**getRelayProxyConfig**](docs/RelayProxyConfigurationsApi.md#getrelayproxyconfig) | **GET** /account/relay-auto-configs/{id} | Get a single relay proxy configuration by ID.
*RelayProxyConfigurationsApi* | [**getRelayProxyConfigs**](docs/RelayProxyConfigurationsApi.md#getrelayproxyconfigs) | **GET** /account/relay-auto-configs | Returns a list of relay proxy configurations in the account.
*RelayProxyConfigurationsApi* | [**patchRelayProxyConfig**](docs/RelayProxyConfigurationsApi.md#patchrelayproxyconfig) | **PATCH** /account/relay-auto-configs/{id} | Modify a relay proxy configuration by ID.
*RelayProxyConfigurationsApi* | [**postRelayAutoConfig**](docs/RelayProxyConfigurationsApi.md#postrelayautoconfig) | **POST** /account/relay-auto-configs | Create a new relay proxy config.
*RelayProxyConfigurationsApi* | [**resetRelayProxyConfig**](docs/RelayProxyConfigurationsApi.md#resetrelayproxyconfig) | **POST** /account/relay-auto-configs/{id}/reset | Reset a relay proxy configuration&#39;s secret key with an optional expiry time for the old key.
*RootApi* | [**getRoot**](docs/RootApi.md#getroot) | **GET** / | 
*TeamMembersApi* | [**deleteMember**](docs/TeamMembersApi.md#deletemember) | **DELETE** /members/{memberId} | Delete a team member by ID.
*TeamMembersApi* | [**getMe**](docs/TeamMembersApi.md#getme) | **GET** /members/me | Get the current team member associated with the token
*TeamMembersApi* | [**getMember**](docs/TeamMembersApi.md#getmember) | **GET** /members/{memberId} | Get a single team member by ID.
*TeamMembersApi* | [**getMembers**](docs/TeamMembersApi.md#getmembers) | **GET** /members | Returns a list of all members in the account.
*TeamMembersApi* | [**patchMember**](docs/TeamMembersApi.md#patchmember) | **PATCH** /members/{memberId} | Modify a team member by ID.
*TeamMembersApi* | [**postMembers**](docs/TeamMembersApi.md#postmembers) | **POST** /members | Invite new members.
*UserSegmentsApi* | [**deleteUserSegment**](docs/UserSegmentsApi.md#deleteusersegment) | **DELETE** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Delete a user segment.
*UserSegmentsApi* | [**getExpiringUserTargetsOnSegment**](docs/UserSegmentsApi.md#getexpiringusertargetsonsegment) | **GET** /segments/{projectKey}/{userSegmentKey}/expiring-user-targets/{environmentKey} | Get expiring user targets for user segment
*UserSegmentsApi* | [**getUserSegment**](docs/UserSegmentsApi.md#getusersegment) | **GET** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Get a single user segment by key.
*UserSegmentsApi* | [**getUserSegments**](docs/UserSegmentsApi.md#getusersegments) | **GET** /segments/{projectKey}/{environmentKey} | Get a list of all user segments in the given project.
*UserSegmentsApi* | [**patchExpiringUserTargetsOnSegment**](docs/UserSegmentsApi.md#patchexpiringusertargetsonsegment) | **PATCH** /segments/{projectKey}/{userSegmentKey}/expiring-user-targets/{environmentKey} | Update, add, or delete expiring user targets on user segment
*UserSegmentsApi* | [**patchUserSegment**](docs/UserSegmentsApi.md#patchusersegment) | **PATCH** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Perform a partial update to a user segment.
*UserSegmentsApi* | [**postUserSegment**](docs/UserSegmentsApi.md#postusersegment) | **POST** /segments/{projectKey}/{environmentKey} | Creates a new user segment.
*UserSegmentsApi* | [**updateBigSegmentTargets**](docs/UserSegmentsApi.md#updatebigsegmenttargets) | **POST** /segments/{projectKey}/{environmentKey}/{userSegmentKey}/users | Update targets included or excluded in a big segment
*UserSettingsApi* | [**getExpiringUserTargetsForUser**](docs/UserSettingsApi.md#getexpiringusertargetsforuser) | **GET** /users/{projectKey}/{userKey}/expiring-user-targets/{environmentKey} | Get expiring dates on flags for user
*UserSettingsApi* | [**getUserFlagSetting**](docs/UserSettingsApi.md#getuserflagsetting) | **GET** /users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Fetch a single flag setting for a user by key.
*UserSettingsApi* | [**getUserFlagSettings**](docs/UserSettingsApi.md#getuserflagsettings) | **GET** /users/{projectKey}/{environmentKey}/{userKey}/flags | Fetch a single flag setting for a user by key.
*UserSettingsApi* | [**patchExpiringUserTargetsForFlags**](docs/UserSettingsApi.md#patchexpiringusertargetsforflags) | **PATCH** /users/{projectKey}/{userKey}/expiring-user-targets/{environmentKey} | Update, add, or delete expiring user targets for a single user on all flags
*UserSettingsApi* | [**putFlagSetting**](docs/UserSettingsApi.md#putflagsetting) | **PUT** /users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Specifically enable or disable a feature flag for a user based on their key.
*UsersApi* | [**deleteUser**](docs/UsersApi.md#deleteuser) | **DELETE** /users/{projectKey}/{environmentKey}/{userKey} | Delete a user by ID.
*UsersApi* | [**getSearchUsers**](docs/UsersApi.md#getsearchusers) | **GET** /user-search/{projectKey}/{environmentKey} | Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource.
*UsersApi* | [**getUser**](docs/UsersApi.md#getuser) | **GET** /users/{projectKey}/{environmentKey}/{userKey} | Get a user by key.
*UsersApi* | [**getUsers**](docs/UsersApi.md#getusers) | **GET** /users/{projectKey}/{environmentKey} | List all users in the environment. Includes the total count of users. In each page, there will be up to &#39;limit&#39; users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection.
*WebhooksApi* | [**deleteWebhook**](docs/WebhooksApi.md#deletewebhook) | **DELETE** /webhooks/{resourceId} | Delete a webhook by ID.
*WebhooksApi* | [**getWebhook**](docs/WebhooksApi.md#getwebhook) | **GET** /webhooks/{resourceId} | Get a webhook by ID.
*WebhooksApi* | [**getWebhooks**](docs/WebhooksApi.md#getwebhooks) | **GET** /webhooks | Fetch a list of all webhooks.
*WebhooksApi* | [**patchWebhook**](docs/WebhooksApi.md#patchwebhook) | **PATCH** /webhooks/{resourceId} | Modify a webhook by ID.
*WebhooksApi* | [**postWebhook**](docs/WebhooksApi.md#postwebhook) | **POST** /webhooks | Create a webhook.


## Documentation For Models

 - [ApprovalRequest](docs/ApprovalRequest.md)
 - [ApprovalRequestApplyConfigBody](docs/ApprovalRequestApplyConfigBody.md)
 - [ApprovalRequestConfigBody](docs/ApprovalRequestConfigBody.md)
 - [ApprovalRequestReview](docs/ApprovalRequestReview.md)
 - [ApprovalRequestReviewConfigBody](docs/ApprovalRequestReviewConfigBody.md)
 - [ApprovalRequestReviewStatus](docs/ApprovalRequestReviewStatus.md)
 - [ApprovalRequests](docs/ApprovalRequests.md)
 - [AuditLogEntries](docs/AuditLogEntries.md)
 - [AuditLogEntry](docs/AuditLogEntry.md)
 - [AuditLogEntry_target](docs/AuditLogEntry_target.md)
 - [BigSegmentTargetChanges](docs/BigSegmentTargetChanges.md)
 - [BigSegmentTargetsBody](docs/BigSegmentTargetsBody.md)
 - [Clause](docs/Clause.md)
 - [ClientSideAvailability](docs/ClientSideAvailability.md)
 - [CopyActions](docs/CopyActions.md)
 - [CustomProperty](docs/CustomProperty.md)
 - [CustomPropertyValues](docs/CustomPropertyValues.md)
 - [CustomRole](docs/CustomRole.md)
 - [CustomRoleBody](docs/CustomRoleBody.md)
 - [CustomRoles](docs/CustomRoles.md)
 - [Defaults](docs/Defaults.md)
 - [DependentFlag](docs/DependentFlag.md)
 - [DependentFlagEnvironment](docs/DependentFlagEnvironment.md)
 - [DependentFlagEnvironment__links](docs/DependentFlagEnvironment__links.md)
 - [DependentFlag__links](docs/DependentFlag__links.md)
 - [DependentFlagsByEnvironment](docs/DependentFlagsByEnvironment.md)
 - [DependentFlagsLinks](docs/DependentFlagsLinks.md)
 - [Destination](docs/Destination.md)
 - [DestinationAmazonKinesis](docs/DestinationAmazonKinesis.md)
 - [DestinationBody](docs/DestinationBody.md)
 - [DestinationGooglePubSub](docs/DestinationGooglePubSub.md)
 - [DestinationMParticle](docs/DestinationMParticle.md)
 - [DestinationSegment](docs/DestinationSegment.md)
 - [Destinations](docs/Destinations.md)
 - [Environment](docs/Environment.md)
 - [EnvironmentPost](docs/EnvironmentPost.md)
 - [Environment_approvalSettings](docs/Environment_approvalSettings.md)
 - [EvaluationUsageError](docs/EvaluationUsageError.md)
 - [Events](docs/Events.md)
 - [Fallthrough](docs/Fallthrough.md)
 - [FeatureFlag](docs/FeatureFlag.md)
 - [FeatureFlagBody](docs/FeatureFlagBody.md)
 - [FeatureFlagConfig](docs/FeatureFlagConfig.md)
 - [FeatureFlagCopyBody](docs/FeatureFlagCopyBody.md)
 - [FeatureFlagCopyObject](docs/FeatureFlagCopyObject.md)
 - [FeatureFlagScheduledChange](docs/FeatureFlagScheduledChange.md)
 - [FeatureFlagScheduledChanges](docs/FeatureFlagScheduledChanges.md)
 - [FeatureFlagScheduledChangesConflicts](docs/FeatureFlagScheduledChangesConflicts.md)
 - [FeatureFlagScheduledChangesConflicts_instructions](docs/FeatureFlagScheduledChangesConflicts_instructions.md)
 - [FeatureFlagStatus](docs/FeatureFlagStatus.md)
 - [FeatureFlagStatusAcrossEnvironments](docs/FeatureFlagStatusAcrossEnvironments.md)
 - [FeatureFlagStatusForQueriedEnvironment](docs/FeatureFlagStatusForQueriedEnvironment.md)
 - [FeatureFlagStatusLinks](docs/FeatureFlagStatusLinks.md)
 - [FeatureFlagStatuses](docs/FeatureFlagStatuses.md)
 - [FeatureFlags](docs/FeatureFlags.md)
 - [FlagConfigScheduledChangesConflictsBody](docs/FlagConfigScheduledChangesConflictsBody.md)
 - [FlagConfigScheduledChangesPatchBody](docs/FlagConfigScheduledChangesPatchBody.md)
 - [FlagConfigScheduledChangesPostBody](docs/FlagConfigScheduledChangesPostBody.md)
 - [FlagListItem](docs/FlagListItem.md)
 - [HierarchicalLinks](docs/HierarchicalLinks.md)
 - [Id](docs/Id.md)
 - [Integration](docs/Integration.md)
 - [IntegrationSubscription](docs/IntegrationSubscription.md)
 - [IntegrationSubscription__status](docs/IntegrationSubscription__status.md)
 - [Integrations](docs/Integrations.md)
 - [Link](docs/Link.md)
 - [Links](docs/Links.md)
 - [MAU](docs/MAU.md)
 - [MAUMetadata](docs/MAUMetadata.md)
 - [MAUbyCategory](docs/MAUbyCategory.md)
 - [Member](docs/Member.md)
 - [Member__lastSeenMetadata](docs/Member__lastSeenMetadata.md)
 - [Members](docs/Members.md)
 - [MembersBody](docs/MembersBody.md)
 - [MultiEnvironmentDependentFlag](docs/MultiEnvironmentDependentFlag.md)
 - [MultiEnvironmentDependentFlags](docs/MultiEnvironmentDependentFlags.md)
 - [PatchComment](docs/PatchComment.md)
 - [PatchOperation](docs/PatchOperation.md)
 - [Policy](docs/Policy.md)
 - [Prerequisite](docs/Prerequisite.md)
 - [Project](docs/Project.md)
 - [ProjectBody](docs/ProjectBody.md)
 - [Projects](docs/Projects.md)
 - [RelayProxyConfig](docs/RelayProxyConfig.md)
 - [RelayProxyConfigBody](docs/RelayProxyConfigBody.md)
 - [RelayProxyConfigs](docs/RelayProxyConfigs.md)
 - [Role](docs/Role.md)
 - [Rollout](docs/Rollout.md)
 - [Rule](docs/Rule.md)
 - [ScheduledChangesFeatureFlagConflict](docs/ScheduledChangesFeatureFlagConflict.md)
 - [SemanticPatchInstruction](docs/SemanticPatchInstruction.md)
 - [SemanticPatchInstruction_inner](docs/SemanticPatchInstruction_inner.md)
 - [SemanticPatchOperation](docs/SemanticPatchOperation.md)
 - [Site](docs/Site.md)
 - [Statement](docs/Statement.md)
 - [Stream](docs/Stream.md)
 - [StreamBySDK](docs/StreamBySDK.md)
 - [StreamBySDKLinks](docs/StreamBySDKLinks.md)
 - [StreamBySDKLinksMetadata](docs/StreamBySDKLinksMetadata.md)
 - [StreamLinks](docs/StreamLinks.md)
 - [StreamSDKVersion](docs/StreamSDKVersion.md)
 - [StreamSDKVersionData](docs/StreamSDKVersionData.md)
 - [StreamUsageError](docs/StreamUsageError.md)
 - [StreamUsageLinks](docs/StreamUsageLinks.md)
 - [StreamUsageMetadata](docs/StreamUsageMetadata.md)
 - [StreamUsageSeries](docs/StreamUsageSeries.md)
 - [Streams](docs/Streams.md)
 - [SubscriptionBody](docs/SubscriptionBody.md)
 - [Target](docs/Target.md)
 - [Token](docs/Token.md)
 - [TokenBody](docs/TokenBody.md)
 - [Tokens](docs/Tokens.md)
 - [Usage](docs/Usage.md)
 - [UsageError](docs/UsageError.md)
 - [UsageLinks](docs/UsageLinks.md)
 - [User](docs/User.md)
 - [UserFlagSetting](docs/UserFlagSetting.md)
 - [UserFlagSettings](docs/UserFlagSettings.md)
 - [UserRecord](docs/UserRecord.md)
 - [UserSegment](docs/UserSegment.md)
 - [UserSegmentBody](docs/UserSegmentBody.md)
 - [UserSegmentRule](docs/UserSegmentRule.md)
 - [UserSegments](docs/UserSegments.md)
 - [UserSettingsBody](docs/UserSettingsBody.md)
 - [UserTargetingExpirationForFlag](docs/UserTargetingExpirationForFlag.md)
 - [UserTargetingExpirationForFlags](docs/UserTargetingExpirationForFlags.md)
 - [UserTargetingExpirationForSegment](docs/UserTargetingExpirationForSegment.md)
 - [UserTargetingExpirationOnFlagsForUser](docs/UserTargetingExpirationOnFlagsForUser.md)
 - [UserTargetingExpirationResourceIdForFlag](docs/UserTargetingExpirationResourceIdForFlag.md)
 - [Users](docs/Users.md)
 - [Variation](docs/Variation.md)
 - [Webhook](docs/Webhook.md)
 - [WebhookBody](docs/WebhookBody.md)
 - [Webhooks](docs/Webhooks.md)
 - [WeightedVariation](docs/WeightedVariation.md)


## Documentation For Authorization


## Token

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header

