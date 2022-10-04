import 'package:app/features/category/model/category.dart';

abstract class ICategoryRepository {
  Future<List<Category>> fetchList();
  Future<List<Category>> fetchListWithError();
}

class CategoryRepository implements ICategoryRepository {
  @override
  Future<List<Category>> fetchList() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Category(name: 'Alimentação'),
      Category(name: 'Contas'),
      Category(name: 'Pets'),
      Category(name: 'Casa'),
      Category(name: 'Trabalho'),
      Category(name: 'Viagens'),
      Category(name: 'Empréstimos'),
      Category(name: 'Saque'),
      Category(name: 'Deposito'),
      Category(name: 'Carro'),
      Category(name: 'Moto'),
      Category(name: 'Beleza'),
      Category(name: 'Saúde')
    ];
  }

  @override
  Future<List<Category>> fetchListWithError() async {
    await Future.delayed(const Duration(seconds: 4));
    throw Exception("Não foi possível carregar a lista!");
  }
}
