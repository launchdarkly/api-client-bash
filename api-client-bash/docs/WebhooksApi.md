# WebhooksApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteWebhook**](WebhooksApi.md#deleteWebhook) | **DELETE** /webhooks/{resourceId} | Delete a webhook by ID.
[**getWebhook**](WebhooksApi.md#getWebhook) | **GET** /webhooks/{resourceId} | Get a webhook by ID.
[**getWebhooks**](WebhooksApi.md#getWebhooks) | **GET** /webhooks | Fetch a list of all webhooks.
[**patchWebhook**](WebhooksApi.md#patchWebhook) | **PATCH** /webhooks/{resourceId} | Modify a webhook by ID.
[**postWebhook**](WebhooksApi.md#postWebhook) | **POST** /webhooks | Create a webhook.


## **deleteWebhook**

Delete a webhook by ID.

### Example
```bash
 deleteWebhook resourceId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resourceId** | **string** | The resource ID. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getWebhook**

Get a webhook by ID.

### Example
```bash
 getWebhook resourceId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resourceId** | **string** | The resource ID. |

### Return type

[**Webhook**](Webhook.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getWebhooks**

Fetch a list of all webhooks.

### Example
```bash
 getWebhooks
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Webhooks**](Webhooks.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchWebhook**

Modify a webhook by ID.

### Example
```bash
 patchWebhook resourceId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resourceId** | **string** | The resource ID. |
 **patchDelta** | [**array[PatchOperation]**](PatchOperation.md) | Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' |

### Return type

[**Webhook**](Webhook.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postWebhook**

Create a webhook.

### Example
```bash
 postWebhook
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhookBody** | [**WebhookBody**](WebhookBody.md) | New webhook. |

### Return type

[**Webhook**](Webhook.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

