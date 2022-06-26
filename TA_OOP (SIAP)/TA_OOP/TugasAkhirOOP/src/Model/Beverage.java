package Model;

public class Beverage extends Transaction{
	private String beverageName;
	private int beveragePrice;
	
	

	

	public Beverage(String customerID, String customerName, String customerPhone, String transactionID, String snackID,
			String beverageID, int quantity, int totalpembayaran, String beverageName, int beveragePrice) {
		super(customerID, customerName, customerPhone, transactionID, snackID, beverageID, quantity, totalpembayaran);
		this.beverageName = beverageName;
		this.beveragePrice = beveragePrice;
	}
	public String getBeverageName() {
		return beverageName;
	}
	public void setBeverageName(String beverageName) {
		this.beverageName = beverageName;
	}
	public int getBeveragePrice() {
		return beveragePrice;
	}
	public void setBeveragePrice(int beveragePrice) {
		this.beveragePrice = beveragePrice;
	}



	@Override
	public int totalPembayaran() {
		// TODO Auto-generated method stub
		return super.getQuantity()*beveragePrice;
	}
	
}
