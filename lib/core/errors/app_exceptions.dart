abstract class AppException {
  final String message;
  const AppException({required this.message});
}

class RemoteException extends AppException {
  RemoteException({required super.message});
}

class LocalException extends AppException {
  LocalException({required super.message});
}
