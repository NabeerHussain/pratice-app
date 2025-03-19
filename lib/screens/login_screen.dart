import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pratise_app/services/controllers/login_controller.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
  
class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF14213D), Color(0xFFFF7426)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ImageIcon( AssetImage('assets/pic.png'), size: 100, color: Color(0xFF14213D)),
                             
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF14213D),
                              ),
                            ),
                            SizedBox(height: 20),
              
                            // Email Field
                            TextFormField(
                              controller: controller.emailController,
                              onChanged: (val) => controller.email.value = val,
                              decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon:
                                    Icon(Icons.email, color: Color(0xFF14213D)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return "Email is required";
                                if (!GetUtils.isEmail(value))
                                  return "Enter a valid email";
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
              
                            // Password Field
                            Obx(
                              () => TextFormField(
                                controller: controller.passwordController,
                                onChanged: (val) =>
                                    controller.password.value = val,
                                obscureText: controller.isPasswordHidden.value,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon:
                                      Icon(Icons.lock, color: Color(0xFF14213D)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.isPasswordHidden.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Color(0xFF14213D),
                                    ),
                                    onPressed: () {
                                      controller.isPasswordHidden.value =
                                          !controller.isPasswordHidden.value;
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "Password is required";
                                  if (value.length < 6)
                                    return "Password must be at least 6 characters";
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 10),
              
                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Color(0xFF14213D),
                                    fontWeight: FontWeight.bold,
                                    
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
              
                            // Login Button
                            Obx(
                              () => controller.isLoading.value
                                  ? CircularProgressIndicator()
                                  : SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFFF7426),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            controller.login();
                                          }
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(height: 15),
              
                            // Signup Button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Color(0xFF14213D)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Get.toNamed('/signup');
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF14213D)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
              
                  // Powered by NABEER HUSSAIN
                  Column(
                    children: [
                      Text(
                        "Design by",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                        
                          Get.toNamed("https://nabeer.netlify.app");
                        },
                        child: Text(
                          "NABEER HUSSAIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
