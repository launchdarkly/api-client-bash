# EnvironmentsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteEnvironment**](EnvironmentsApi.md#deleteEnvironment) | **DELETE** /projects/{projectKey}/environments/{environmentKey} | Delete an environment in a specific project.
[**getEnvironment**](EnvironmentsApi.md#getEnvironment) | **GET** /projects/{projectKey}/environments/{environmentKey} | Get an environment given a project and key.
[**patchEnvironment**](EnvironmentsApi.md#patchEnvironment) | **PATCH** /projects/{projectKey}/environments/{environmentKey} | Modify an environment by ID. If you try to patch the environment by setting both required and requiredApprovalTags, it will result in an error. Users can specify either required approvals for all flags in an environment or those with specific tags, but not both. Only customers on an Enterprise plan can require approval for flag updates with either mechanism.
[**postEnvironment**](EnvironmentsApi.md#postEnvironment) | **POST** /projects/{projectKey}/environments | Create a new environment in a specified project with a given name, key, and swatch color.
[**resetEnvironmentMobileKey**](EnvironmentsApi.md#resetEnvironmentMobileKey) | **POST** /projects/{projectKey}/environments/{environmentKey}/mobileKey | Reset an environment&#39;s mobile key. The optional expiry for the old key is deprecated for this endpoint, so the old key will always expire immediately.
[**resetEnvironmentSDKKey**](EnvironmentsApi.md#resetEnvironmentSDKKey) | **POST** /projects/{projectKey}/environments/{environmentKey}/apiKey | Reset an environment&#39;s SDK key with an optional expiry time for the old key.


## **deleteEnvironment**

Delete an environment in a specific project.

### Example
```bash
 deleteEnvironment projectKey=value environmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getEnvironment**

Get an environment given a project and key.

### Example
```bash
 getEnvironment projectKey=value environmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |

### Return type

[**Environment**](Environment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchEnvironment**

Modify an environment by ID. If you try to patch the environment by setting both required and requiredApprovalTags, it will result in an error. Users can specify either required approvals for all flags in an environment or those with specific tags, but not both. Only customers on an Enterprise plan can require approval for flag updates with either mechanism.

### Example
```bash
 patchEnvironment projectKey=value environmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **patchDelta** | [**array[PatchOperation]**](PatchOperation.md) | Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' |

### Return type

[**Environment**](Environment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postEnvironment**

Create a new environment in a specified project with a given name, key, and swatch color.

### Example
```bash
 postEnvironment projectKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentBody** | [**EnvironmentPost**](EnvironmentPost.md) | New environment. |

### Return type

[**Environment**](Environment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **resetEnvironmentMobileKey**

Reset an environment's mobile key. The optional expiry for the old key is deprecated for this endpoint, so the old key will always expire immediately.

### Example
```bash
 resetEnvironmentMobileKey projectKey=value environmentKey=value  expiry=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **expiry** | **integer** | The expiry parameter is deprecated for this endpoint, so the old mobile key will always expire immediately. This parameter will be removed in an upcoming major API client version. | [optional]

### Return type

[**Environment**](Environment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **resetEnvironmentSDKKey**

Reset an environment's SDK key with an optional expiry time for the old key.

### Example
```bash
 resetEnvironmentSDKKey projectKey=value environmentKey=value  expiry=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **expiry** | **integer** | An expiration time for the old environment SDK key, expressed as a Unix epoch time in milliseconds. By default, the key will expire immediately. | [optional]

### Return type

[**Environment**](Environment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

