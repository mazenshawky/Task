import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../error/exceptions.dart';
import 'endpoint.dart';


abstract class DioHelper {
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class DioImpl extends DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '$baseApiUrl$version',
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
    ),
  );

  @override
  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');
    debugPrint('accessToken => $token');

    return await request(
      call: () async => await dio.get(
        endPoint,
        queryParameters: query,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await request(
      call: () async => await dio.post(
        endPoint,
        data: data,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }
}

extension on DioHelper {
  Future request({
    required Future<Response> Function() call,
  }) async {
    try {
      final r = await call.call();
      debugPrint("Response_Data => ${r.data}");
      debugPrint("Response_Code => ${r.statusCode}");
      if (r.data['status']['type'] == '0' &&
          r.data['data']['data'] != null &&
          r.data['data']['data'].isEmpty) {
        return r.data;
      }
      if (r.data['status']['type'] == '0') {
        dynamic title = r.data['status']['title'];
        print(title);
        throw PrimaryServerException(
          message: title == null
              ? ''
              : title is String
              ? title
              : r.data['status']['title']['ar'],
          code: r.statusCode ?? 500,
          error: title == null
              ? ''
              : title is String
              ? title
              : r.data['status']['title']['en'],
        );
      } else {
        return r.data;
      }
    } on DioError catch (e) {
      debugPrint("Error_Message => ${e.message}");
      debugPrint("Error_Error => ${e.error.toString()}");
      debugPrint("Error_Type => ${e.type.toString()}");

      throw PrimaryServerException(
        code: 100,
        error: e.error.toString(),
        message: e.message,
      );
    }
  }
}