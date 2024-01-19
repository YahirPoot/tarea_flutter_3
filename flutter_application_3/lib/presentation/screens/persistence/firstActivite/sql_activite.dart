import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/fetch_sql_activite.dart';
import 'package:flutter_application_3/utils/dog.dart';

class SqlLitePage extends StatefulWidget {
  const SqlLitePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SqlLitePage createState() => _SqlLitePage();
}

class _SqlLitePage extends State<SqlLitePage> {
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

    var fido = Dog(
      name: _nameController.text,
      age: int.parse(_ageController.text),
      id: 1,
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
        title: const Text('Base de Datos Dog'),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
                    const Text('Nombre del perro:'),
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
                    const Text('Edad del perro:'),
                    TextFormField(
                      controller: _ageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Text('Lista de Perros'),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                                title: Text(
                                    'ID: ${_dogs[index].id}, Name: ${_dogs[index].name}'),
                                subtitle: Text('Age: ${_dogs[index].age}'),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                onTap: () {
                                  _nameController.text = _dogs[index].name;
                                  _ageController.text =
                                      _dogs[index].age.toString();
                                  id = _dogs[index].id;
                                },
                                tileColor: Colors.blue[50],
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        _nameController.text =
                                            _dogs[index].name;
                                        _ageController.text =
                                            _dogs[index].age.toString();
                                        id = _dogs[index].id;
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        _deleteDog(_dogs[index].id);
                                      },
                                    ),
                                  ],
                                )),
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
        ],
      ),
    );
  }
}
