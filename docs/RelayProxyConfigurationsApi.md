# RelayProxyConfigurationsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteRelayProxyConfig**](RelayProxyConfigurationsApi.md#deleteRelayProxyConfig) | **DELETE** /account/relay-auto-configs/{id} | Delete a relay proxy configuration by ID.
[**getRelayProxyConfig**](RelayProxyConfigurationsApi.md#getRelayProxyConfig) | **GET** /account/relay-auto-configs/{id} | Get a single relay proxy configuration by ID.
[**getRelayProxyConfigs**](RelayProxyConfigurationsApi.md#getRelayProxyConfigs) | **GET** /account/relay-auto-configs | Returns a list of relay proxy configurations in the account.
[**patchRelayProxyConfig**](RelayProxyConfigurationsApi.md#patchRelayProxyConfig) | **PATCH** /account/relay-auto-configs/{id} | Modify a relay proxy configuration by ID.
[**postRelayAutoConfig**](RelayProxyConfigurationsApi.md#postRelayAutoConfig) | **POST** /account/relay-auto-configs | Create a new relay proxy config.
[**resetRelayProxyConfig**](RelayProxyConfigurationsApi.md#resetRelayProxyConfig) | **POST** /account/relay-auto-configs/{id}/reset | Reset a relay proxy configuration&#39;s secret key with an optional expiry time for the old key.


## **deleteRelayProxyConfig**

Delete a relay proxy configuration by ID.

### Example
```bash
 deleteRelayProxyConfig id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The relay proxy configuration ID |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getRelayProxyConfig**

Get a single relay proxy configuration by ID.

### Example
```bash
 getRelayProxyConfig id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The relay proxy configuration ID |

### Return type

[**RelayProxyConfig**](RelayProxyConfig.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getRelayProxyConfigs**

Returns a list of relay proxy configurations in the account.

### Example
```bash
 getRelayProxyConfigs
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**RelayProxyConfigs**](RelayProxyConfigs.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchRelayProxyConfig**

Modify a relay proxy configuration by ID.

### Example
```bash
 patchRelayProxyConfig id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The relay proxy configuration ID |
 **patchDelta** | [**array[PatchOperation]**](PatchOperation.md) | Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' |

### Return type

[**RelayProxyConfig**](RelayProxyConfig.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postRelayAutoConfig**

Create a new relay proxy config.

### Example
```bash
 postRelayAutoConfig
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **relayProxyConfigBody** | [**RelayProxyConfigBody**](RelayProxyConfigBody.md) | Create a new relay proxy configuration |

### Return type

[**RelayProxyConfig**](RelayProxyConfig.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **resetRelayProxyConfig**

Reset a relay proxy configuration's secret key with an optional expiry time for the old key.

### Example
```bash
 resetRelayProxyConfig id=value  expiry=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The relay proxy configuration ID |
 **expiry** | **integer** | An expiration time for the old relay proxy configuration key, expressed as a Unix epoch time in milliseconds. By default, the relay proxy configuration will expire immediately | [optional]

### Return type

[**RelayProxyConfig**](RelayProxyConfig.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

