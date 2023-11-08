
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this,
        duration: const Duration(seconds: 5));
    animation = Tween(begin: 200.0, end: 100.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.red,
        end: Colors.yellow) . animate(animationController);

    animationController.addListener(() {
      print(animation.value);
      setState(() {

      });
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Center(
            child: Text('Tween Builder',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),)),
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color:colorAnimation.value,
        ),
      ),
    );
  }
}
