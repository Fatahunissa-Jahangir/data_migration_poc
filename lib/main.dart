import 'package:data_migration_poc/local_storage.dart';
import 'package:data_migration_poc/migration_scripts/migration_V1.dart';
import 'package:data_migration_poc/migration_scripts/migration_V2.dart';
import 'package:data_migration_poc/models/db_transaction/db_transaction_db_model.dart';
import 'package:data_migration_poc/models/db_version/db_version_db_model.dart';
import 'package:data_migration_poc/models/user_db_model.dart';
import 'package:data_migration_poc/storage_sccess.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

void main() async{
   await initializeIsar();
   await runMigrationScript();
  runApp(const MyApp());
}

  initializeIsar() async { 
    final dir = await getMachineDirectory();
    LocalStorage.isar = await Isar.open(
      [
        UserDBModelSchema,
        DbVersionDBModelSchema,
        DbTransactionDBModelSchema
      ]
      , directory: dir.path);
  }

  runMigrationScript() async { 

    final dbVersion =  await LocalStorage.isar.dbVersionDBModels.get(1);
    final startmigrationVersion = dbVersion?.version ?? 'V1';

    print("db version $startmigrationVersion");

    Map<String, Future<void> Function()> functionMap = {
      'V1': () async => performMigrationV1(),
      'V2': () async => performMigrationV2(),
    };

    final List<String> migrationSequence = [
      'V1',
      'V2',
    ];


    int startIndex = migrationSequence.indexOf(startmigrationVersion);

  if (startIndex == -1) {
    print("Function '$startmigrationVersion' not found in sequence.");
    startIndex = 0;
    return;
  }

  // Check if it's the last item in the list
  if (startIndex >= migrationSequence.length - 1) {
    print("✅ Current version '$startmigrationVersion' is up to date. No migration needed.");
    return;
  }

  // If the current version is not the last in the list, start from the next version
  if (startIndex < migrationSequence.length - 1) {
    startIndex += 1;
  }

  for (int i = startIndex; i < migrationSequence.length; i++) {
    final name = migrationSequence[i];
    final startMigration = functionMap[name];

    print("name $name startMigration $startMigration");

    if (startMigration != null) {
      print("Executing: $name");
      await startMigration(); 
    } else {
      print("Function '$name' not found in functionMap.");
    }
  }

  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _saveData() async {
    if(nameController.text.isEmpty || locationController.text.isEmpty) {
      return;
    }
    final user = UserDBModel(
      name: nameController.text,
      location: locationController.text,
    );
    await LocalStorage.isar.writeTxn(() async {
      await LocalStorage.isar.userDBModels.put(user);
    });

    nameController.clear();
    locationController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Name : '),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Location : '),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveData,
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
