package Model;

public abstract class Transaction extends Customer{
	private String transactionID;
	private String snackID;
	private String beverageID;
	private int quantity;
	private int totalpembayaran;
	

	public Transaction(String customerID, String customerName, String customerPhone, String transactionID,
			String snackID, String beverageID, int quantity, int totalpembayaran) {
		super(customerID, customerName, customerPhone);
		this.transactionID = transactionID;
		this.snackID = snackID;
		this.beverageID = beverageID;
		this.quantity = quantity;
		this.totalpembayaran = totalpembayaran;
	}
	

	public String getTransactionID() {
		return transactionID;
	}


	public void setTransactionID(String transactionID) {
		this.transactionID = transactionID;
	}


	public String getSnackID() {
		return snackID;
	}


	public void setSnackID(String snackID) {
		this.snackID = snackID;
	}


	public String getBeverageID() {
		return beverageID;
	}


	public void setBeverageID(String beverageID) {
		this.beverageID = beverageID;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getTotalpembayaran() {
		return totalpembayaran;
	}


	public void setTotalpembayaran(int totalpembayaran) {
		this.totalpembayaran = totalpembayaran;
	}


	public abstract int totalPembayaran();
}
