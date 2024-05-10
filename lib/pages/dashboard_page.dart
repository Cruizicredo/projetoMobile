import 'package:flutter/material.dart';
import 'package:projeto/models/gasto_mes.dart';
import 'package:projeto/repositories/gastoMes_repository.dart';
import 'package:projeto/models/mes.dart';

class DashboardPage extends StatefulWidget {
  Mes month;
  DashboardPage({Key? key, required this.month}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double _progressValue = 0.32,
      _diferencaMes = 32.20,
      _valorItemMaiorGasto = 1200.50;
  String _itemMaiorGasto = 'Aluguel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
              width: 420,
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF204522),
              ),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Text(
                      'Você gastou ${_progressValue * 100}% dos seus recebimentos do mês.',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: _progressValue, // Set the progress value here
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF587459)),
                      borderRadius: BorderRadius.circular(2),
                      minHeight: 3,
                    ),
                  ]))),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 190,
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF204522),
                  ),
                  child: Center(
                      child: Text(
                    'Você está R\$${_diferencaMes} abaixo dos seus gastos do mês passado!',
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ))),
              const SizedBox(width: 40),
              Container(
                  width: 190,
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF204522),
                  ),
                  child: Center(
                    child: Text(
                        'Seu maior gasto do mês até agora foi com ${_itemMaiorGasto} (R\$${_valorItemMaiorGasto})',
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center),
                  )),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFDEFFDF)),
              minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(color: Color(0xFF204522)),
              ),
            ),
            child: const Text(
              'Meses',
              style: TextStyle(
                  color: Color(0xFF204522),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailedMonthPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DetailedSpendingPage extends StatefulWidget {
  GastoMensal gastoMes;
  DetailedSpendingPage({Key? key, required this.gastoMes}) : super(key: key);

  @override
  _DetailedSpendingState createState() => _DetailedSpendingState();
}

class _DetailedSpendingState extends State<DetailedSpendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gastoMes.mes.nome),
      ),
      body: Center(
        child: Text('Detailed Spending for ${widget.gastoMes.mes.nome}'),
      ),
    );
  }
}

class DetailedMonthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabela = GastoMensalRepository.tabela;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos por mês'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int linha) {
          return ListTile(
            title: Text(
              tabela[linha].mes.nome,
              style: const TextStyle(fontSize: 16),
            ),
            trailing: Text(tabela[linha].valorTotal.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailedSpendingPage(gastoMes: tabela[linha])),
              );
            },
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: tabela.length,
      ),
    );
  }
}
