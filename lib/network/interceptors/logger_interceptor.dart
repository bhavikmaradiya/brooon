import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 75,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.d('Error: ${err.error}, Message: ${err.message} \n ${err.response}');
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String requestPath =
        'Base URL:${options.baseUrl}\nPaths:${options.path}\nQueryParams:${options.queryParameters}';
    if (options.data is FormData) {
      requestPath += '\nBody:${(options.data as FormData).fields}';
    } else {
      requestPath += '\nBody:${options.data}';
    }
    final requestHeader = '${options.headers}';
    logger.i('${options.method} request => $requestPath'
        '\nHeaders => $requestHeader');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('StatusCode: ${response.statusCode}, Data: ${response.data}');
    return super.onResponse(response, handler);
  }
}
