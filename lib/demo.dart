import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pratise_app/class_pratice/bulb.dart';
import 'package:pratise_app/portfoliio/portfolio.dart';
import 'package:pratise_app/services/controllers/login_controller.dart';
import 'package:pratise_app/testing/card.dart';
class EasyPaisaDashboard extends StatelessWidget {
   EasyPaisaDashboard({super.key});

  @override
   
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          loginController.user.value?.name ?? "User Name", 
          style: TextStyle(color: Colors.white
          )),
          flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF14213D), Color(0xFFFF7426)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF14213D), Color(0xFFFF7426)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('User Name', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('user@example.com', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Portfolio'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioScreen()));
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            // ListTile(
            //   leading: Icon(Icons.logout),
            //   title: Text('Logout'),
            //   onTap: () {},
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF14213D), Color(0xFFFF7426)]),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Available Balance', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text('PKR 25,000', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickAction(Icons.send, 'Send Money'),
                _buildQuickAction(Icons.mobile_friendly, 'Mobile Load'),
                _buildQuickAction(Icons.qr_code, 'Scan & Pay'),
                _buildQuickAction(Icons.receipt_long, 'Bills'),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionCard('Paid to Ali', '-PKR 500', Colors.red),
                  _buildTransactionCard('Received from Ahmed', '+PKR 1500', Colors.green),
                  _buildTransactionCard('Bill Payment', '-PKR 3000', Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => BulbScreen()));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
          break;
          }
        },
      ),
      );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color.fromARGB(255, 224, 223, 226),
          child: Icon(icon, color: Color(0xFFFF7426), size: 30),
        ),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTransactionCard(String title, String amount, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.arrow_forward, color: color),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(amount, style: TextStyle(color: color, fontSize: 16)),
      ),
    );
  }
}
