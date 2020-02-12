# CustomerMetricsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getEvaluations**](CustomerMetricsApi.md#getEvaluations) | **GET** /usage/evaluations/{envId}/{flagKey} | Get events usage by event id and the feature flag key.
[**getEvent**](CustomerMetricsApi.md#getEvent) | **GET** /usage/events/{type} | Get events usage by event type.
[**getEvents**](CustomerMetricsApi.md#getEvents) | **GET** /usage/events | Get events usage endpoints.
[**getMAU**](CustomerMetricsApi.md#getMAU) | **GET** /usage/mau | Get monthly active user data.
[**getMAUByCategory**](CustomerMetricsApi.md#getMAUByCategory) | **GET** /usage/mau/bycategory | Get monthly active user data by category.
[**getStream**](CustomerMetricsApi.md#getStream) | **GET** /usage/streams/{source} | Get a stream endpoint and return timeseries data.
[**getStreamBySDK**](CustomerMetricsApi.md#getStreamBySDK) | **GET** /usage/streams/{source}/bysdkversion | Get a stream timeseries data by source show sdk version metadata.
[**getStreamSDKVersion**](CustomerMetricsApi.md#getStreamSDKVersion) | **GET** /usage/streams/{source}/sdkversions | Get a stream timeseries data by source and show all sdk version associated.
[**getStreams**](CustomerMetricsApi.md#getStreams) | **GET** /usage/streams | Returns a list of all streams.
[**getUsage**](CustomerMetricsApi.md#getUsage) | **GET** /usage | Returns of the usage endpoints available.


## **getEvaluations**

Get events usage by event id and the feature flag key.

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

Get events usage by event type.

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

Get events usage endpoints.

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

Get monthly active user data.

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

Get monthly active user data by category.

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

Get a stream endpoint and return timeseries data.

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

Get a stream timeseries data by source show sdk version metadata.

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

Get a stream timeseries data by source and show all sdk version associated.

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

Returns a list of all streams.

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

Returns of the usage endpoints available.

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

