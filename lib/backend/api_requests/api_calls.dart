import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start BaseAPI Group Code

class BaseAPIGroup {
  static String getBaseUrl() => 'https://app--sos-elec.base44.app/api';
  static Map<String, String> headers = {
    'api_key': '9f03777387a345798617eee31d2d3916',
  };
  static GetServiceRequestsCall getServiceRequestsCall =
      GetServiceRequestsCall();
  static CreateServiceRequestCall createServiceRequestCall =
      CreateServiceRequestCall();
  static GetElectriciansCall getElectriciansCall = GetElectriciansCall();
  static UpdateServiceRequestCall updateServiceRequestCall =
      UpdateServiceRequestCall();
  static GetCurrentUserCall getCurrentUserCall = GetCurrentUserCall();
  static PostElectriciansCall postElectriciansCall = PostElectriciansCall();
  static UpdateElectriciansCall updateElectriciansCall =
      UpdateElectriciansCall();
  static DeleteElectriciansCall deleteElectriciansCall =
      DeleteElectriciansCall();
}

class GetServiceRequestsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BaseAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetServiceRequests',
      apiUrl:
          '${baseUrl}/apps/691eb6a567ee57de78af06a7/entities/ServiceRequest',
      callType: ApiCallType.GET,
      headers: {
        'api_key': '9f03777387a345798617eee31d2d3916',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateServiceRequestCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BaseAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{  "customer_name": "Test Client",
  "customer_email": "test@example.com",
  "customer_phone": "0612345678",
  "problem_description": "Test problème",
  "location_address": "Paris, France",
  "urgency_level": "medium"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateServiceRequest',
      apiUrl:
          '${baseUrl}/apps/691eb6a567ee57de78af06a7/entities/ServiceRequest',
      callType: ApiCallType.POST,
      headers: {
        'api_key': '9f03777387a345798617eee31d2d3916',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetElectriciansCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BaseAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetElectricians',
      apiUrl: '${baseUrl}/apps/691eb6a567ee57de78af06a7/entities/Electrician',
      callType: ApiCallType.GET,
      headers: {
        'api_key': '9f03777387a345798617eee31d2d3916',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateServiceRequestCall {
  Future<ApiCallResponse> call({
    List<int>? idVariableRequiredList,
  }) async {
    final baseUrl = BaseAPIGroup.getBaseUrl();
    final idVariableRequired = _serializeList(idVariableRequiredList);

    final ffApiRequestBody = '''
{
  "status": "assigned",
  "assigned_electrician_id": "..."
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateServiceRequest',
      apiUrl:
          '${baseUrl}/apps/691eb6a567ee57de78af06a7/entities/ServiceRequest/6988c4833a1a47f71468d332',
      callType: ApiCallType.PUT,
      headers: {
        'api_key': '9f03777387a345798617eee31d2d3916',
        'api_key': '9f03777387a345798617eee31d2d3916',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCurrentUserCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BaseAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetCurrentUser',
      apiUrl: '${baseUrl}/auth/me',
      callType: ApiCallType.GET,
      headers: {
        'api_key': '9f03777387a345798617eee31d2d3916',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostElectriciansCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BaseAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "full_name": "Jean Dupont",
  "email": "jean@example.com",
  "phone": "+33612345678"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostElectricians',
      apiUrl: '${baseUrl}/apps/691eb6a567ee57de78af06a7/entities/Electrician',
      callType: ApiCallType.POST,
      headers: {
        'api_key': '9f03777387a345798617eee31d2d3916',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateElectriciansCall {
  Future<ApiCallResponse> call({
    List<int>? idVariableRequiredList,
  }) async {
    final baseUrl = BaseAPIGroup.getBaseUrl();
    final idVariableRequired = _serializeList(idVariableRequiredList);

    return ApiManager.instance.makeApiCall(
      callName: 'UpdateElectricians',
      apiUrl:
          '${baseUrl}/apps/691eb6a567ee57de78af06a7/entities/Electrician/6988d181d862e4de7cb1a2cd',
      callType: ApiCallType.PUT,
      headers: {
        'api_key': '9f03777387a345798617eee31d2d3916',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteElectriciansCall {
  Future<ApiCallResponse> call({
    String? id = '6988d0fa8849bdd5c4861319',
  }) async {
    final baseUrl = BaseAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "is_active": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteElectricians',
      apiUrl: '${baseUrl}/entities/Electrician/6988d0fa8849bdd5c4861319',
      callType: ApiCallType.PUT,
      headers: {
        'api_key': '9f03777387a345798617eee31d2d3916',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BaseAPI Group Code

/// Start Supabase Group Code

class SupabaseGroup {
  static String getBaseUrl() => 'https://tgsxiukxvxdelowstxqp.supabase.co';
  static Map<String, String> headers = {};
  static ServiceRequestCall serviceRequestCall = ServiceRequestCall();
  static ServiceRequestPostCall serviceRequestPostCall =
      ServiceRequestPostCall();
  static FiltrerParStatutCall filtrerParStatutCall = FiltrerParStatutCall();
  static ServiceRequestPatchCall serviceRequestPatchCall =
      ServiceRequestPatchCall();
  static CalculatejobfinancialsCall calculatejobfinancialsCall =
      CalculatejobfinancialsCall();
  static ElectriciansCall electriciansCall = ElectriciansCall();
  static ElectriciansPostCall electriciansPostCall = ElectriciansPostCall();
  static ElectriciansPatchCall electriciansPatchCall = ElectriciansPatchCall();
  static SubscriptionsCall subscriptionsCall = SubscriptionsCall();
  static SubscriptionCall subscriptionCall = SubscriptionCall();
  static AIEdgeFunctionCall aIEdgeFunctionCall = AIEdgeFunctionCall();
  static RestApiCall restApiCall = RestApiCall();
  static CalculatepriceCall calculatepriceCall = CalculatepriceCall();
  static GetguestrequestCall getguestrequestCall = GetguestrequestCall();
  static AiChatVTwoCall aiChatVTwoCall = AiChatVTwoCall();
  static CreateGuestRequestCall createGuestRequestCall =
      CreateGuestRequestCall();
  static GetMyAccountTypeCall getMyAccountTypeCall = GetMyAccountTypeCall();
}

class ServiceRequestCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Service Request',
      apiUrl: '${baseUrl}/rest/v1/service_requests',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ServiceRequestPostCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_name": "Test Client",
  "customer_email": "test@example.com",
  "customer_phone": "0612345678",
  "problem_description": "Test depuis API",
  "status": "pending",
  "location_address": "Paris"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Service request post',
      apiUrl: '${baseUrl}/rest/v1/service_requests',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FiltrerParStatutCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Filtrer par statut',
      apiUrl: '${baseUrl}/rest/v1/service_requests?status=eq.pending',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ServiceRequestPatchCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Service request patch',
      apiUrl: '${baseUrl}/rest/v1/service_requests',
      callType: ApiCallType.PATCH,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CalculatejobfinancialsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_service_request_id": "247d087f-1675-4240-9e83-054cb0fb76e4"
}''';
    return ApiManager.instance.makeApiCall(
      callName: ' calculatejobfinancials',
      apiUrl: '${baseUrl}/rest/v1/rpc/calculate_job_financials',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ElectriciansCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Electricians',
      apiUrl: '${baseUrl}/rest/v1/electricians',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ElectriciansPostCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "full_name": "Jean Dupont",
  "email": "jean@example.com",
  "phone": "0612345678",
  "license_number": "ABC123",
  "status": "offline"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Electricians post',
      apiUrl: '${baseUrl}/rest/v1/electricians',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ElectriciansPatchCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Electricians patch',
      apiUrl: '${baseUrl}/rest/v1/electricians',
      callType: ApiCallType.PATCH,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Subscriptions',
      apiUrl: '${baseUrl}/rest/v1/subscription_offers',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "PRO",
  "zone": "A",
  "included_interventions": 5,
  "priority_level": "high",
  "sla_target_minutes": 60,
  "max_labor_hours_per_intervention": 2.5,
  "description": "Offre PRO pour agences actives",
  "target_customers": "Agences actives",
  "is_active": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Subscription',
      apiUrl: '${baseUrl}/rest/v1/subscription_offers2',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AIEdgeFunctionCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? conversationId = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "${escapeStringForJson(message)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AI Edge function',
      apiUrl: '${baseUrl}/functions/v1/ai_chat',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? reply(dynamic response) => getJsonField(
        response,
        r'''$.reply''',
      );
}

class RestApiCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "{{TextField.text}}" 
} ''';
    return ApiManager.instance.makeApiCall(
      callName: 'REST API ',
      apiUrl: '${baseUrl}/functions/v1/ai_chat',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CalculatepriceCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "duration_minutes": 60,
  "zone": "A",
  "is_night": false,
  "is_weekend": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'calculateprice',
      apiUrl: '${baseUrl}/functions/v1/calculate-price',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer sb_publishable_meeviSwYZPm1EKoCLuo4lA_C10eikn-',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetguestrequestCall {
  Future<ApiCallResponse> call({
    String? guestAccessToken = '9b0bd4ef-89bf-46ba-a849-3496d4b3fc05',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "guest_access_token": ${guestAccessToken == null ? 'null' : '"${escapeStringForJson(guestAccessToken)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getguestrequest',
      apiUrl: '${baseUrl}/functions/v1/get_guest_request',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AiChatVTwoCall {
  Future<ApiCallResponse> call({
    String? message = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "message": "${escapeStringForJson(message)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ai chat v two',
      apiUrl: '${baseUrl}/functions/v1/rapid-service',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reply''',
      ));
}

class CreateGuestRequestCall {
  Future<ApiCallResponse> call({
    String? customerName = '',
    String? customerEmail = '',
    String? customerPhone = '',
    String? problemDescription = '',
    String? locationAddress = '',
    String? serviceCategory = '',
    String? urgencyLevel = '',
    dynamic? photoUrlsJson,
    DateTime? appointmentStart,
    DateTime? appointmentEnd,
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final photoUrls = _serializeJson(photoUrlsJson, true);
    final ffApiRequestBody = '''
{
  "customer_name": ${customerName == null ? 'null' : '"${escapeStringForJson(customerName)}"'},
  "customer_email": ${customerEmail == null ? 'null' : '"${escapeStringForJson(customerEmail)}"'},
  "customer_phone": ${customerPhone == null ? 'null' : '"${escapeStringForJson(customerPhone)}"'},
  "problem_description": ${problemDescription == null ? 'null' : '"${escapeStringForJson(problemDescription)}"'},
  "location_address": ${locationAddress == null ? 'null' : '"${escapeStringForJson(locationAddress)}"'},
  "service_category": ${serviceCategory == null ? 'null' : '"${escapeStringForJson(serviceCategory)}"'},
  "urgency_level": ${urgencyLevel == null ? 'null' : '"${escapeStringForJson(urgencyLevel)}"'},
  "photo_urls": ${photoUrls},
  "appointment_start": ${appointmentStart == null ? 'null' : '"${appointmentStart.toUtc().toIso8601String()}"'},
  "appointment_end": ${appointmentEnd == null ? 'null' : '"${appointmentEnd.toUtc().toIso8601String()}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create guest request',
      apiUrl: '${baseUrl}/functions/v1/create_guest_request',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? guestaccesstoken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.guest_access_token''',
      ));
  String? requestnumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.request_number''',
      ));
}

class GetMyAccountTypeCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetMyAccountType',
      apiUrl: '${baseUrl}/rest/v1/rpc/get_my_account_type',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Supabase Group Code

class MadecomWebhookCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "prompt": "Hello AI!"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Madecom webhook',
      apiUrl: 'https://hook.eu1.make.com/8nezalwnrpub3xv43mshozarvbcriifi',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic result(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class SendPushNotificationOneSignalCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? title = '',
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "title": "${escapeStringForJson(title)}",
  "message": "${escapeStringForJson(message)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendPushNotification One signal',
      apiUrl:
          'https://tgsxiukxvxdelowstxqp.supabase.co/functions/v1/bright-responder',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StripeCreateSubscriptionCheckoutCall {
  static Future<ApiCallResponse> call({
    String? customerEmail = '',
    String? stripePriceId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "stripe_price_id": "${escapeStringForJson(stripePriceId)}",
  "customer_email": "${escapeStringForJson(customerEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Stripe createSubscriptionCheckout',
      apiUrl:
          'https://tgsxiukxvxdelowstxqp.supabase.co/functions/v1/create-subscription-checkout',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class NewsendpushOneSignalCall {
  static Future<ApiCallResponse> call({
    List<String>? playerIds,
    String? heading = 'SOS Elec',
    String? content = '',
  }) async {
    final ffApiRequestBody = '''
{
  "app_id": "0bba9fc5-4c16-43d9-a602-12332893a423",
  "include_player_ids": ${_serializeList(playerIds)},
  "headings": { "en": "${escapeStringForJson(heading)}", "fr": "${escapeStringForJson(heading)}" },
  "contents": { "en": "${escapeStringForJson(content)}", "fr": "${escapeStringForJson(content)}" }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NewsendpushOneSignal',
      apiUrl:
          'https://tgsxiukxvxdelowstxqp.supabase.co/functions/v1/new-send_push-onesignal',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StripeCreateCONNECTaccountCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StripeCreateCONNECTaccount',
      apiUrl:
          'https://tgsxiukxvxdelowstxqp.supabase.co/functions/v1/create-connect-account',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class CreatedepositcheckoutCall {
  static Future<ApiCallResponse> call({
    String? serviceRequestId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "${escapeStringForJson(serviceRequestId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createdepositcheckout',
      apiUrl:
          'https://tgsxiukxvxdelowstxqp.supabase.co/functions/v1/create-deposit-checkout',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class GetMaterialsTotalCall {
  static Future<ApiCallResponse> call({
    String? serviceRequestId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_service_request_id": "${escapeStringForJson(serviceRequestId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getMaterialsTotal',
      apiUrl:
          'https://tgsxiukxvxdelowstxqp.supabase.co/rest/v1/rpc/get_materials_total',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnc3hpdWt4dnhkZWxvd3N0eHFwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5NDAxNzMsImV4cCI6MjA4MzUxNjE3M30.ZsSQuJAR2uFybIao2qaISZulN8i8Yv0xaGOMEZJDLE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatefinalcheckoutCall {
  static Future<ApiCallResponse> call({
    String? serviceRequestId = '',
    double? amount = 100,
  }) async {
    final ffApiRequestBody = '''
{
  "id": "${escapeStringForJson(serviceRequestId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createfinalcheckout',
      apiUrl:
          'https://tgsxiukxvxdelowstxqp.supabase.co/functions/v1/createFinalCheckout',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  final encoded = jsonEncode(input);
  return encoded.substring(1, encoded.length - 1);
}
