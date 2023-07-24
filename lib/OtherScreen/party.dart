import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PersonDetails {
  String? name;
  String? address;
  int? phoneNumber;

  PersonDetails({this.name, this.phoneNumber, this.address});

  PersonDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

class EmptyScreen extends StatefulWidget {
  @override
  _EmptyScreenState createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  SharedPreferences? _prefs;
  List<PersonDetails> persons = [];

  @override
  void initState() {
    super.initState();
    _loadPartyDetails();
  }

  Future<void> _loadPartyDetails() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? personList = _prefs!.getStringList('persons');
    if (personList != null) {
      setState(() {
        persons = personList
            .map((json) => PersonDetails.fromJson(jsonDecode(json)))
            .toList();
      });
    }
  }

  Future<void> _savePartyDetails() async {
    List<String> personList =
        persons.map((person) => jsonEncode(person.toJson())).toList();
    await _prefs!.setStringList('persons', personList);
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? name;
        int? phoneNumber;
        String? address;

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Add Party Details",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                onChanged: (value) {
                  phoneNumber = int.tryParse(value)!;
                },
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                onChanged: (value) {
                  address = value;
                },
                decoration: InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (name != null && phoneNumber != null) {
                  setState(() {
                    persons.add(PersonDetails(
                      name: name,
                      phoneNumber: phoneNumber,
                      address: address,
                    ));
                  });
                  _savePartyDetails(); // Save the updated list
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? name = persons[index].name;
        int? phoneNumber = persons[index].phoneNumber;
        String? address = persons[index].address;

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Edit Party Details",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(labelText: 'Name'),
                controller: TextEditingController(text: name),
              ),
              TextField(
                onChanged: (value) {
                  phoneNumber = int.tryParse(value)!;
                },
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: phoneNumber.toString()),
              ),
              TextField(
                onChanged: (value) {
                  address = value;
                },
                decoration: InputDecoration(labelText: 'Address'),
                controller: TextEditingController(text: address),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (name != null && phoneNumber != null) {
                  setState(() {
                    persons[index].name = name;
                    persons[index].phoneNumber = phoneNumber;
                    persons[index].address = address;
                  });
                  _savePartyDetails(); // Save the updated list
                }
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 36, 192),
        title: Text('Party'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: persons.isEmpty
          ? Center(
              child: Text(
                'Add Party Details',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    color: Color.fromARGB(255, 135, 79, 248),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            persons[index].name!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${persons[index].phoneNumber!}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            persons[index].address!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _showEditDialog(index);
                                      });
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              child: AlertDialog(
                                                title: Text("Are you sure?"),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          persons
                                                              .removeAt(index);
                                                          _savePartyDetails();
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Yes")),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("No"))
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 39, 36, 192),
          onPressed: _showAddDialog,
          child: Container(child: Icon(Icons.add)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
