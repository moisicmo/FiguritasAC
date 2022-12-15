import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:FiguritasAC/components/dialog_action.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

serviceMethod(BuildContext context, String method, Map<String, dynamic>? data, String urlAPI) async {
  final Map<String, String> headers = {
    "Content-Type": "application/json",
  };
  final options = Options(validateStatus: (status) => status! <= 500, headers: headers);
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      debugPrint('==========================================');
      debugPrint('== method $method');
      debugPrint('== url $urlAPI');
      debugPrint('== body $data');
      debugPrint('== headers $headers');
      debugPrint('==========================================');
      var dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
        dioClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
      switch (method) {
        case 'get':
          try {
            return await dio.get(urlAPI, options: options).timeout(const Duration(seconds: 10)).then((value) {
              debugPrint('response.data ${value.data}');
              debugPrint('value.statusCode ${value.statusCode}');
              switch (value.statusCode) {
                case 200:
                  return value;
                default:
                  Navigator.of(context).pop();
                  callDialogAction(context, json.decode(value.data));
                  return null;
              }
            }).catchError((err) {
              debugPrint('err $err');
              Navigator.of(context).pop();
              callDialogAction(context, 'Lamentamos los inconvenientes, intentalo más tarde');
              return null;
            });
          } on DioError catch (error) {
            Navigator.of(context).pop();
            callDialogAction(context, error.response!.data);
            return null;
          }
        case 'post':
          try {
            return await dio.post(urlAPI, data: data, options: options).timeout(const Duration(seconds: 10)).then((value) {
              debugPrint('response.data ${value.data}');
              debugPrint('value.statusCode ${value.statusCode}');
              switch (value.statusCode) {
                case 200:
                  return value;
                default:
                  Navigator.of(context).pop();
                  callDialogAction(context, json.decode(value.data));
                  return null;
              }
            }).catchError((err) {
              Navigator.of(context).pop();
              callDialogAction(context, 'Lamentamos los inconvenientes, intentalo más tarde');
              return null;
            });
          } on DioError catch (error) {
            Navigator.of(context).pop();
            return callDialogAction(context, error.response!.data);
          }
      }
    }
  } on SocketException catch (e) {
    Navigator.of(context).pop();
    return callDialogAction(context, 'Verifique su conexión a Internet');
  } on TimeoutException catch (e) {
    return callDialogAction(context, 'Lamentamos los inconvenientes, intentalo más tarde');
  } catch (e) {
    return callDialogAction(context, 'Lamentamos los inconvenientes, tenemos problemas con los servidores');
  }
}
