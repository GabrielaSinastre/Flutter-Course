import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = '';
  String password = '';

  Widget _body(){
    return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 164,
                  height: 164,
                  
                  //IMAGENS COM URL DA INTERNET
                  // child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Logo_TV_2015.png/250px-Logo_TV_2015.png')
                
                  //IMAGENS COMO ASSETS DO PROJETO, CRIAR DECLARAÇÃO NO PUBSPEC
                  child: Image.asset('assets/images/logo.png'),
                ),

                Container(height: 20),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 24, bottom: 16
                    ),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (text){
                            email = text;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            border: OutlineInputBorder(),
                          ),
                        ),
                                    
                        SizedBox(
                          height: 12,
                        ),
                            
                        TextField(
                          onChanged: (text){
                            password = text;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(
                          height: 12,
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor : Colors.white,
                          ),
                          onPressed: () {
                            if (email == 'gabi@linda.com' && password == '123'){
                              print('correto');
                              //MANUAL NAVIGATION
                              // Navigator.of(context).pushReplacement(
                              //   MaterialPageRoute(builder: (context) => HomePage())
                              // );
                              
                              //ROTAS NOMEADAS - COMO REACT ROUTER 
                              Navigator.of(context).pushReplacementNamed('/home');
                            }
                          },
                          
                          child: Container(
                            width: double.infinity,
                            child: Text(
                                'Entrar',
                                textAlign: TextAlign.center,
                              )
                          ),
                        ),  
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/background.jpg', fit: BoxFit.cover)
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          _body(),
        ],
      )
    );
  }
}