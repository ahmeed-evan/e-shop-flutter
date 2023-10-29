
class WishlistItem {
  final dynamic id;
  final dynamic name;

  @override
  String toString() {
    return 'WishlistItem{id: $id, name: $name, status: $status, price: $price, image: $image}';
  }

  final dynamic status;
  final dynamic price;
  final dynamic image;

  WishlistItem(
      {required this.name,
      required this.id,
      required this.price,
      required this.status,
      required this.image});

}
