
import 'package:ecommerce_market_ui/Globals/MyGlobalVals.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

final ButtonStyle myFlatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      minimumSize: const Size(88, 44),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.blue,
    );
    
class _State extends State<ContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {    
    return SelectionArea(
      child: Scaffold(
          appBar: AppBar(title: const Text("Contact Page") ),
          body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[                  
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'İletişim Formu',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30),
                      )),
                  Container(
                    width: MyResponsiveDeviceWidthForPopup,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'İsim ',
                      ),
                    ),
                  ),
                  Container(
                    width: MyResponsiveDeviceWidthForPopup,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),

                  Container(
                    width: MyResponsiveDeviceWidthForPopup,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.multiline, 
                      controller: nameController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 50.0),
                        border: OutlineInputBorder(),
                        labelText: 'Email ',
                      ),
                    ),
                  ),
           
                  Container(
                    width: MyResponsiveDeviceWidthForPopup,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextButton(
                      style: myFlatButtonStyle,
                      onPressed: () {},
                      child: const Text('Üye Girişi'),
                    ),
                  ),
                  Container(
                    width: MyResponsiveDeviceWidthForPopup,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextButton(
                      style: myFlatButtonStyle,
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                      child: const Text('Gönder'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Henüz Üye eğil misiniz ?'),
                      TextButton(
                        // textColor: Colors.blue,
                        style: TextButton.styleFrom(foregroundColor: Colors.blue),
                        child: const Text(
                          'Üye Ol',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          //signup screen
                        },
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
