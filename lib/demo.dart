import 'package:flutter/material.dart';
import 'package:pratise_app/testing/card.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Demo App',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 37, 27, 56),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 350,
              height: 60, // Fixed height
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.deepPurple,
                    Colors.purple,
                  ],
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search,
                          color: Colors.white, size: 30.0),
                      onPressed: () {
                        // Handle search button tap
                      },
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: double.infinity,
                    height: 630, // Fixed height
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.deepPurple,
                          Colors.purple,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.center, // Center alignment
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30), // Moves image downward
                              child: Image.asset(
                                'assets/pic.png',
                                width: 300,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: 20), // Space between image and text
                        Center(
                          child: const Text(
                          
                            "Welcome to My App!\nContinue exploring amazing \nfeatures and seamless experiences.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 60), 
                        SizedBox(
                          width: 200,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 37, 27, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/second');
                            },
                            icon: const Icon(Icons.play_arrow,
                                color: Colors.white),
                            label: const Text(
                              'Read more about app',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 77, 82, 77),
        child: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white, size: 30.0),
                onPressed: () {
                  // Handle home button tap
                },
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white, size: 30.0),
                onPressed: () {
                  // Handle search button tap
                },
              ),
              IconButton(
                icon: const Icon(Icons.person,
                    color: Colors.white, size: 30.0),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  UserProfile()));  
                  // Handle add button tap
                },
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}
