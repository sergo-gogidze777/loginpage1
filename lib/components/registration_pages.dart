import 'package:flutter/material.dart';

class Registrationform extends StatefulWidget {
  const Registrationform({Key? key}) : super(key: key);

  @override
  State<Registrationform> createState() => _RegistrationformState();
}

class _RegistrationformState extends State<Registrationform> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool passwordhidden = true;
  final forakey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(height: 400,
      
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration:const BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20),),
        boxShadow: [BoxShadow(color:Colors.grey,
        offset: Offset(16, 16,),
            blurRadius: 10,
        )]

      ),
      child: Form(key: forakey,

        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          TextFormField(
            validator: (value) {if (value != null || value!.isEmpty)
            {return "enter valid text";

            }
            return null;
            },
            controller: usernamecontroller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person, color:Colors.black87),
              suffixIcon: IconButton(onPressed: () {
                usernamecontroller.clear();
              }, icon: const Icon(Icons.clear)  ),
            ),
          ),
          const SizedBox (height: 26,),
          TextFormField(
            obscureText: passwordhidden,
            controller: passwordcontroller,
            decoration: InputDecoration(
              prefixIcon:const Icon(Icons.key, color:Colors.black87),
              suffixIcon: IconButton(onPressed: () {
                setState(() {
                  passwordhidden = !passwordhidden;
                });
              }, icon:const Icon(
                  Icons.remove_red_eye)),
            ),
          ),
          const SizedBox (height: 26,),
          ElevatedButton(onPressed: () {

            forakey.currentState!.validate();

          }, child: const  Text('login'))
        ],
      ),

      ),

    )
    );
  }
}
