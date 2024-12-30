abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return message;
  }
}

class CustomFailure extends Failure {
  CustomFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(String s) : super('Server Failure');
}

class ResourceNotFound extends Failure {
  ResourceNotFound() : super('Not Found Failure');
}

class AutorizationFailure extends Failure {
  AutorizationFailure() : super('Autorization Failure');
}

/*
switch (response.statusCode) {
      case 400:
        return const DioBadRequest(message: "Bad Request");
      case 401:
        return const DioUnAuthorized(message: "Unauthorized Request");
      case 404:
        return const DioNotFoundError(message: "Resource Not Found");
      case 408:
        return const DioTimeoutError(message: "Request Timeout");
      case 500:
        return const ServerFailure("Internal Server Error");
      case 503:
        return const ServiceUnavailableFailure(message: "Service Unavailable");
      default:
        return const DioDefaultFailure(message: "Unknown Error");
    }
*/

class DioBadRequest extends Failure {
  DioBadRequest({required String message}) : super(message);
}

class DioUnAuthorized extends Failure {
  DioUnAuthorized({required String message}) : super(message);
}

class DioNotFoundError extends Failure {
  DioNotFoundError({required String message}) : super(message);
}

class DioTimeoutError extends Failure {
  DioTimeoutError({required String message}) : super(message);
}

class ServiceUnavailableFailure extends Failure {
  ServiceUnavailableFailure({required String message}) : super(message);
}

class DioDefaultFailure extends Failure {
  DioDefaultFailure({required String message}) : super(message);
}
