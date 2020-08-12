# AccessTokensApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteToken**](AccessTokensApi.md#deleteToken) | **DELETE** /tokens/{tokenId} | Delete an access token by ID.
[**getToken**](AccessTokensApi.md#getToken) | **GET** /tokens/{tokenId} | Get a single access token by ID.
[**getTokens**](AccessTokensApi.md#getTokens) | **GET** /tokens | Returns a list of tokens in the account.
[**patchToken**](AccessTokensApi.md#patchToken) | **PATCH** /tokens/{tokenId} | Modify an access tokenby ID.
[**postToken**](AccessTokensApi.md#postToken) | **POST** /tokens | Create a new token.
[**resetToken**](AccessTokensApi.md#resetToken) | **POST** /tokens/{tokenId}/reset | Reset an access token&#39;s secret key with an optional expiry time for the old key.


## **deleteToken**

Delete an access token by ID.

### Example
```bash
 deleteToken tokenId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenId** | **string** | The access token ID. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getToken**

Get a single access token by ID.

### Example
```bash
 getToken tokenId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenId** | **string** | The access token ID. |

### Return type

[**Token**](Token.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getTokens**

Returns a list of tokens in the account.

### Example
```bash
 getTokens  showAll=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **showAll** | **boolean** | If set to true, and the authentication access token has the \"Admin\" role, personal access tokens for all members will be retrieved. | [optional]

### Return type

[**Tokens**](Tokens.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchToken**

Modify an access tokenby ID.

### Example
```bash
 patchToken tokenId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenId** | **string** | The access token ID. |
 **patchDelta** | [**array[PatchOperation]**](PatchOperation.md) | Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' |

### Return type

[**Token**](Token.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postToken**

Create a new token.

### Example
```bash
 postToken
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenBody** | [**TokenBody**](TokenBody.md) | Create a new access token. |

### Return type

[**Token**](Token.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **resetToken**

Reset an access token's secret key with an optional expiry time for the old key.

### Example
```bash
 resetToken tokenId=value  expiry=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenId** | **string** | The access token ID. |
 **expiry** | **integer** | An expiration time for the old token key, expressed as a Unix epoch time in milliseconds. By default, the token will expire immediately. | [optional]

### Return type

[**Token**](Token.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

