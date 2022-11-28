import 'package:flutter/material.dart';
import 'package:yzbtkj.cn.salessecretary/components/FormInput/FormInput.dart';

class MyForm extends StatefulWidget {
  MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  var _name = '';
  var _pwd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormInput(
                  shape: 'circle',
                  onSave: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    print(value);
                    return value!.length >= 6 ? null : '账号最少6个字符';
                  },
                ),
                FormInput(
                  password: true,
                  onSave: (value) {
                    _pwd = value!;
                  },
                  validator: (value) {
                    return value!.length >= 6 ? null : '账号最少6个字符';
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print(_name);
                      }
                    },
                    child: Text('确定'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
