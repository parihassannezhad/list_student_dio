import 'package:flutter/material.dart';
import 'package:list_student_dio/data.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: FutureBuilder<List<StudentData>>(
      future: getStudents(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Padding(
            padding: const EdgeInsets.only(top:20),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return _student(
                  data: snapshot.data![index],
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    )));
  }
}

class _student extends StatelessWidget {
  final StudentData data;

  const _student({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: [Text('${data.firstName}  ${data.lastName}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)],
        ),
      ),
    );
  }
}
