package SQL;



public class InsertSQLDATA {
	Connect con = Connect.getConnection();
	public void InsertTransaction(String TransactionID, String BeverageID, String SnackID, String CustomerID, int Quantity, int TotalPembayaran) {
		String insertTransaction= String.format("INSERT INTO transactionmenu VALUES "
				+ "('%s','%s','%s','%s',%d,%d)", TransactionID,BeverageID, SnackID, CustomerID, Quantity,TotalPembayaran);
		
		con.executeUpdate(insertTransaction);
		
	}
	
	public void insertCustomer(String customerID, String customerName, String customerPhone) {
		String insertCustomer= String.format("INSERT INTO customer VALUES "
				+ "('%s','%s','%s')", customerID,customerName,customerPhone);
		
		con.executeUpdate(insertCustomer);
		
	}

}
