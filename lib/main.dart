import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_store/pages/splash_screen.dart';


 FirebaseOptions config =  const FirebaseOptions(
    apiKey: "AIzaSyA2YJllOyDWpwys3fHGGxpUqaubnig2pn8",
    authDomain: "online-store-e8144.firebaseapp.com",
    projectId: "online-store-e8144",
    storageBucket: "online-store-e8144.firebasestorage.app",
    messagingSenderId: "965605134934",
    appId: "1:965605134934:web:050adf2560cc8cc2e261f7",
    measurementId: "G-1NESW1FBS3"
 );

void main()async {
WidgetsFlutterBinding.ensureInitialized();
 if(kIsWeb){
    await Firebase.initializeApp(options:config);
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //cloud-deny

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       home: const SplashScreen(),
      
    );
  }
}

