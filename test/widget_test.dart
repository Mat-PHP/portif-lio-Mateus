import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mateus/main.dart'; // Ajuste o caminho se necessário

void main() {
  testWidgets('Verifica se o app carrega e exibe o título', (WidgetTester tester) async {
    // Carrega o widget correto
    await tester.pumpWidget(const MeuApp());

    // Verifica se o título aparece na tela
    expect(find.text('Portfólio do Mateus'), findsOneWidget);
  });

  testWidgets('Verifica se o botão GitHub está presente', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    // Procura pelo botão com o texto "Abrir GitHub"
    expect(find.widgetWithText(ElevatedButton, 'Abrir GitHub'), findsOneWidget);
  });

  testWidgets('Verifica se a foto de perfil está presente', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    // Procura pelo CircleAvatar
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}