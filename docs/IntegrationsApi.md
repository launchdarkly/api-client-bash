# IntegrationsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteIntegrationSubscription**](IntegrationsApi.md#deleteIntegrationSubscription) | **DELETE** /integrations/{integrationKey}/{integrationId} | Delete an integration subscription by ID.
[**getIntegrationSubscription**](IntegrationsApi.md#getIntegrationSubscription) | **GET** /integrations/{integrationKey}/{integrationId} | Get a single integration subscription by ID.
[**getIntegrationSubscriptions**](IntegrationsApi.md#getIntegrationSubscriptions) | **GET** /integrations/{integrationKey} | Get a list of all configured integrations of a given kind.
[**getIntegrations**](IntegrationsApi.md#getIntegrations) | **GET** /integrations | Get a list of all configured audit log event integrations associated with this account.
[**patchIntegrationSubscription**](IntegrationsApi.md#patchIntegrationSubscription) | **PATCH** /integrations/{integrationKey}/{integrationId} | Modify an integration subscription by ID.
[**postIntegrationSubscription**](IntegrationsApi.md#postIntegrationSubscription) | **POST** /integrations/{integrationKey} | Create a new integration subscription of a given kind.


## **deleteIntegrationSubscription**

Delete an integration subscription by ID.

### Example
```bash
 deleteIntegrationSubscription integrationKey=value integrationId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **integrationKey** | **string** | The key used to specify the integration kind. |
 **integrationId** | **string** | The integration ID. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getIntegrationSubscription**

Get a single integration subscription by ID.

### Example
```bash
 getIntegrationSubscription integrationKey=value integrationId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **integrationKey** | **string** | The key used to specify the integration kind. |
 **integrationId** | **string** | The integration ID. |

### Return type

[**IntegrationSubscription**](IntegrationSubscription.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getIntegrationSubscriptions**

Get a list of all configured integrations of a given kind.

### Example
```bash
 getIntegrationSubscriptions integrationKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **integrationKey** | **string** | The key used to specify the integration kind. |

### Return type

[**Integration**](Integration.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getIntegrations**

Get a list of all configured audit log event integrations associated with this account.

### Example
```bash
 getIntegrations
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Integrations**](Integrations.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchIntegrationSubscription**

Modify an integration subscription by ID.

### Example
```bash
 patchIntegrationSubscription integrationKey=value integrationId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **integrationKey** | **string** | The key used to specify the integration kind. |
 **integrationId** | **string** | The integration ID. |
 **patchDelta** | [**array[PatchOperation]**](PatchOperation.md) | Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' |

### Return type

[**IntegrationSubscription**](IntegrationSubscription.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postIntegrationSubscription**

Create a new integration subscription of a given kind.

### Example
```bash
 postIntegrationSubscription integrationKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **integrationKey** | **string** | The key used to specify the integration kind. |
 **subscriptionBody** | [**SubscriptionBody**](SubscriptionBody.md) | Create a new integration subscription. |

### Return type

[**IntegrationSubscription**](IntegrationSubscription.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

