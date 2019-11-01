# UsageApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getEvaluations**](UsageApi.md#getEvaluations) | **GET** /usage/evaluations/{envId}/{flagKey} | [BETA] Get events usage by event id and the feature flag key.
[**getEvent**](UsageApi.md#getEvent) | **GET** /usage/events/{type} | [BETA] Get events usage by event type.
[**getEvents**](UsageApi.md#getEvents) | **GET** /usage/events | [BETA] Get events usage endpoints.
[**getMAU**](UsageApi.md#getMAU) | **GET** /usage/mau | [BETA] Get monthly active user data.
[**getMAUByCategory**](UsageApi.md#getMAUByCategory) | **GET** /usage/mau/bycategory | [BETA] Get monthly active user data by category.
[**getStream**](UsageApi.md#getStream) | **GET** /usage/streams/{source} | [BETA] Get a stream endpoint and return timeseries data.
[**getStreamBySDK**](UsageApi.md#getStreamBySDK) | **GET** /usage/streams/{source}/bysdkversion | [BETA] Get a stream timeseries data by source show sdk version metadata.
[**getStreamSDKVersion**](UsageApi.md#getStreamSDKVersion) | **GET** /usage/streams/{source}/sdkversions | [BETA] Get a stream timeseries data by source and show all sdk version associated.
[**getStreams**](UsageApi.md#getStreams) | **GET** /usage/streams | [BETA] Returns a list of all streams.
[**getUsage**](UsageApi.md#getUsage) | **GET** /usage | [BETA] Returns of the usage endpoints available.


## **getEvaluations**

[BETA] Get events usage by event id and the feature flag key.

### Example
```bash
 getEvaluations envId=value flagKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **envId** | **string** | The environment id for the flag evaluations in question. |
 **flagKey** | **string** | The key of the flag we want metrics for. |

### Return type

[**StreamSDKVersion**](StreamSDKVersion.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getEvent**

[BETA] Get events usage by event type.

### Example
```bash
 getEvent type=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **string** | The type of event we would like to track. |

### Return type

[**StreamSDKVersion**](StreamSDKVersion.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getEvents**

[BETA] Get events usage endpoints.

### Example
```bash
 getEvents
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Events**](Events.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getMAU**

[BETA] Get monthly active user data.

### Example
```bash
 getMAU
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MAU**](MAU.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getMAUByCategory**

[BETA] Get monthly active user data by category.

### Example
```bash
 getMAUByCategory
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MAUbyCategory**](MAUbyCategory.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getStream**

[BETA] Get a stream endpoint and return timeseries data.

### Example
```bash
 getStream source=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **source** | **string** | The source of where the stream comes from. |

### Return type

[**Stream**](Stream.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getStreamBySDK**

[BETA] Get a stream timeseries data by source show sdk version metadata.

### Example
```bash
 getStreamBySDK source=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **source** | **string** | The source of where the stream comes from. |

### Return type

[**StreamBySDK**](StreamBySDK.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getStreamSDKVersion**

[BETA] Get a stream timeseries data by source and show all sdk version associated.

### Example
```bash
 getStreamSDKVersion source=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **source** | **string** | The source of where the stream comes from. |

### Return type

[**StreamSDKVersion**](StreamSDKVersion.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getStreams**

[BETA] Returns a list of all streams.

### Example
```bash
 getStreams
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Streams**](Streams.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getUsage**

[BETA] Returns of the usage endpoints available.

### Example
```bash
 getUsage
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Usage**](Usage.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

