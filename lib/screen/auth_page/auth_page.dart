import 'package:acceleratot/screen/main_page/main_page.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

class AuthorisationPage extends StatefulWidget {
  const AuthorisationPage({Key? key}) : super(key: key);

  @override
  State<AuthorisationPage> createState() => _AuthorisationPageState();
}

class _AuthorisationPageState extends State<AuthorisationPage> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).auth),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          Text(
                            S.of(context).inputLoginAndPassword,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text != null && text.length <= 3) {
                                return S.of(context).inputErrorLoginIsShort;
                              } else {
                                return null;
                              }
                            },
                            controller: nicknameController,
                            decoration: const InputDecoration(
                              hintText: 'Nickname',
                            ),
                            buildCounter: (_,
                                    {required currentLength,
                                    maxLength,
                                    required isFocused}) =>
                                Text(
                                  currentLength.toString() +
                                      "/" +
                                      8.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text != null && text.length <= 8) {
                                return S.of(context).inputErrorPasswordIsShort;
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: S.of(context).password,
                            ),
                            buildCounter: (_,
                                    {required currentLength,
                                    maxLength,
                                    required isFocused}) =>
                                Text(
                                  currentLength.toString() +
                                      "/" +
                                      16.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (nicknameController.text == 'qwerty' &&
                            passwordController.text == '123456ab') {
                          FocusScope.of(context).unfocus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(S.of(context).tryAgain),
                                  actions: [
                                    MaterialButton(
                                      onPressed: Navigator.of(context).pop,
                                      child: Text(
                                        S.of(context).close,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      color: Colors.blue,
                                    )
                                  ],
                                );
                              });
                        }
                      },
                      color: Colors.blue,
                      child: Text(
                        S.of(context).login,
                        style: const TextStyle(color: Colors.white),
                      ),
                      minWidth: MediaQuery.of(context).size.width - 16,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
