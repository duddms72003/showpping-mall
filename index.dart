import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  List<Map<String, dynamic>> cart = [];

  void showProducts() {
    print('판매하는 상품 목록:');
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart() {
    stdout.write('장바구니에 담을 상품 이름: ');
    String productName = stdin.readLineSync()!;

    stdout.write('수량: ');
    String quantityString = stdin.readLineSync()!;

    try {
      int quantity = int.parse(quantityString);

      if (quantity <= 0) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요!');
      } else {
        bool isProductExist =
            products.map((product) => product.name).contains(productName);

        if (!isProductExist) {
          print('입력한 상품이 존재하지 않습니다.');
        } else {
          cart.add({'name': productName, 'quantity': quantity});
          print('장바구니에 상품이 담겼어요!');
        }
      }
    } catch (e) {
      print('입력값이 올바르지 않아요!');
    }
  }

  void showCart() {
    print('장바구니 목록:');
    num total = 0;
    for (var item in cart) {
      Product product = products.firstWhere((p) => p.name == item['name']);
      print('${item['name']} ${item['quantity']}개 (${product.price}원/개)');
      total += item['quantity'] * product.price;
    }
    print('총 가격: ${total}원 어치를 담으셨네요 !');
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();

  while (true) {
    print(
        '-------------------------------------------------------------------------------------');
    stdout.write(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 종료\n');
    print(
        '-------------------------------------------------------------------------------------');
    stdout.write('원하는 메뉴를 선택하세요: ');
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        mall.addToCart();
        break;
      case '3':
        mall.showCart();
        break;
      case '4':
        print('프로그램을 종료합니다.');
        return;
      default:
        print('잘못된 메뉴를 선택하셨습니다.');
    }
  }
}
