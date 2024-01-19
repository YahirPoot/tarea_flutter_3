// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/fetch_sql_activite.dart';
import 'package:flutter_application_3/utils/dog.dart';
import 'package:go_router/go_router.dart';

class SqlLitePage extends StatefulWidget {
  const SqlLitePage({super.key});

  @override
  _SqlLitePageState createState() => _SqlLitePageState();
}

class _SqlLitePageState extends State<SqlLitePage> {
  List<Dog> _dogs = [];
  int id = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _idController.dispose();
    super.dispose();
  }

  void _insertDog() async {
    if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Llene todos los campos')),
      );
      return;
    }

    int? age = int.tryParse(_ageController.text);
    if (age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('solo numeros')),
      );
      return;
    }

    // int? id = int.tryParse(_idController.text);
    // if (id == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('solo numeros')),
    //   );
    //   return;
    // }

    var fido = Dog(
      name: _nameController.text,
      age: int.parse(_ageController.text),
    );
    await insertDog(fido);
    _updateDogList();

    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _updateDog(int id) async {
    if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Llena todos los campos')),
      );
      return;
    }

    int? age = int.tryParse(_ageController.text);
    if (age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('solo numeros')),
      );
      return;
    }

    // int? id = int.tryParse(_idController.text);
    // if (id == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('solo numeros')),
    //   );
    //   return;
    // }
    var dog = await getById(id);
    var fido = Dog(
      id: dog.id,
      name: _nameController.text,
      age: int.parse(_ageController.text),
    );
    await updateDog(fido);
    _updateDogList();
    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _deleteDog(int id) async {
    await deleteDog(id);
    _updateDogList();
    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _updateDogList() async {
    _dogs = await dogs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/animated');
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Database Dog'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text('Nombre del perro:',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 20)),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Edad del perro:',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    ),
                    TextFormField(
                      controller: _ageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    // const SizedBox(height: 20),
                    // const Text('Id del perro:'),
                    // TextFormField(
                    //   controller: _idController,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter some text';
                    //     }
                    //     if (int.tryParse(value) == null) {
                    //       return 'Please enter a valid number';
                    //     }
                    //     return null;
                    //   },
                    // )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Lista de Perros',
              style: TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
            Expanded(
              child: FutureBuilder<List<Dog>>(
                future: dogs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    _dogs = snapshot.data!;
                    return ListView.builder(
                      itemCount: _dogs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Card(
                            color: Colors.cyan,
                            child: ListTile(
                              title: Text(
                                  'ID: ${_dogs[index].id}, Name: ${_dogs[index].name}'),
                              subtitle: Text('Age: ${_dogs[index].age}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _deleteDog(_dogs[index].id!);
                                },
                              ),
                              onTap: () {
                                _nameController.text = _dogs[index].name;
                                _ageController.text =
                                    _dogs[index].age.toString();
                                id = _dogs[index].id!;
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'hero1',
            onPressed: _insertDog,
            tooltip: 'Insert Dog',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'hero2',
            onPressed: () => _updateDog(id),
            tooltip: 'Update Dog',
            child: const Icon(Icons.update),
          ),
          // const SizedBox(height: 20),
          // FloatingActionButton(
          //   heroTag: 'hero3',
          //   onPressed: _deleteDog,
          //   tooltip: 'Delete Dog',
          //   child: const Icon(Icons.delete),
          // ),
        ],
      ),
    );
  }
}
