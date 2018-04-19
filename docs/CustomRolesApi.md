# CustomRolesApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteCustomRole**](CustomRolesApi.md#deleteCustomRole) | **DELETE** /roles/{customRoleKey} | Delete a custom role by key.
[**getCustomRole**](CustomRolesApi.md#getCustomRole) | **GET** /roles/{customRoleKey} | Get one custom role by key.
[**getCustomRoles**](CustomRolesApi.md#getCustomRoles) | **GET** /roles | Return a complete list of custom roles.
[**patchCustomRole**](CustomRolesApi.md#patchCustomRole) | **PATCH** /roles/{customRoleKey} | Modify a custom role by key.
[**postCustomRole**](CustomRolesApi.md#postCustomRole) | **POST** /roles | Create a new custom role.


## **deleteCustomRole**

Delete a custom role by key.

### Example
```bash
 deleteCustomRole customRoleKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customRoleKey** | **string** | The custom role key. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getCustomRole**

Get one custom role by key.

### Example
```bash
 getCustomRole customRoleKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customRoleKey** | **string** | The custom role key. |

### Return type

[**CustomRole**](CustomRole.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getCustomRoles**

Return a complete list of custom roles.

### Example
```bash
 getCustomRoles
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CustomRoles**](CustomRoles.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchCustomRole**

Modify a custom role by key.

### Example
```bash
 patchCustomRole customRoleKey=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customRoleKey** | **string** | The custom role key. |
 **patchDelta** | [**array[PatchOperation]**](PatchOperation.md) | Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' |

### Return type

[**CustomRole**](CustomRole.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postCustomRole**

Create a new custom role.

### Example
```bash
 postCustomRole
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customRoleBody** | [**CustomRoleBody**](CustomRoleBody.md) | New role or roles to create. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

