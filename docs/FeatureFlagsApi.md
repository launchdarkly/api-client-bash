# FeatureFlagsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**copyFeatureFlag**](FeatureFlagsApi.md#copyFeatureFlag) | **POST** /flags/{projectKey}/{featureFlagKey}/copy | Copies the feature flag configuration from one environment to the same feature flag in another environment.
[**deleteFeatureFlag**](FeatureFlagsApi.md#deleteFeatureFlag) | **DELETE** /flags/{projectKey}/{featureFlagKey} | Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
[**deleteFeatureFlagApprovalRequest**](FeatureFlagsApi.md#deleteFeatureFlagApprovalRequest) | **DELETE** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{featureFlagApprovalRequestId} | Delete an approval request for a feature flag
[**getExpiringUserTargets**](FeatureFlagsApi.md#getExpiringUserTargets) | **GET** /flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey} | Get expiring user targets for feature flag
[**getFeatureFlag**](FeatureFlagsApi.md#getFeatureFlag) | **GET** /flags/{projectKey}/{featureFlagKey} | Get a single feature flag by key.
[**getFeatureFlagApprovalRequest**](FeatureFlagsApi.md#getFeatureFlagApprovalRequest) | **GET** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{featureFlagApprovalRequestId} | Get a single approval request for a feature flag
[**getFeatureFlagApprovalRequests**](FeatureFlagsApi.md#getFeatureFlagApprovalRequests) | **GET** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests | Get all approval requests for a feature flag
[**getFeatureFlagStatus**](FeatureFlagsApi.md#getFeatureFlagStatus) | **GET** /flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey} | Get the status for a particular feature flag.
[**getFeatureFlagStatusAcrossEnvironments**](FeatureFlagsApi.md#getFeatureFlagStatusAcrossEnvironments) | **GET** /flag-status/{projectKey}/{featureFlagKey} | Get the status for a particular feature flag across environments
[**getFeatureFlagStatuses**](FeatureFlagsApi.md#getFeatureFlagStatuses) | **GET** /flag-statuses/{projectKey}/{environmentKey} | Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
[**getFeatureFlags**](FeatureFlagsApi.md#getFeatureFlags) | **GET** /flags/{projectKey} | Get a list of all features in the given project.
[**patchExpiringUserTargets**](FeatureFlagsApi.md#patchExpiringUserTargets) | **PATCH** /flags/{projectKey}/{featureFlagKey}/expiring-user-targets/{environmentKey} | Update, add, or delete expiring user targets on feature flag
[**patchFeatureFlag**](FeatureFlagsApi.md#patchFeatureFlag) | **PATCH** /flags/{projectKey}/{featureFlagKey} | Perform a partial update to a feature.
[**postApplyFeatureFlagApprovalRequest**](FeatureFlagsApi.md#postApplyFeatureFlagApprovalRequest) | **POST** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{featureFlagApprovalRequestId}/apply | Apply approval request for a feature flag
[**postFeatureFlag**](FeatureFlagsApi.md#postFeatureFlag) | **POST** /flags/{projectKey} | Creates a new feature flag.
[**postFeatureFlagApprovalRequest**](FeatureFlagsApi.md#postFeatureFlagApprovalRequest) | **POST** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{featureFlagApprovalRequestId} | Create an approval request for a feature flag
[**postReviewFeatureFlagApprovalRequest**](FeatureFlagsApi.md#postReviewFeatureFlagApprovalRequest) | **POST** /projects/{projectKey}/flags/{featureFlagKey}/environments/{environmentKey}/approval-requests/{featureFlagApprovalRequestId}/review | Review approval request for a feature flag


## **copyFeatureFlag**

Copies the feature flag configuration from one environment to the same feature flag in another environment.

### Example
```bash
 copyFeatureFlag projectKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **featureFlagCopyBody** | [**FeatureFlagCopyBody**](FeatureFlagCopyBody.md) | Copy feature flag configurations between environments. |

### Return type

[**FeatureFlag**](FeatureFlag.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **deleteFeatureFlag**

Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.

### Example
```bash
 deleteFeatureFlag projectKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **deleteFeatureFlagApprovalRequest**

Delete an approval request for a feature flag

### Example
```bash
 deleteFeatureFlagApprovalRequest projectKey=value environmentKey=value featureFlagKey=value featureFlagApprovalRequestId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **featureFlagApprovalRequestId** | **string** | The feature flag approval request ID |
 **featureFlagApprovalRequestConfigBody** | [**FeatureFlagApprovalRequestConfigBody**](FeatureFlagApprovalRequestConfigBody.md) | Create a new feature flag approval request | [optional]

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getExpiringUserTargets**

Get expiring user targets for feature flag

### Example
```bash
 getExpiringUserTargets projectKey=value environmentKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |

### Return type

[**UserTargetingExpirationForFlags**](UserTargetingExpirationForFlags.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getFeatureFlag**

Get a single feature flag by key.

### Example
```bash
 getFeatureFlag projectKey=value featureFlagKey=value  Specify as:  env=value1 env=value2 env=...
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **env** | [**array[string]**](string.md) | By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=[\"production\"] will restrict the returned configurations to just your production environment. | [optional]

### Return type

[**FeatureFlag**](FeatureFlag.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getFeatureFlagApprovalRequest**

Get a single approval request for a feature flag

### Example
```bash
 getFeatureFlagApprovalRequest projectKey=value featureFlagKey=value environmentKey=value featureFlagApprovalRequestId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **featureFlagApprovalRequestId** | **string** | The feature flag approval request ID |

### Return type

[**FeatureFlagApprovalRequests**](FeatureFlagApprovalRequests.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getFeatureFlagApprovalRequests**

Get all approval requests for a feature flag

### Example
```bash
 getFeatureFlagApprovalRequests projectKey=value featureFlagKey=value environmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |

### Return type

[**FeatureFlagApprovalRequests**](FeatureFlagApprovalRequests.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getFeatureFlagStatus**

Get the status for a particular feature flag.

### Example
```bash
 getFeatureFlagStatus projectKey=value environmentKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |

### Return type

[**FeatureFlagStatus**](FeatureFlagStatus.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getFeatureFlagStatusAcrossEnvironments**

Get the status for a particular feature flag across environments

### Example
```bash
 getFeatureFlagStatusAcrossEnvironments projectKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |

### Return type

[**FeatureFlagStatusAcrossEnvironments**](FeatureFlagStatusAcrossEnvironments.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getFeatureFlagStatuses**

Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.

### Example
```bash
 getFeatureFlagStatuses projectKey=value environmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |

### Return type

[**FeatureFlagStatuses**](FeatureFlagStatuses.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getFeatureFlags**

Get a list of all features in the given project.

### Example
```bash
 getFeatureFlags projectKey=value  Specify as:  env=value1 env=value2 env=...  summary=value  archived=value  limit=value  offset=value  filter=value  sort=value  tag=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **env** | [**array[string]**](string.md) | By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=[\"production\"] will restrict the returned configurations to just your production environment. | [optional]
 **summary** | **boolean** | By default in api version >= 1, flags will _not_ include their list of prerequisites, targets or rules.  Set summary=0 to include these fields for each flag returned. | [optional]
 **archived** | **boolean** | When set to 1, only archived flags will be included in the list of flags returned.  By default, archived flags are not included in the list of flags. | [optional]
 **limit** | **integer** | The number of objects to return. Defaults to -1, which returns everything. | [optional]
 **offset** | **integer** | Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items. | [optional]
 **filter** | **string** | A comma-separated list of filters. Each filter is of the form field:value. | [optional]
 **sort** | **string** | A comma-separated list of fields to sort by. A field prefixed by a - will be sorted in descending order. | [optional]
 **tag** | **string** | Filter by tag. A tag can be used to group flags across projects. | [optional]

### Return type

[**FeatureFlags**](FeatureFlags.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchExpiringUserTargets**

Update, add, or delete expiring user targets on feature flag

### Example
```bash
 patchExpiringUserTargets projectKey=value environmentKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **semanticPatchWithComment** | **map** | Requires a Semantic Patch representation of the desired changes to the resource. 'https://apidocs.launchdarkly.com/reference#updates-via-semantic-patches'. The addition of comments is also supported. |

### Return type

[**UserTargetingExpirationForFlags**](UserTargetingExpirationForFlags.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchFeatureFlag**

Perform a partial update to a feature.

### Example
```bash
 patchFeatureFlag projectKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **patchComment** | [**PatchComment**](PatchComment.md) | Requires a JSON Patch representation of the desired changes to the project, and an optional comment. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported. |

### Return type

[**FeatureFlag**](FeatureFlag.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApplyFeatureFlagApprovalRequest**

Apply approval request for a feature flag

### Example
```bash
 postApplyFeatureFlagApprovalRequest projectKey=value featureFlagKey=value environmentKey=value featureFlagApprovalRequestId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **featureFlagApprovalRequestId** | **string** | The feature flag approval request ID |
 **featureFlagApprovalRequestApplyConfigBody** | [**FeatureFlagApprovalRequestApplyConfigBody**](FeatureFlagApprovalRequestApplyConfigBody.md) | Apply a new feature flag approval request |

### Return type

[**FeatureFlagApprovalRequests**](FeatureFlagApprovalRequests.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postFeatureFlag**

Creates a new feature flag.

### Example
```bash
 postFeatureFlag projectKey=value  clone=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagBody** | [**FeatureFlagBody**](FeatureFlagBody.md) | Create a new feature flag. |
 **clone** | **string** | The key of the feature flag to be cloned. The key identifies the flag in your code.  For example, setting clone=flagKey will copy the full targeting configuration for all environments (including on/off state) from the original flag to the new flag. | [optional]

### Return type

[**FeatureFlag**](FeatureFlag.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postFeatureFlagApprovalRequest**

Create an approval request for a feature flag

### Example
```bash
 postFeatureFlagApprovalRequest projectKey=value featureFlagKey=value environmentKey=value featureFlagApprovalRequestId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **featureFlagApprovalRequestId** | **string** | The feature flag approval request ID |
 **featureFlagApprovalRequestConfigBody** | [**FeatureFlagApprovalRequestConfigBody**](FeatureFlagApprovalRequestConfigBody.md) | Create a new feature flag approval request | [optional]

### Return type

[**FeatureFlagApprovalRequest**](FeatureFlagApprovalRequest.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postReviewFeatureFlagApprovalRequest**

Review approval request for a feature flag

### Example
```bash
 postReviewFeatureFlagApprovalRequest projectKey=value featureFlagKey=value environmentKey=value featureFlagApprovalRequestId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **featureFlagApprovalRequestId** | **string** | The feature flag approval request ID |
 **featureFlagApprovalRequestReviewConfigBody** | [**FeatureFlagApprovalRequestReviewConfigBody**](FeatureFlagApprovalRequestReviewConfigBody.md) | Review a feature flag approval request |

### Return type

[**FeatureFlagApprovalRequests**](FeatureFlagApprovalRequests.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

