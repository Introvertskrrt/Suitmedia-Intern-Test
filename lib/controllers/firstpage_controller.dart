import 'package:get/get.dart';

class FirstPageController extends GetxController{
  RxString name = ''.obs;
  RxString palindrome = ''.obs;
  bool isVerified = false; // if palindrome is correct, then user is verified

  void isPalindrome() {
    bool isPalindrome = isPalindromeFunction(palindrome.value);
    isVerified = isPalindrome;

    Get.defaultDialog(
      title: isPalindrome ? 'Palindrome!' : 'Not Palindrome!',
      middleText: isPalindrome
          ? 'Palindrome: ${palindrome.value}\nCorrect! It is a palindrome!'
          : 'Palindrome: ${palindrome.value}\nIncorrect! It is not a palindrome.',
    );
  }

  bool isPalindromeFunction(String input) {
    String cleanedInput = input.replaceAll(' ', '').toLowerCase();
    return cleanedInput == cleanedInput.split('').reversed.join('');
  }
  
}