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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lab 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _subjects = [];

  void editSubject(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedSubject = _subjects[index];
        return AlertDialog(
          title: const Text("Edit subject"),
          content: TextField(
            onChanged: (value) {
              editedSubject = value;
            },
            controller: TextEditingController(text: _subjects[index]),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _subjects[index] = editedSubject;
                  Navigator.pop(context);
                });
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void addSubject() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newSubject = "";
          return AlertDialog(
            title: const Text("Add a new subject"),
            content: TextField(
              onChanged: (value) {
                newSubject = value;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (newSubject.isNotEmpty) {
                        _subjects.add(newSubject);
                      }
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text('Lab 2'),
        ),
        body: Column(
          children: [
            const Text("Clothes List",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.blue,
                )),
            Expanded(
              child: ListView.builder(
                itemCount: _subjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(
                          _subjects[index],
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            ElevatedButton(
                            onPressed: () {
                              // Add your button click logic here
                              editSubject(index);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.red,
                              padding: const EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text('Edit'),
                          ),SizedBox(width: 8.0),ElevatedButton(
                              onPressed: () {
                                // Add your button click logic here
                                setState(() {
                                  _subjects.removeAt(index);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.red,
                                padding: const EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text('Delete'),
                            )]
                        )),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button click logic here
                  addSubject();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Add New Item'),
              ),
            )
          ],
        ));
  }
}
