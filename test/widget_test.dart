import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_proyecto/main.dart'; // Asegúrate de que este nombre coincida con tu proyecto

void main() {
  testWidgets('Verificar que Home renderiza título y botón', (WidgetTester tester) async {
    // Carga la aplicación
    await tester.pumpWidget(const MyApp());

    // 1. Verifica que el título que pusiste en main.dart aparezca
    expect(find.text('Mi Proyecto Seguro'), findsOneWidget);

    // 2. Verifica que el botón de incremento existe por su icono
    expect(find.byIcon(Icons.add), findsOneWidget);
    
    // 3. (Opcional) Simula un toque y verifica que el contador sube
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}