package SQL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import Model.Beverage;
import Model.Customer;
import Model.Snack;
import Model.Transaction;


public class LoadSQLDATA {
	Connect con = Connect.getConnection();
	public ArrayList<Transaction> getAllMenues(){
		
		ArrayList<Transaction> temp = new ArrayList<>();
		
		//Data Snack di SQL
		String querySnack = String.format("SELECT SnackID, SnackName, "
				+ "SnackPrice FROM snack");
		ResultSet rsSnack= con.executeQuery(querySnack);
		try {
			while (rsSnack.next()) { //rsMage.next buat nunjuk row pertama.
				Snack snackTemp = new Snack("","","","",
						rsSnack.getString("SnackID"),"",0,0, rsSnack.getString("SnackName"), 
						rsSnack.getInt("SnackPrice"));
				temp.add(snackTemp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//Data Beverage dari SQL
		String queryBeverage = String.format("SELECT BeverageID, BeverageName, "
				+ "BeveragePrice FROM beverage");
		
		ResultSet rsBeverage = con.executeQuery(queryBeverage);
		
		try {
			while (rsBeverage.next()) {
				Beverage beverageTemp = new Beverage("","","","",
						"",rsBeverage.getString("BeverageID"),0,
						0, rsBeverage.getString("BeverageName"), 
						rsBeverage.getInt("BeveragePrice"));
				temp.add(beverageTemp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return temp;
		
	}
	
	public ArrayList<Customer> getAllCustomers() {
		ArrayList<Customer> temp = new ArrayList<>();
		String queryCustomer = String.format("SELECT CustomerID, CustomerName, "
				+ "CustomerPhone FROM customer");
		ResultSet rsCustomer= con.executeQuery(queryCustomer);
		
		try {
			while (rsCustomer.next()) {
				Beverage customerTemp = new Beverage(rsCustomer.getString("CustomerID"), rsCustomer.getString("CustomerName"), 
						rsCustomer.getString("CustomerPhone"),"","","",0, 0,"", 0);
				temp.add(customerTemp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return temp;
	}
	
	public ArrayList<Transaction> getAllTransaction() {
		ArrayList<Transaction> temp = new ArrayList<>();
		String queryTransaction = String.format("SELECT TransactionID, CustomerName,SnackName, "
				+ "SnackPrice, BeverageID, Quantity,TotalPembayaran FROM transactionmenu JOIN snack "
				+ "ON transactionmenu.SnackID= snack.SnackID "
				+ "JOIN customer ON transactionmenu.CustomerID=customer.CustomerID;");
		ResultSet rsTransaction= con.executeQuery(queryTransaction);
		
		try {
			while (rsTransaction.next()) {
				Snack transactionTemp = new Snack("", rsTransaction.getString("CustomerName"), 
						"",rsTransaction.getString("TransactionID"),"",
						rsTransaction.getString("BeverageID"),rsTransaction.getInt("Quantity"), rsTransaction.getInt("TotalPembayaran"), 
						rsTransaction.getString("SnackName"), rsTransaction.getInt("SnackPrice"));
				temp.add(transactionTemp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return temp;
	}


}
