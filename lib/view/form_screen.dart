import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Editing controller
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController designationController =
      new TextEditingController();
  final TextEditingController bioController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Name field
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Designation Field
    final designationField = TextFormField(
      autofocus: false,
      controller: designationController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        designationController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.work),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Designation",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Bio Field
    final bioField = TextFormField(
      autofocus: false,
      controller: bioController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        bioController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.school),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Bio",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Continue Button
    final continueButton = Material(
      
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  nameField,
                  designationField,
                  bioField,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
