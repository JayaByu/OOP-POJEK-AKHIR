package Model;

public class Snack extends Transaction{
	private String snackName;
	private int snackPrice;
	
	

	public Snack(String customerID, String customerName, String customerPhone, String transactionID, String snackID,
			String beverageID, int quantity, int totalpembayaran, String snackName, int snackPrice) {
		super(customerID, customerName, customerPhone, transactionID, snackID, beverageID, quantity, totalpembayaran);
		this.snackName = snackName;
		this.snackPrice = snackPrice;
	}
	


	public String getSnackName() {
		return snackName;
	}



	public void setSnackName(String snackName) {
		this.snackName = snackName;
	}



	public int getSnackPrice() {
		return snackPrice;
	}



	public void setSnackPrice(int snackPrice) {
		this.snackPrice = snackPrice;
	}



	@Override
	public int totalPembayaran() {
		// TODO Auto-generated method stub
		return super.getQuantity()*snackPrice;
	}
	
	
	
	
}
