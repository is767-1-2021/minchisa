import 'dart:math';

class Expense{

  String expenseId = '';
  String expenseName = "";
  double totalMoney  = 0;
  int expenseMoneyPerItem = 0;
  int totalItem = 0;
  int usereItemSelected = 0;
  int userBasedMoney = 0;

  Expense(Map data)
  {
    expenseId = data["expenseId"];
    expenseName = data["expenseName"];
    totalMoney = data['totalMoney'];
    expenseMoneyPerItem =  data["Money"];
    totalItem = data['totalItems'];
    usereItemSelected = data["userItemSelected"];
    userBasedMoney = data["userBasedMoney"];
  }

  Expense.fromEmpty(); 

  Map<String, dynamic> toJson() {
    return {
      "expenseId": this.expenseId,
      "expenceName": this.expenseName,   
      "totalMoney": this.totalMoney,  
      "expenseMoneyPerItem": this.expenseMoneyPerItem,
      "totalItem": this.totalItem,  
      "userItemSelected" : this.usereItemSelected,   
      "userBaseedItem": this.userBasedMoney 
    };
  }

  Expense.fromSavedJson(Map<String, dynamic> data) {
    expenseId = data["expenseId"];
    expenseName = data["expenseName"];
    totalMoney = data['totalMoney'];
    expenseMoneyPerItem =  data["expenseMoneyPerItem"];
    totalItem = data['totalItem'];
    usereItemSelected = data["userItemSelected"];
    userBasedMoney = data["userBasedMoney"];
    
  }

  static Future<void> saveExpenseForDate(DateTime dateTime, List<Expense> expenseList) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> expenseList = [];
    for(int i =0; i < drinkList.length; i ++)
    {
      Map<String, dynamic> json = expenseList[i].toJson();
      String newAddition = jsonEncode(Expense.fromSavedJson(json));
      expenseList.add(newAddition);
    }
    String dateTimeKey = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    await prefs.setStringList(dateTimeKey, expenseList);
  }

  static Future getSavedExpenseForDate(DateTime dateTime) async {
    String dateTimeKey = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    List<Expense> savedListForDate = [];
    final prefs = await SharedPreferences.getInstance();
    List<String> alreadySaved = prefs.getStringList('$dateTimeKey') ?? [];
    for(int i=0; i < alreadySaved.length; i++)
    {
      Map<String, dynamic> decodeList = jsonDecode(alreadySaved[i]);
      Expense drink = Expense.fromSavedJson(decodeList);
      savedListForDate.add(expense);
    }
    return savedListForDate;
  }
}



  
 
 

  

  
 
 

  