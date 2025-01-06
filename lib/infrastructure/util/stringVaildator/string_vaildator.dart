extension StringValidators on String {
  bool get containsUppercase => contains(RegExp(r'[A-Z]'));
  bool get containsLowercase => contains(RegExp(r'[a-z]'));
  bool get containsNumericValue => contains(RegExp(r'[0-9]'));
  // bool get containsSpecialSymbol => contains(RegExp(r"/\W|_/g"));
  bool get containsSpecialSymbol =>
      contains(RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' "'" ']'));
  bool get verifyCreditCardNumber =>
      contains(RegExp(r'''^(?:4[0-9]{12}(?:[0-9]{3})?          # Visa\n |  
              (?:5[1-5][0-9]{2}                # MasterCard\n     |  
              222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}\n |  
              3[47][0-9]{13}                   # American Express\n |  
              3(?:0[0-5]|[68][0-9])[0-9]{11}   # Diners Club\n |  
              6(?:011|5[0-9]{2})[0-9]{12}      # Discover\n |  
              (?:2131|1800|35\d{3})\d{11}      # JCB\n
            )$
      '''));
}

class StringVaildator {
  static bool isNumeric({required String value}) {
    return int.tryParse(value) != null;
  }

  static bool doesPasswordMatch({required String password, required String confirmPassword}){
    return password == confirmPassword;
  }

  static bool phoneNumberValidator({required String phoneNumber}) {
    return RegExp(
            r"^\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$")
        .hasMatch(phoneNumber);
  }

  static bool emailAddressValidator({required String emailAddress}) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailAddress);
  }

  static bool passwordValidator({required String password}) {
    return RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10,}$")
        .hasMatch(password);
  }

  static bool doesValueHaveSpaceInBetween({required String value}) {
    return value.contains(' ');
  }

  static bool isValueAValidCreditCardNumber({required String value}) {
    return (RegExp(r'''^(?:4[0-9]{12}(?:[0-9]{3})?          # Visa\n |  
              (?:5[1-5][0-9]{2}                # MasterCard\n     |  
              222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}\n |  
              3[47][0-9]{13}                   # American Express\n |  
              3(?:0[0-5]|[68][0-9])[0-9]{11}   # Diners Club\n |  
              6(?:011|5[0-9]{2})[0-9]{12}      # Discover\n |  
              (?:2131|1800|35\d{3})\d{11}      # JCB\n
            )$
      ''')).hasMatch(value);
  }

  static String formatCreditCardNumber({
    required String creditCardNumber,
    required String formerGivenCreditCardNumber,
  }) {
    // creditCardNumber = creditCardNumber.replaceAll(' ', '');
    int maxCreditCardNumberLength = 24;
    int givenCreditCardNumberLength = creditCardNumber.length;

    String formattedCreditCardNumber = '';

    List tempFormat = [];

    if (givenCreditCardNumberLength <= maxCreditCardNumberLength) {
      for (int i = 0; i < givenCreditCardNumberLength; i++) {
        if (isNumeric(value: creditCardNumber[i]) ||
            creditCardNumber[i].contains(' ')) {
          if (((i + 1) % 5 == 0) &&
              (givenCreditCardNumberLength != maxCreditCardNumberLength) &&
              (((givenCreditCardNumberLength - 1) + 1) % 5 == 0)) {
            if (i ==
                creditCardNumber.lastIndexOf(creditCardNumber.split('').last)) {
              tempFormat.add(' ');
            }
            if ((i !=
                    creditCardNumber
                        .lastIndexOf(creditCardNumber.split('').last)) &&
                (formerGivenCreditCardNumber.length >
                    givenCreditCardNumberLength)) {
              tempFormat.add(' ');
            }
            // debugPrint('added for divisible 0 $givenCreditCardNumberLength');
            if ((creditCardNumber.replaceAll(' ', '').length - 1) % 4 == 0) {
              tempFormat.add(creditCardNumber[i]);
            }
          } else {
            tempFormat.add(creditCardNumber[i]);
          }
        }
      }
    }
    formattedCreditCardNumber = tempFormat.join();
    return formattedCreditCardNumber;
  }

  static String formatCardExpiryDate(
      {required String expiryDate, required String formerExpiryCardDate}) {
    // expiryDate = expiryDate.replaceAll('/', '');
    int maxExpiryDateLength = 5;
    int givenExpiryDateLength = expiryDate.length;

    String formattedExpiryDate = '';

    List tempFormat = [];

    if (givenExpiryDateLength <= maxExpiryDateLength) {
      for (int i = 0; i < givenExpiryDateLength; i++) {
        if (isNumeric(value: expiryDate[i]) || expiryDate[i].contains('/')) {
          if ((i + 1) % 3 == 0 &&
              (givenExpiryDateLength != maxExpiryDateLength) &&
              (((givenExpiryDateLength - 1) + 1) % 3 == 0)) {
            // tempFormat.add('/');
            // tempFormat.add(expiryDate[i]);
            if (i == expiryDate.lastIndexOf(expiryDate.split('').last) &&
                !tempFormat.contains('/')) {
              tempFormat.add('/');
            }
            if ((i != expiryDate.lastIndexOf(expiryDate.split('').last)) &&
                (formerExpiryCardDate.length > givenExpiryDateLength)) {
              tempFormat.add('/');
            }
            if ((expiryDate.replaceAll('/', '').length - 1) % 2 == 0) {
              tempFormat.add(expiryDate[i]);
            }
          } else {
            tempFormat.add(expiryDate[i]);
          }
        }
      }
    }
    formattedExpiryDate = tempFormat.join();
    return formattedExpiryDate;
  }

  static bool isCreditCardNumberValid({required String creditCardNumber}) {
    var visaRegEx = RegExp(r"^(?:4[0-9]{12}(?:[0-9]{3})?)$");
    var mastercardRegEx = RegExp(r"^(?:5[1-5][0-9]{14})$");
    var amexpRegEx = RegExp(r"^(?:3[47][0-9]{13})$");
    var discovRegEx = RegExp(r"^(?:6(?:011|5[0-9][0-9])[0-9]{12})$");

    bool isValid = false;

    if (visaRegEx.hasMatch(creditCardNumber)) {
      isValid = true;
    } else if (mastercardRegEx.hasMatch(creditCardNumber)) {
      isValid = true;
    } else if (amexpRegEx.hasMatch(creditCardNumber)) {
      isValid = true;
    } else if (discovRegEx.hasMatch(creditCardNumber)) {
      isValid = true;
    } else {
      isValid = false;
    }
    return isValid;
  }

  // static bool creditCardDateValidationStatus({
  //   required String monthYear,
  // }) {
  //   bool isCardDateValid = false;
  //   int currentYear = DateTime.now().year;
  //   int currentMonth = DateTime.now().month;

  //   List<String> splittedMonthYear = monthYear.split('/');

  //   if (splittedMonthYear.length > 1) {
  //     String month = splittedMonthYear[0];
  //     month = month.length > 1
  //         ? month[0] == '0'
  //             ? month[1]
  //             : month
  //         : month;
  //     int parsedMonth = int.parse(month[0]);
  //     int parsedYear = int.parse('20${splittedMonthYear[1]}');
  //     if (parsedYear >= currentYear && parsedMonth >= currentMonth) {
  //       isCardDateValid = true;
  //     } else {
  //       isCardDateValid = false;
  //     }
  //   } else {
  //     isCardDateValid = false;
  //   }
  //   return isCardDateValid;
  // }

  static bool creditCardDateValidationStatus({
    required String monthYear,
  }) {
    bool isCardDateValid = false;
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;

    List<String> splittedMonthYear = monthYear.split('/');

    if (splittedMonthYear.length > 1) {
      String month = splittedMonthYear[0];
      month = month.length > 1
          ? month[0] == '0'
              ? month[1]
              : month
          : month;
      int parsedMonth = int.parse(month);
      int firstIndexParsedYear = int.parse(splittedMonthYear[1][0]);
      int currentYearFirstIndex = int.parse(currentYear.toString()[2]);
      int parsedYear = int.parse('20${splittedMonthYear[1]}');
      if ((parsedYear >= currentYear &&
          firstIndexParsedYear >= currentYearFirstIndex)) {
        isCardDateValid = true;
        if (parsedYear == currentYear) {
          isCardDateValid = (parsedMonth >= currentMonth && parsedMonth <= 12);
        } else {
          isCardDateValid = parsedMonth <= 12;
        }
      } else {
        isCardDateValid = false;
      }
    } else {
      isCardDateValid = false;
    }
    return isCardDateValid;
  }
}
