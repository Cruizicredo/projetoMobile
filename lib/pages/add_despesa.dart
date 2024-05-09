import 'package:flutter/material.dart';
import 'home_page.dart';

class AddDespesaPage extends StatefulWidget {
  @override
  _AddDespesaPageState createState() => _AddDespesaPageState();
}

class _AddDespesaPageState extends State<AddDespesaPage> {
  final _formKey = GlobalKey<FormState>();
  final _inputData = InputData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                onSaved: (value) {
                  _inputData.descricao = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _inputData.valor = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Data'),
                readOnly: true,
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _inputData.data = selectedDate;
                    });
                  }
                },
                controller: TextEditingController(
                    text: _inputData.data != null
                        ? _inputData.data!.toString()
                        : ''),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Categoria'),
                items: [
                  'Comidas/bebidas',
                  'Limpeza',
                  'Roupas/acessórios',
                  'Saúde/bem-estar',
                  'Entretenimento',
                  'Transporte',
                  'Educação',
                  'Casa'
                ].map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _inputData.categoria = value;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                decoration:
                    const InputDecoration(labelText: 'Forma de pagamento'),
                items: [
                  'Cartão de crédito',
                  'Cartão de débito',
                  'Dinheiro',
                  'Pix'
                ].map((String payment) {
                  return DropdownMenuItem<String>(
                    value: payment,
                    child: Text(payment),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _inputData.formaPagamento = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              Visibility(
                visible: _inputData.formaPagamento == 'Cartão de crédito',
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Parcelamento'),
                  items: [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11',
                    '12'
                  ].map((String payment) {
                    return DropdownMenuItem<String>(
                      value: payment,
                      child: Text(payment),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _inputData.parcelas = int.parse(value!);
                    });
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFDEFFDF)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(200, 50)),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(color: Color(0xFF204522)),
                    ),
                  ),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                        color: Color(0xFF204522),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SummaryPage(
                                inputData: _inputData,
                              )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputData {
  String descricao = '';
  double valor = 0.0;
  DateTime? data;
  String? categoria;
  String? formaPagamento;
  int parcelas = 1;
}

class SummaryPage extends StatelessWidget {
  final InputData inputData;

  SummaryPage({required this.inputData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Descrição: ${inputData.descricao}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Valor: ${inputData.valor}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Data: ${inputData.data?.toString() ?? ''}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Categoria: ${inputData.categoria ?? ''}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Forma de Pagamento: ${inputData.formaPagamento ?? ''}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Número de parcelas: ${inputData.parcelas}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFDEFFDF)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(200, 50)),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(color: Color(0xFF204522)),
                    ),
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                        color: Color(0xFF204522),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage(title: 'Início')),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
