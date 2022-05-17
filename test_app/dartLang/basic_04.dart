main() {
  int? num1 = null;
  print(num1);

  // null 값이면 뒤의 값을 넣는다
  num1 ??= 8;
  print(num1);

  // 삼항 연산자
  bool isPublic = true;
  var visibility = isPublic ? "public" : "private";
  print(visibility);

  int sum = 0;
  for (int i = 1; i <= 10; i++) {
    sum += i;
  }
  print(sum);

  List<int> numList = [1,2,5,6,8];
  for (int i in numList) {
    sum += i;
  }
}