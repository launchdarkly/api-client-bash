# AuditLogApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAuditLogEntries**](AuditLogApi.md#getAuditLogEntries) | **GET** /auditlog | Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.
[**getAuditLogEntry**](AuditLogApi.md#getAuditLogEntry) | **GET** /auditlog/{resourceId} | Use this endpoint to fetch a single audit log entry by its resouce ID.


## **getAuditLogEntries**

Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.

### Example
```bash
 getAuditLogEntries  before=value  after=value  q=value  limit=value  spec=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **before** | **integer** | A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have before this timestamp. | [optional]
 **after** | **integer** | A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occured after this timestamp. | [optional]
 **q** | **string** | Text to search for. You can search for the full or partial name of the resource involved or fullpartial email address of the member who made the change. | [optional]
 **limit** | **integer** | A limit on the number of audit log entries to be returned, between 1 and 20. | [optional]
 **spec** | **string** | A resource specifier, allowing you to filter audit log listings by resource. | [optional]

### Return type

[**AuditLogEntries**](AuditLogEntries.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getAuditLogEntry**

Use this endpoint to fetch a single audit log entry by its resouce ID.

### Example
```bash
 getAuditLogEntry resourceId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resourceId** | **string** | The resource ID. |

### Return type

[**AuditLogEntry**](AuditLogEntry.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

