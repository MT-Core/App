import 'package:app/models/user_data.dart';
import 'package:app/modules/profile/bloc/profile_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// [ProfilePageField] is a class that contains the profile page field.
class ProfilePageField extends StatefulWidget {
  /// [ProfilePageField] constructor.
  const ProfilePageField({required this.user, required this.onSaved, super.key});

  /// [user] is the user data.
  final UserData user;

  /// [onSaved] is the on saved function.
  final void Function({required UserData user}) onSaved;

  @override
  State<ProfilePageField> createState() => _ProfilePageFieldState();
}

class _ProfilePageFieldState extends State<ProfilePageField> {
  final GlobalKey<dynamic> _formKey = GlobalKey<FormBuilderState>();
  late Function retreiveRegion;
  TextEditingController controller = TextEditingController();
  late ProfilePageBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ProfilePageBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  SnackBar customSnackBar({required String label, required String notifLabel}) => SnackBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        action: SnackBarAction(label: label, onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
        content: Text(notifLabel),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(horizontal: 8),
      );

  void saveProfile() {
    _formKey.currentState?.save();
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      widget.user.firstname = _formKey.currentState?.value['firstname'] ?? widget.user.firstname;
      widget.user.lastname = _formKey.currentState?.value['lastname'] ?? widget.user.lastname;
      widget.user.age = _formKey.currentState?.value['birthdate'] ?? widget.user.age;
      widget.user.country = _formKey.currentState?.value['country'] ?? widget.user.country;
      widget.user.city = _formKey.currentState?.value['city'] ?? widget.user.city;
      widget.onSaved(user: widget.user);
    }
  }

  InputDecoration getTextDecoration({required String labelText}) =>
      InputDecoration(labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 15, fontWeight: FontWeight.w800), labelText: labelText);

  @override
  Widget build(BuildContext context) => FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: <String, dynamic>{
          'email': widget.user.email,
          'firstname': widget.user.firstname,
          'lastname': widget.user.lastname,
          'country': widget.user.country,
          'city': widget.user.city,
          'age': widget.user.age,
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: FormBuilderTextField(
                enabled: false,
                name: 'email',
                cursorColor: Theme.of(context).colorScheme.onSecondary,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                decoration: getTextDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.name,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'firstname',
                      onChanged: (String? value) => saveProfile(),
                      cursorColor: Theme.of(context).colorScheme.onSecondary,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      decoration: getTextDecoration(labelText: 'Firstname'),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'lastname',
                      onChanged: (String? value) => saveProfile(),
                      cursorColor: Theme.of(context).colorScheme.onSecondary,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      decoration: getTextDecoration(labelText: 'Lastname'),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: FormBuilderDateTimePicker(
                name: 'birthdate',
                onChanged: (DateTime? value) => saveProfile(),
                cursorColor: Theme.of(context).colorScheme.onSecondary,
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                inputType: InputType.date,
                decoration: getTextDecoration(labelText: 'Birthdate'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'city',
                      onChanged: (String? value) => saveProfile(),
                      cursorColor: Theme.of(context).colorScheme.onSecondary,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      decoration: getTextDecoration(labelText: 'City'),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'country',
                      onChanged: (String? value) => saveProfile(),
                      cursorColor: Theme.of(context).colorScheme.onSecondary,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      decoration: getTextDecoration(labelText: 'Country'),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
