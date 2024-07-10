import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:medical_client_side/core/inject_dependencies/inject.dart';

Future<bool> checkInternetConnection() async {
  // Check if the device is connected to the internet
  return await getItInstance<InternetConnection>().hasInternetAccess;
}
