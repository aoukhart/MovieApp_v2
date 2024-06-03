import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkChecker{
  late RxBool isConnected;
  bool checkNetwork();
}

@LazySingleton()
class NetworkCheckerImpl implements NetworkChecker{
  late RxBool isConnected;

  @override
  bool checkNetwork(){
    return false;
  }
}