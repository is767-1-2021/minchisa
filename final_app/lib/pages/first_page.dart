class ExpenseHistory extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<ExpenseHistory> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding (
              padding: EdgeInsets.all(20.0),
              child: Consumer<ExpenseFromModel>(
                builder: (context, form, child) {
                  return Text(
                    '${form.date} ${form.time} ${form.menu} ${form.cal}');
                },
              ),
            ),
            ElevatedButton (
              onPressed: () {
                Navigator.pushNamed(context, 'five/');
              },
              child: Text('Fill this form please'),
                style: TextButton.styleFrom(
                  primary: Colors.orangeAccent,
                  backgroundColor: Colors.green[900],
                  onSurface: Colors.black12,
                )),
          ],
        ),
      ),
    );
  }
}