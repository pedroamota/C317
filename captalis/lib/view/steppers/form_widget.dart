import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  final TextEditingController firstSelectionController;
  final TextEditingController secondSelectionController;
  final TextEditingController thirdSelectionController;

  const FormWidget({
    super.key,
    required this.firstSelectionController,
    required this.secondSelectionController,
    required this.thirdSelectionController,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  int selected1 = -1;
  int selected2 = -1;
  int selected3 = -1;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade100,
            Theme.of(context).colorScheme.inversePrimary,
            Theme.of(context)
                .colorScheme
                .inversePrimary, // Cor inferior (azul claro)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            alignment: Alignment.topCenter,
            child: const Text(
              'Captalis',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 50,
              ),
            ),
          ),
          SizedBox(
            height: size.height,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      //key: widget.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * .15,
                          ),
                          const SizedBox(height: 40),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Você sente que faz um bom uso de suas habilidades a na sua atual função?',
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Centraliza o conteúdo
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: List.generate(6, (index) {
                                  return IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.firstSelectionController.text =
                                            index.toString();
                                        selected1 = index;
                                      });
                                    },
                                    icon: Icon(
                                      selected1 == index
                                          ? Icons.circle
                                          : Icons
                                              .circle_outlined, // Ícone circular para feedback
                                      color: selected1 == index
                                          ? Colors.blue
                                          : Colors.grey, // Cor do botão
                                    ),
                                    iconSize: 10, // Tamanho dos ícones
                                  );
                                }),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Muito ruim'), // Espaçamento entre o texto e os botões
                                  Text('Muito bom'),
                                ],
                              ) // Espaçamento entre os botões e o texto à direita
                            ],
                          ),
                          const SizedBox(height: 80),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sente que esta no controle quando se trata do trabalho que preciso entregar?',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Centraliza o conteúdo
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: List.generate(6, (index) {
                                  return IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.secondSelectionController.text =
                                            index.toString();
                                        selected2 = index;
                                      });
                                    },
                                    icon: Icon(
                                      selected2 == index
                                          ? Icons.circle
                                          : Icons
                                              .circle_outlined, // Ícone circular para feedback
                                      color: selected2 == index
                                          ? Colors.blue
                                          : Colors.grey, // Cor do botão
                                    ),
                                    iconSize: 10, // Tamanho dos ícones
                                  );
                                }),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Muito ruim'), // Espaçamento entre o texto e os botões
                                  Text('Muito bom'),
                                ],
                              ) // Espaçamento entre os botões e o texto à direita
                            ],
                          ),
                          const SizedBox(height: 80),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Qual o nivel de respeito que as pessoas são tratadas na empresa? Independente de sua raça, classe ou genero?',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Centraliza o conteúdo
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: List.generate(6, (index) {
                                  return IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.thirdSelectionController.text =
                                            index.toString();
                                        selected3 = index;
                                      });
                                    },
                                    icon: Icon(
                                      selected3 == index
                                          ? Icons.circle
                                          : Icons
                                              .circle_outlined, // Ícone circular para feedback
                                      color: selected3 == index
                                          ? Colors.blue
                                          : Colors.grey, // Cor do botão
                                    ),
                                    iconSize: 10, // Tamanho dos ícones
                                  );
                                }),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Muito ruim'), // Espaçamento entre o texto e os botões
                                  Text('Muito bom'),
                                ],
                              ) // Espaçamento entre os botões e o texto à direita
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
