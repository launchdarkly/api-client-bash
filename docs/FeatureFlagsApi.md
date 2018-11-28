# FeatureFlagsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteFeatureFlag**](FeatureFlagsApi.md#deleteFeatureFlag) | **DELETE** /flags/{projectKey}/{featureFlagKey} | Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
[**getFeatureFlag**](FeatureFlagsApi.md#getFeatureFlag) | **GET** /flags/{projectKey}/{featureFlagKey} | Get a single feature flag by key.
[**getFeatureFlagStatus**](FeatureFlagsApi.md#getFeatureFlagStatus) | **GET** /flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey} | Get the status for a particular feature flag.
[**getFeatureFlagStatuses**](FeatureFlagsApi.md#getFeatureFlagStatuses) | **GET** /flag-statuses/{projectKey}/{environmentKey} | Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
[**getFeatureFlags**](FeatureFlagsApi.md#getFeatureFlags) | **GET** /flags/{projectKey} | Get a list of all features in the given project.
[**patchFeatureFlag**](FeatureFlagsApi.md#patchFeatureFlag) | **PATCH** /flags/{projectKey}/{featureFlagKey} | Perform a partial update to a feature.
[**postFeatureFlag**](FeatureFlagsApi.md#postFeatureFlag) | **POST** /flags/{projectKey} | Creates a new feature flag.


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
 getFeatureFlag projectKey=value featureFlagKey=value  env=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **env** | **string** | By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=production will restrict the returned configurations to just your production environment. | [optional]

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
 getFeatureFlags projectKey=value  env=value  tag=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **env** | **string** | By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=production will restrict the returned configurations to just your production environment. | [optional]
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

