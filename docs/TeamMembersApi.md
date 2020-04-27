# TeamMembersApi

All URIs are relative to */api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteMember**](TeamMembersApi.md#deleteMember) | **DELETE** /members/{memberId} | Delete a team member by ID.
[**getMe**](TeamMembersApi.md#getMe) | **GET** /members/me | Get the current team member associated with the token
[**getMember**](TeamMembersApi.md#getMember) | **GET** /members/{memberId} | Get a single team member by ID.
[**getMembers**](TeamMembersApi.md#getMembers) | **GET** /members | Returns a list of all members in the account.
[**patchMember**](TeamMembersApi.md#patchMember) | **PATCH** /members/{memberId} | Modify a team member by ID.
[**postMembers**](TeamMembersApi.md#postMembers) | **POST** /members | Invite new members.


## **deleteMember**

Delete a team member by ID.

### Example
```bash
 deleteMember memberId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **memberId** | **string** | The member ID. |

### Return type

(empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getMe**

Get the current team member associated with the token

### Example
```bash
 getMe
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Member**](Member.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getMember**

Get a single team member by ID.

### Example
```bash
 getMember memberId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **memberId** | **string** | The member ID. |

### Return type

[**Member**](Member.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getMembers**

Returns a list of all members in the account.

### Example
```bash
 getMembers  limit=value  number=value  filter=value  sort=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The number of objects to return. Defaults to -1, which returns everything. | [optional]
 **number** | **boolean** | Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items. | [optional]
 **filter** | **string** | A comma-separated list of filters. Each filter is of the form field:value. | [optional]
 **sort** | **string** | A comma-separated list of fields to sort by. A field prefixed by a - will be sorted in descending order. | [optional]

### Return type

[**Members**](Members.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **patchMember**

Modify a team member by ID.

### Example
```bash
 patchMember memberId=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **memberId** | **string** | The member ID. |
 **patchDelta** | [**array[PatchOperation]**](PatchOperation.md) | Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' |

### Return type

[**Member**](Member.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postMembers**

Invite new members.

### Example
```bash
 postMembers
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **membersBody** | [**array[MembersBody]**](MembersBody.md) | New members to invite. |

### Return type

[**Members**](Members.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

