class Products{
  final image1;
  final image2;
  final image3;
  final name;
  final price;
  bool favourite;
  Products({this.image1,this.image2,this.image3,this.name,this.price,this.favourite});
}

List<Products> products = [womenSaree, menSuits, jewellery];
List<Products> favouriteList = [];


Products womenSaree = Products(
  image1: 'images/foryou_screen/women.png',
  image2: 'images/foryou_screen/women2.png',
  image3: 'images/foryou_screen/women3.png',
  name: 'Abhisarike Drishya Kurtis',
  price: '\$ 499',
  favourite: false,
);

Products menSuits = Products(
  image1: 'images/foryou_screen/men_suits.png',
  image2: 'images/foryou_screen/men_suits.png',
  image3: 'images/foryou_screen/men_suits.png',
  name: 'Aagam Fablous Sarees',
  price: '\$ 599',
  favourite: false,
);

Products jewellery = Products(
  image1: 'images/foryou_screen/jewellary.png',
  image2: 'images/foryou_screen/jewellary.png',
  image3: 'images/foryou_screen/jewellary.png',
  name: 'Branded Jewellery For You',
  price: '\$ 1099',
  favourite: false,
);

void addFavouriteListProduct(Products products){
  try{
    favouriteList.add(products);
  }catch(e){
    e.toString();
  }
}

void removeFavouriteListProduct(Products products){
  favouriteList.remove(products);
}