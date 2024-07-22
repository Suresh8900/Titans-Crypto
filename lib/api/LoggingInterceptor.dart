import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../Utills/UiHelper.dart';


class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
  //  print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    // if (data.statusCode == 401) {
    //   if(NavigationService.navigatorKey.currentContext!=null) {
    //     showToast("Your session is expired, please login again.");
    //     access_token="";
    //     PreferenceManager.clearSharedPref();
    //     AppDelegate().reset();
    //     Navigator.pushAndRemoveUntil<dynamic>(
    //       NavigationService.navigatorKey.currentContext!,
    //       MaterialPageRoute<dynamic>(
    //         builder: (BuildContext context) => const Splash(),
    //       ),
    //           (route) => false,
    //     );
    //
    //
    //     // get base request
    //     // final request = data.request;
    //     //
    //     // // and retry request
    //     // final stream = await ApiBaseService.client.send(request);
    //     // final res = await http.Response.fromStream(stream);
    //     //
    //     // // transform http response into a chopper response
    //     // return Response(res, res.body);
    //
    //   }
    //
    // }
    if (data.statusCode == 502) {
      showToast('Bad Gateway');
    }
    if (kDebugMode) {
      log(data.toString());
    }
    return data;
  }

  Future<ResponseData> retryOriginalRequest(RequestData originalRequest) async {
    // Implement the logic to retry the original request with the new token
   // try {
      final retriedResponse = await originalRequest.body();

      return retriedResponse;
  //  } catch (e) {

      // Handle retry error
      // return ResponseData(
      //   statusCode: 500,
      //   headers: {},
      //   body: null,
      // );
   // }
  }



}