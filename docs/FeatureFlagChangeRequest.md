# FeatureFlagChangeRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_id** | [**Id**](Id.md) |  | [optional] [default to null]
**_version** | **integer** |  | [optional] [default to null]
**creationDate** | **integer** |  | [optional] [default to null]
**requestorId** | **string** |  | [optional] [default to null]
**reviewStatus** | [**FeatureFlagChangeRequestReviewStatus**](FeatureFlagChangeRequestReviewStatus.md) |  | [optional] [default to null]
**status** | **string** |  | [optional] [default to null]
**appliedByMemberID** | **string** |  | [optional] [default to null]
**appliedDate** | **integer** |  | [optional] [default to null]
**currentReviewsByMemberId** | [**FeatureFlagChangeRequestReview**](FeatureFlagChangeRequestReview.md) |  | [optional] [default to null]
**allReviews** | [**array[FeatureFlagChangeRequestReview]**](FeatureFlagChangeRequestReview.md) |  | [optional] [default to null]
**notifyMemberIds** | **array[string]** |  | [optional] [default to null]
**instructions** | [**SemanticPatchInstruction**](SemanticPatchInstruction.md) |  | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


