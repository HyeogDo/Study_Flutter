main() {
  List threeKingdoms = [];
  
  // 추가하기
  threeKingdoms.add("위");
  threeKingdoms.add("촉");
  threeKingdoms.add("오");

  print(threeKingdoms);
  print(threeKingdoms[0]);

  // 수정하기
  threeKingdoms[0] = "We";

  print(threeKingdoms[0]);

  // 삭제하기
  threeKingdoms.removeAt(1);
  print(threeKingdoms);

  threeKingdoms.remove("We");
  print(threeKingdoms);

  print(threeKingdoms.length);

  threeKingdoms.add(1);
  print(threeKingdoms);

  List<String> threeKingdoms2 = [];

  // ---
  
  // Map : Key와 Value로 이루어진 Collection
  Map fruits = {
    "apple" : "사과",
    "grape" : "포도",
    "watermelon" : "수박",
  };

  print(fruits["apple"]);
  fruits["watermelon"] = "시원한 수박";
  
  fruits["banana"] = "바나나";
  print(fruits);

  Map<String, int> fruitsPrice = {
    "apple" : 1000,
    "grape" : 2000,
    "watermelon" : 3000,
  };

  print(fruitsPrice["apple"]);
  // optional 변수 -> NULL값이 들어갈 수 있는 변수
  // (마지막에 !추가해줘야 다른 곳에 넣을 수 있음)
  // 선언 시에는 ?를 붙힘
  int applePrice = fruitsPrice["apple"]!;
  int numA = 10;
  int? numB = 100;
  numB = null;

}