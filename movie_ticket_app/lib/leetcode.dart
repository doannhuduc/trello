import 'dart:math';

// Bài 1 : Count the Digits That Divide a Number
// Cho một số nguyên num, trả về số chữ số trong num chia hết cho num.
// Một số nguyên val chia hết cho nums nếu nums % val == 0.

void main(List<String> args) {
  int num = 123658;
  print(countDigits(num));

  String s = "abcdegml";
  String t = "ackbdgelm";
  print(findTheDifference(s, t));

  String a = "nice to meet you";
  print(lengthOflastWord(a));
}

int countDigits(int num) {
// tạo biến "count" có kiểu dữ liệu int để đếm số chữ số trong "num" chia hết cho "num"
  int count = 0;

// chuyển số nguyên có kiểu dữ liệu int được cho ở đầu vào sang kiểu dữ liệu String
  String numString = num.toString();

// sử dụng vòng lặp for để duyệt qua từng phần tử trong "numString"

  for (int i = 0; i < numString.length; i++) {
// lấy giá trị số nguyên của từng phần tử trong biến "numString"

    int digits = int.parse(numString[i]);
    if (num % digits == 0) {
      count++;
    }
  }
  return count;
}

// Bài 2 : Find the Difference
// Bạn được cung cấp hai chuỗi svà t.
// Chuỗi t được tạo bằng cách xáo trộn chuỗi ngẫu nhiên s và sau đó thêm một chữ cái nữa vào một vị trí ngẫu nhiên.
// Trả lại chữ cái đã được thêm vào t.

String findTheDifference(String s, String t) {
  Map<String, int> count = {};

// Đếm số lượng xuất hiện của mỗi ký tự trong chuỗi s

  for (int i = 0; i < s.length; i++) {
    String char = s[i];
    count[char] = (count[char] ?? 0) + 1;
  }

// Trừ số lượng xuất hiện của mỗi ký tự trong chuỗi t

  for (int i = 0; i < t.length; i++) {
    String char = t[i];
    count[char] = (count[char] ?? 0) - 1;
    if (count[char] == -1) {
      return char;
    }
  }

// Trường hợp không có chữ cái bị thiếu, trả về chuỗi rỗng

  return '';
}

// Bài 3 : Length of Last Word
// Cho một chuỗi s bao gồm các từ và khoảng trắng, trả về độ dài của từ cuối cùng trong chuỗi.

int lengthOflastWord(String s) {
// xóa khoảng trắng ở đầu và cuối chuỗi s nếu có

  String newS = s.trim();

// tạo một danh sách "listNewS" để chứa các phần tử trong chuỗi newS được tách ra bằng khoảng trắng

  List<String> listNewS = newS.split(" ");

// Trả về độ dài của phần tử cuối cùng trong danh sách "listNewS"

  int lengthLastWord = listNewS[listNewS.length - 1].length;

  return lengthLastWord;
}
