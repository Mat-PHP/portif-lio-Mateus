import 'package:flutter/material.dart';

class AvaliacaoPage extends StatefulWidget {
  const AvaliacaoPage({super.key});

  @override
  State<AvaliacaoPage> createState() => _AvaliacaoPageState();
}

class _AvaliacaoPageState extends State<AvaliacaoPage> with SingleTickerProviderStateMixin {
  int _notaSelecionada = 0;
  final TextEditingController _comentarioController = TextEditingController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 1.0,
      upperBound: 1.2,
    );
  }

  @override
  void dispose() {
    _comentarioController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6EAF8),
      appBar: AppBar(
        title: const Text("Avaliação do Portfólio"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Como você avalia meu portfólio?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // ESTRELAS COM ANIMAÇÃO
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _notaSelecionada = index + 1;
                      _animationController.forward(from: 1.0);
                    });
                  },
                  child: ScaleTransition(
                    scale: _animationController,
                    child: Icon(
                      Icons.star,
                      color: index < _notaSelecionada ? Colors.amber : Colors.grey,
                      size: 40,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            // CAMPO DE COMENTÁRIO
            TextField(
              controller: _comentarioController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Deixe um comentário (opcional)",
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 30),

            // BOTÃO ENVIAR
            ElevatedButton(
              onPressed: _notaSelecionada == 0
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Obrigado!"),
                          content: Text(
                              "Você avaliou o portfólio com $_notaSelecionada estrelas.\n\n"
                              "${_comentarioController.text.isNotEmpty ? 'Comentário: ${_comentarioController.text}' : ''}"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Fechar"),
                            ),
                          ],
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text("Enviar Avaliação"),
            ),
          ],
        ),
      ),
    );
  }
}