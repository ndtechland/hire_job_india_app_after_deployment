import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/modules/all_pages/pages/emploree_pages/home_page_employee.dart';

import '../../../models/employee_model/apply_leave_model_dropdown.dart';
import '../../../services_apis/api_servicesss.dart';

class LeaveApplyController extends GetxController {
  final isLoading = false.obs;

  final GlobalKey<FormState> leaveapplysignupKey = GlobalKey<FormState>();
  // Observable to track selected leave category dropdown
  // Observable to track selected leave category dropdown
  Rx<GetLeaveTypeList?> selectedCatDropdown = (null as GetLeaveTypeList?).obs;
  RxList<GetLeaveTypeList> leaveCategory = <GetLeaveTypeList>[].obs;

  ///todo: leave Type..
  Rx<GetLeaveList?> selectedtypedropdown = (null as GetLeaveList?).obs;
  RxList<GetLeaveList> leaveType = <GetLeaveList>[].obs;

  ///todo: leave Type..
  Rx<GetLeaveList?> selectedtypeenddropdown = (null as GetLeaveList?).obs;
  RxList<GetLeaveList> leaveTypeend = <GetLeaveList>[].obs;

  // Method to fetch leave categories from API
  // Method to fetch leave categories from API
  void getCatLeavecatApi() async {
    try {
      // Indicate loading state
      isLoading(true);

      // Fetch leave categories from API
      var categories = await ApiProvider.getDropdownLeaveApi();

      // Update observable list with fetched categories
      leaveCategory.value = categories;

      // Reset selected category if it's not in the new list
      if (!leaveCategory.contains(selectedCatDropdown.value)) {
        selectedCatDropdown.value = null;
      }
    } catch (e) {
      // Handle errors (if any)
      Get.snackbar('Error', 'Failed to load leave categories');
    } finally {
      // Indicate loading completion
      isLoading(false);
    }
  }

  ///leave Type...start1
  void getLeavetypeApi() async {
    try {
      // Indicate loading state
      isLoading(true);

      // Fetch leave categories from API
      var typeee = await ApiProvider.getDropdownLeaveTypeApi();

      // Update observable list with fetched categories
      leaveType.value = typeee;

      // Reset selected category if it's not in the new list
      if (!leaveType.contains(selectedtypedropdown.value)) {
        selectedtypedropdown.value = null;
      }
    } catch (e) {
      // Handle errors (if any)
      Get.snackbar('Error', 'Failed to load leave categories');
    } finally {
      // Indicate loading completion
      isLoading(false);
    }
  }

  ///leave Type...end 2
  void getLeavetypeEndApi() async {
    try {
      // Indicate loading state
      isLoading(true);

      // Fetch leave categories from API
      var typeee = await ApiProvider.getDropdownLeaveTypeApi();

      // Update observable list with fetched categories
      leaveTypeend.value = typeee;

      // Reset selected category if it's not in the new list
      if (!leaveType.contains(selectedtypeenddropdown.value)) {
        selectedtypeenddropdown.value = null;
      }
    } catch (e) {
      // Handle errors (if any)
      Get.snackbar('Error', 'Failed to load leave categories');
    } finally {
      // Indicate loading completion
      isLoading(false);
    }
  }

  ///get cities api...........
  ///todo: multiple day apply leave.....
  Future<void> applyLeave({
    required String typeOfLeaveId,
    required String startLeaveId,
    required String endeaveId,
    required String startDate,
    required String endDate,
    required String reason,

    //reason
  }) async {
    try {
      isLoading(true);

      final Map<String, String> formData = {
        'typeOfLeaveId': typeOfLeaveId,
        'startLeaveId': startLeaveId,
        'endeaveId': endeaveId,
        'startDate': startDate,
        'endDate': endDate,
        'reason': reason,
      };

      // Make API call
      final response = await ApiProvider.ApplyLeave(formData);

      if (response.statusCode == 200) {
        print('Apply Leave successfully!');
        // Get.offAll(Login());
        Get.offAll(() => HomeEmployee());
        print(response.body);
      } else {
        print('Error Apply Leave: ${response.statusCode}');
      }
    } catch (error) {
      print('Network error: $error');
    } finally {
      isLoading(false);
    }
  }

  ///todo: single day apply leave.....
  Future<void> applyLeave2({
    required String typeOfLeaveId,
    required String startLeaveId,
    required String endeaveId,
    required String startDate,
    required String endDate,
    required String reason,
  }) async {
    try {
      isLoading(true);

      final Map<String, String> formData = {
        'typeOfLeaveId': typeOfLeaveId,
        'startLeaveId': startLeaveId,
        'endeaveId': endeaveId,
        'startDate': startDate,
        'endDate': endDate,
        'reason': reason,
      };

      // Make API call
      final response = await ApiProvider.ApplyLeave(formData);

      if (response.statusCode == 200) {
        print('Apply Leave successfully!');
        // Get.offAll(Login());
        Get.offAll(() => HomeEmployee());
        print(response.body);
      } else {
        print('Error Apply Leave: ${response.statusCode}');
      }
    } catch (error) {
      print('Network error: $error');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCatLeavecatApi();
    getLeavetypeApi();
    getLeavetypeEndApi();

    //getNurseTypeApi();
    // selectedState.listen((p0) {
    //   // if (p0 != null) {
    //   //   getCityByStateIDLab("${p0.id}");
    //   // }
    // });
  }
}
