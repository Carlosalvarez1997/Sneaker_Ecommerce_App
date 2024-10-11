import 'package:flutter/material.dart';
import 'package:sneaker_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 240,
                colorBlendMode: BlendMode.multiply,
                color: Colors.grey[300],
                
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //title
            const Center(
              child: Text(
                "Just do it",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  
                ),
              ),
            ),

            //subtitle
            const Text(
              "BRAND NEW SNEAKERS WITH QUALITY",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 48,
            ),

            //start now button

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage())),
                child: Container(
                
                  decoration: BoxDecoration(color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(30) ),
                  padding: const EdgeInsets.all(25),
                  child:
                      const Center(
                        child: Text("Shop Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          )
                        )
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
