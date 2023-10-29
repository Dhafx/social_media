import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  final RxInt selectedTab = 0.obs;

  void setSelectedTab(int index) {
    selectedTab.value = index;
  }
}
