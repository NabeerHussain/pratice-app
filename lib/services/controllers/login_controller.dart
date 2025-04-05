import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:pratise_app/demo.dart';
import 'package:pratise_app/services/api_service/login_api.dart';
import 'package:pratise_app/services/models/login_model.dart';
import 'dart:developer';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  var user = Rxn<User>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
 

  Future<void> login() async {
    print("Login proces started...");
    log("Login process started...");

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      log("Login failed: Fields are empty");
      Get.snackbar("Error", "Please fill all fields", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    log("Sending login request...");

    final apiService = ApiService( );
    try {
      final response = await apiService.login(emailController.text, passwordController.text);
      print('Login response received: $response');
      
      log("Login response received: $response");

      isLoading.value = false;

      if (response.containsKey('error')) {
        log("Login failed: ${response['error']}");
        Get.snackbar("Login Failed", response['error'], snackPosition: SnackPosition.BOTTOM);
      } else {
        final userResponse = UserLoginResponse.fromJson(response);
        user.value = userResponse.user;

        log("User authenticated: ${user.value?.name}");
        log("Saving token to secure storage...");

        await FlutterKeychain.put(key: "token", value: userResponse.token);
        print('login token: ${userResponse.token}');
        log("Token saved successfully!");
        Get.off(EasyPaisaDashboard());
        // Get.offNamed('DemoApp');
      }
    } catch (e) {
      isLoading.value = false;
      log("Login error: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> loadUserData() async {
    log("Checking stored token...");
    
    try {
      String? token = await FlutterKeychain.get(key: "token");
      log("Stored Token: $token");
      print('Stored Token: $token');

      if (token != null) {
        Get.off(EasyPaisaDashboard());
      }
    } catch (e) {
      log("Error retrieving token: $e");
    }
  }
}
