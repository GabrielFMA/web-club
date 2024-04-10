import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/partner.store.dart';

class RegisterExam extends StatefulWidget {
  const RegisterExam({Key? key}) : super(key: key);

  @override
  State<RegisterExam> createState() => _RegisterExamState();
}

class _RegisterExamState extends State<RegisterExam> {
  final formKey = GlobalKey<FormState>();
  late List<TextEditingController> _textControllers;
  late List<String> examValues;

  @override
  void initState() {
    super.initState();
    _textControllers = [];
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PartnerStore>(context);

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Row(
        children: [
          const MenuWidget(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const ListTile(
                                title: Text(
                                  "Registrar Exames",
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // Exame fields
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: store.getExam(),
                                itemBuilder: (context, index) {
                                  // Criar um controlador de texto para cada campo
                                  if (_textControllers.length <= index) {
                                    _textControllers.add(TextEditingController());
                                  }
                                  return TextFieldExam(
                                    context,
                                    'Exame ${index + 1}',
                                    _textControllers[index],
                                  );
                                },
                              ),
                              // Space
                              const SizedBox(height: 15),
                              // Button
                              buttonDefault(
                                context,
                                () async {
                                  if (formKey.currentState!.validate()) {
                                    // Coletar os valores escritos em cada campo
                                    examValues = _textControllers.map((controller) => controller.text).toList();

                                    print(examValues);
                                    // Use examValues conforme necessário (por exemplo, envie para a função de submissão)
                                  }
                                  
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonDefault(BuildContext context, VoidCallback? onClick) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500],
      ),
      child: TextButton(
        onPressed: onClick,
        child: const Text(
          "REGISTRAR",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget TextFieldExam(BuildContext context, String hintText, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500]?.withOpacity(.3),
      ),
      child: TextFormField(
        controller: controller, // Atribuir o controlador de texto ao campo
        validator: (text) {
          if (text!.isEmpty) {
            return "Digite um exame";
          }
          return null;
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.description_outlined),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
