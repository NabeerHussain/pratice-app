import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pratise_app/services/controllers/login_controller.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('User Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF14213D), Color(0xFFFF7426)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column ka height content ke hisaab se adjust hoga
          children: [
            // Header with Profile Picture
            Container(
              height: 270,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF14213D), Color(0xFFFF7426)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                        'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // User Name
                  Text(
                    loginController.user.value?.name ?? "User Name",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // User Type
                  Text(
                    loginController.user.value?.userType ?? "User Type",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile Info Cards
            _buildProfileInfoCard(
              icon: Icons.email,
              title: "Email",
              value: loginController.user.value?.email ?? "example@gmail.com",
            ),
            _buildProfileInfoCard(
              icon: Icons.credit_card,
              title: "CNIC",
              value: loginController.user.value?.cnic ?? "1234567890987",
            ),
            _buildProfileInfoCard(
              icon: Icons.person_pin_circle_rounded,
              title: "User Type",
              value: loginController.user.value?.userType ?? "Type",
            ),

            const SizedBox(height: 20),

            // Delete Account Button
            _buildDeleteButton(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: 340,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFF7426), size: 28),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: () {
        Get.snackbar(
          "Account Deleted",
          "Your account has been deleted successfully.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: Container(
        width: 320,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.4),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Colors.white, size: 28),
            SizedBox(width: 8),
            Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
