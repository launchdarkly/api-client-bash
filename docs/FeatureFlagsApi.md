# FeatureFlagsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**copyFeatureFlag**](FeatureFlagsApi.md#copyFeatureFlag) | **POST** /flags/{projectKey}/{featureFlagKey}/copy | Copies the feature flag configuration from one environment to the same feature flag in another environment.
[**deleteFeatureFlag**](FeatureFlagsApi.md#deleteFeatureFlag) | **DELETE** /flags/{projectKey}/{featureFlagKey} | Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
[**getFeatureFlag**](FeatureFlagsApi.md#getFeatureFlag) | **GET** /flags/{projectKey}/{featureFlagKey} | Get a single feature flag by key.
[**getFeatureFlagStatus**](FeatureFlagsApi.md#getFeatureFlagStatus) | **GET** /flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey} | Get the status for a particular feature flag.
[**getFeatureFlagStatusAcrossEnvironments**](FeatureFlagsApi.md#getFeatureFlagStatusAcrossEnvironments) | **GET** /flag-status/{projectKey}/{featureFlagKey} | Get the status for a particular feature flag across environments
[**getFeatureFlagStatuses**](FeatureFlagsApi.md#getFeatureFlagStatuses) | **GET** /flag-statuses/{projectKey}/{environmentKey} | Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
[**getFeatureFlags**](FeatureFlagsApi.md#getFeatureFlags) | **GET** /flags/{projectKey} | Get a list of all features in the given project.
[**patchFeatureFlag**](FeatureFlagsApi.md#patchFeatureFlag) | **PATCH** /flags/{projectKey}/{featureFlagKey} | Perform a partial update to a feature.
[**postFeatureFlag**](FeatureFlagsApi.md#postFeatureFlag) | **POST** /flags/{projectKey} | Creates a new feature flag.


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
 getFeatureFlags projectKey=value  Specify as:  env=value1 env=value2 env=...  summary=value  archived=value  limit=value  number=value  filter=value  sort=value  tag=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **env** | [**array[string]**](string.md) | By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=[\"production\"] will restrict the returned configurations to just your production environment. | [optional]
 **summary** | **boolean** | By default in api version >= 1, flags will _not_ include their list of prerequisites, targets or rules.  Set summary=0 to include these fields for each flag returned. | [optional]
 **archived** | **boolean** | When set to 1, archived flags will be included in the list of flags returned.  By default, archived flags are not included in the list of flags. | [optional]
 **limit** | **integer** | The number of objects to return. Defaults to -1, which returns everything. | [optional]
 **number** | **boolean** | Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items. | [optional]
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

