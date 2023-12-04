import 'appwrite_controller.dart';

class RealtimeController extends AppwriteController {
  subsUserName() async {
    final subscription = realtime.subscribe(['files']);

    subscription.stream.listen((response) {
      if (response.events.contains('buckets.*.files.*.create')) {
        print("RealtimeController:: subsUserName ${response.payload}");
        print("RealtimeController:: subsUserName ${response.events}");
      }
    });
  }
}
