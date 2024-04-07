enum OrderSizeEnum {
  small,
  medium,
  large,
}

extension OrderSizeEnumEx on OrderSizeEnum {
  String get title {
    switch (this) {
      case OrderSizeEnum.small:
        return 'S';
      case OrderSizeEnum.medium:
        return 'M';
      case OrderSizeEnum.large:
        return 'L';
    }
  }

  String get priceText {
    switch (this) {
      case OrderSizeEnum.small:
        return '0đ';
      case OrderSizeEnum.medium:
        return "+5.000đ";
      case OrderSizeEnum.large:
        return "+10.000đ";
    }
  }
}

enum OrderSideEnum {
  cookie,
  cake,
}

extension OrderSideEnumEx on OrderSideEnum {
  String get title {
    switch (this) {
      case OrderSideEnum.cookie:
        return 'Bánh quy';
      case OrderSideEnum.cake:
        return 'Bánh Bông Lan Trứng Muối';
    }
  }

  String get priceText {
    switch (this) {
      case OrderSideEnum.cookie:
        return '+26.0000đ';
      case OrderSideEnum.cake:
        return '+26.0000đ';
    }
  }
}
