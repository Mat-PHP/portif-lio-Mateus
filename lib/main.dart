import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'avaliacao_page.dart'; 

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portfólio Mateus",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> abrirLink(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3A1B6),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Portfólio do Mateus",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("imgs/Foto de Perfil.jpg"),
            ),
          ),

          const SizedBox(height: 30),

          
          const Text(
            "Sobre mim",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Meu nome é Mateus, tenho 26 anos e sou apaixonado por tecnologia. "
            "Estou sempre em constante evolução profissional na área de "
            "Desenvolvimento de Software.",
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 30),

          
          const Text(
            "Experiência Profissional",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Centro Nacional de Pesquisa em Energia e Materiais (CNPEM)\n"
            "2018 – 2025\n\n"
            "• Desenvolvimento de soluções de automação utilizando Excel VBA, otimizando processos internos.\n"
            "• Criação de dashboards interativos no Power BI para monitoramento e análise de dados técnicos.\n"
            "• Suporte à tomada de decisão baseada em dados, por meio de relatórios e automação de processos.\n",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            "Bosch\n"
            "Desenvolvimento de Software\n"
            "2025 – Atual\n\n"
            "• Desenvolvimento de aplicações de software utilizando tecnologias modernas de Backend e Frontend.\n"
            "• Integração de APIs.\n"
            "• Desenvolvimento de soluções digitais.",
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 40),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              GestureDetector(
                onTap: () {
                  abrirLink("https://github.com/Mat-PHP/Dashboard-de-Vendas.git");
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/25/25231.png"),
                ),
              ),

              GestureDetector(
                onTap: () {
                  abrirLink("https://www.facebook.com/mateus.ferreira.431549");
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/733/733547.png"),
                ),
              ),

              GestureDetector(
                onTap: () {
                  abrirLink("https://www.instagram.com/salustianomateusferreira/");
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/2111/2111463.png"),
                ),
              ),

              GestureDetector(
                onTap: () {
                  abrirLink("https://www.linkedin.com/notifications/?filter=all");
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/174/174857.png"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

         
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.rate_review),
              label: const Text("Avalie meu Portfólio"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AvaliacaoPage()),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}