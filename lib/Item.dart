class Item{
    final String title; // 상품이름
    final int price;// 가격

    // 생성자 만들기
  Item(this.title, this.price);

}
//  아이템 리스트 만들기
final itemList = [
  Item("맥북에어" , 2000000),
  Item("맥북프로" , 3500000),
  Item("아이폰14프로" ,1550000),
  Item("아이폰14프로맥스",1900000),
  Item("아이맥" , 3000000),
];