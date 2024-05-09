import 'package:projeto/models/gasto_mes.dart';

class GastoMensalRepository {
  static List<GastoMensal> tabela = [
    GastoMensal(
        mes: 'Janeiro',
        valorTotal: 1630.50,
        gastoCategorias: [54.30, 512.20, 830.00, 201.50, 32.50]),
    GastoMensal(
        nome: 'Fevereiro',
        mes: (2, 'Fevereiro'),
        valorTotal: 1612.50,
        gastoCategorias: [54.30, 500.20, 830.00, 200.50, 27.50]),
    GastoMensal(
        nome: 'Março',
        mes: 3,
        valorTotal: 1530.50,
        gastoCategorias: [50.30, 486.20, 830.00, 191.50, 12.50]),
    GastoMensal(
        nome: 'Abril',
        mes: 4,
        valorTotal: 1767.50,
        gastoCategorias: [95.30, 580.20, 830.00, 230.50, 31.50]),
    GastoMensal(
        nome: 'Maio',
        mes: 5,
        valorTotal: 1577.50,
        gastoCategorias: [32.30, 482.20, 830.00, 197.50, 35.50]),
  ];
}
