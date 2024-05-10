import 'package:flutter/material.dart';
import 'package:projeto/repositories/meses_repository.dart';
import 'add_despesa.dart';
import 'add_nota.dart';
import 'dashboard_page.dart';
import 'more_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Visão geral',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Adicionar notinha',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Adicionar despesa',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: 'Mais',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF204522),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildPage(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return DashboardPage(
            month: MesRepository.obterMes(DateTime.now().month));
      case 1:
        return AddNotaPage();
      case 2:
        return AddDespesaPage();
      case 3:
        return MorePage();
      default:
        return Container();
    }
  }
}
