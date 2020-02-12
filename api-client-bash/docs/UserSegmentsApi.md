# UserSegmentsApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteUserSegment**](UserSegmentsApi.md#deleteUserSegment) | **DELETE** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Delete a user segment.
[**getUserSegment**](UserSegmentsApi.md#getUserSegment) | **GET** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Get a single user segment by key.
[**getUserSegments**](UserSegmentsApi.md#getUserSegments) | **GET** /segments/{projectKey}/{environmentKey} | Get a list of all user segments in the given project.
[**patchUserSegment**](UserSegmentsApi.md#patchUserSegment) | **PATCH** /segments/{projectKey}/{environmentKey}/{userSegmentKey} | Perform a partial update to a user segment.
[**postUserSegment**](UserSegmentsApi.md#postUserSegment) | **POST** /segments/{projectKey}/{environmentKey} | Creates a new user segment.


## **deleteUserSegment**

Delete a user segment.

### Example
```bash
 deleteUserSegment projectKey=value environmentKey=value userSegmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **userSegmentKey** | **string** | The user segment's key. The key identifies the user segment in your code. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getUserSegment**

Get a single user segment by key.

### Example
```bash
 getUserSegment projectKey=value environmentKey=value userSegmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **userSegmentKey** | **string** | The user segment's key. The key identifies the user segment in your code. |

### Return type

[**UserSegment**](UserSegment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getUserSegments**

Get a list of all user segments in the given project.

### Example
```bash
 getUserSegments projectKey=value environmentKey=value  tag=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **tag** | **string** | Filter by tag. A tag can be used to group flags across projects. | [optional]

### Return type

[**UserSegments**](UserSegments.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchUserSegment**

Perform a partial update to a user segment.

### Example
```bash
 patchUserSegment projectKey=value environmentKey=value userSegmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **userSegmentKey** | **string** | The user segment's key. The key identifies the user segment in your code. |
 **patchOnly** | [**array[PatchOperation]**](PatchOperation.md) | Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported. |

### Return type

[**UserSegment**](UserSegment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postUserSegment**

Creates a new user segment.

### Example
```bash
 postUserSegment projectKey=value environmentKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectKey** | **string** | The project key, used to tie the flags together under one project so they can be managed together. |
 **environmentKey** | **string** | The environment key, used to tie together flag configuration and users under one environment so they can be managed together. |
 **userSegmentBody** | [**UserSegmentBody**](UserSegmentBody.md) | Create a new user segment. |

### Return type

[**UserSegment**](UserSegment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

