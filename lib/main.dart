import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loader'),
        ),
        body: const MyLoader(),
      ),
    );
  }
}

class MyLoader extends StatefulWidget {
  const MyLoader({Key? key}) : super(key: key);

  @override
  State<MyLoader> createState() => _MyLoaderState();
}

class _MyLoaderState extends State<MyLoader> {
  var isLoading = false;
  late BuildContext dialogContext;

  void functionHandle() {
    setState(() {
      isLoading = true;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            dialogContext = context;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.all(5),
                    child: const CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            );
          });
    });
    Future.delayed(const Duration(seconds: 5), () {
      debugPrint('hello divya');
      setState(() {
        isLoading = false;
      });
      Navigator.pop(dialogContext);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        functionHandle();
      },
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.grey,
            )
          : const Text('loader for 5s'),
    );
  }
}
