# UserSettingsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUserFlagSetting**](UserSettingsApi.md#getUserFlagSetting) | **GET** /users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Fetch a single flag setting for a user by key.
[**getUserFlagSettings**](UserSettingsApi.md#getUserFlagSettings) | **GET** /users/{projectKey}/{environmentKey}/{userKey}/flags | Fetch a single flag setting for a user by key.
[**putFlagSetting**](UserSettingsApi.md#putFlagSetting) | **PUT** /users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey} | Specifically enable or disable a feature flag for a user based on their key.


## **getUserFlagSetting**

Fetch a single flag setting for a user by key.

### Example
```bash
 getUserFlagSetting projectKey=value environmentKey=value userKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **userKey** | **string** | The user's key. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |

### Return type

[**UserFlagSetting**](UserFlagSetting.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getUserFlagSettings**

Fetch a single flag setting for a user by key.

### Example
```bash
 getUserFlagSettings projectKey=value environmentKey=value userKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **userKey** | **string** | The user's key. |

### Return type

[**UserFlagSettings**](UserFlagSettings.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putFlagSetting**

Specifically enable or disable a feature flag for a user based on their key.

### Example
```bash
 putFlagSetting projectKey=value environmentKey=value userKey=value featureFlagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **userKey** | **string** | The user's key. |
 **featureFlagKey** | **string** | The feature flag's key. The key identifies the flag in your code. |
 **userSettingsBody** | [**UserSettingsBody**](UserSettingsBody.md) |  |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

