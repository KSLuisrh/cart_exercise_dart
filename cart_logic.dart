class Cart {
  int minShipping = 500;
  List cart = [];

  get cartTotal {
    return cart;
  }

  addItemInCart(product) {
    if (validateItemInCart(product)) {
      changeQtyItemInCart(product["id"]);
    } else {
      insertItemInCart(product);
    }
  }

  insertItemInCart(product) {
    cart.add(product);
    print('New product added: $product');
  }

  changeQtyItemInCart(productId) {
    var indexCart = cart.indexWhere((cart) => cart["id"] == productId);
    cart[indexCart]["qty"] = cart[indexCart]["qty"] + 1;
  }

  bool validateItemInCart(product) {
    var indexCart = cart.indexWhere((p) => p["id"] == product["id"]);
    return (indexCart != -1) ? true : false;
  }

  bool validateShippingFree() {
    var totalprice = getTotalPriceInCart();
    if (totalprice >= minShipping) {
      print("Free shipping.");
      return true;
    } else {
      print("Shipping not avalible");
      return false;
    }
  }

  getTotalQty() {
    num totalQtyIncart = 0;
    for (var item in cart) {
      totalQtyIncart += item["qty"];
    }
    print("Total cart items $totalQtyIncart");
    return totalQtyIncart;
  }

  getTotalPriceInCart() {
    num totalPrice = 0;
    for (var item in cart) {
      totalPrice += item["qty"] * item["price"];
    }
    print("Total price is: $totalPrice");
    return totalPrice;
  }

  deleteItemInCart(product) {
    var indexCart = cart.indexWhere((p) => p["id"] == product["id"]);
    var productName = cart[indexCart]["name"];
    if (indexCart != -1) {
      if (cart[indexCart]["qty"] > 1) {
        cart[indexCart]["qty"]--;
        print('Item removed: $productName ');
      } else {
        cart.removeAt(indexCart);
        print("Cart empty");
      }
    } else {
      print("Product not Found");
    }
  }
}

void main() {
  cartFunctions();
}

cartFunctions() {
  List products = [
    {
      "id": 1,
      "name": "Mango",
      "price": 200.00,
      "qty": 1,
    },
    {
      "id": 2,
      "name": "Oranges",
      "price": 200.00,
      "qty": 1,
    },
    {
      "id": 3,
      "name": "Bananas",
      "price": 200.00,
      "qty": 1,
    },
    {
      "id": 4,
      "name": "Peach",
      "price": 200.00,
      "qty": 1,
    },
    {
      "id": 5,
      "name": "Kiwi",
      "price": 200.00,
      "qty": 1,
    }
  ];

  Cart cartInstance = Cart();

  cartInstance.addItemInCart(products[1]);
  cartInstance.addItemInCart(products[1]);
  cartInstance.addItemInCart(products[3]);
  cartInstance.getTotalQty();
  cartInstance.validateShippingFree();
  cartInstance.getTotalPriceInCart();
  cartInstance.addItemInCart(products[2]);
  cartInstance.getTotalQty();
  cartInstance.validateShippingFree();

  print("Cart: ${cartInstance.cartTotal}");
}
