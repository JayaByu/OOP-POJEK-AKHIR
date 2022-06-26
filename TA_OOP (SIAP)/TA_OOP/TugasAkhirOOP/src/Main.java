// Aldi Dwi Purnomo – 2440065346
// Jayawardhana Bayu Krisnatama EkaPutra – 2440100632
// Yohanes Ricky Kurniawan – 2440056480
// Ernes Gideon Geonanda Senong – 2440080012

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;
import java.util.Vector;


import Model.Beverage;
import Model.Customer;
import Model.Snack;
import Model.Transaction;
import SQL.InsertSQLDATA;
import SQL.LoadSQLDATA;
import SQL.UpdateSQLDATA;


public class Main {
	Scanner sc = new Scanner(System.in);
	LoadSQLDATA load = new LoadSQLDATA();
	InsertSQLDATA insert = new InsertSQLDATA();
	UpdateSQLDATA update = new UpdateSQLDATA();
	Vector<Customer> c= new Vector<>();
	Random ran = new Random ();
	public Main() {
		// TODO Auto-generated constructor stub
		
		int input = -1;
		boolean isRun = true;
		
		do {
			do {
				System.out.println("Rabe Caffee");
				System.out.println("=============");
				System.out.println("1. Create Customer");
				System.out.println("2. Order Menu");
				System.out.println("3. View Order");
				System.out.println("4. Make an Order");
				System.out.println("5. Exit");
				System.out.print("Choose : ");
				try {
					input = sc.nextInt();
				} catch (Exception e) {
					// TODO: handle exception
					input = -1;
				}
				sc.nextLine();
			} while (input < 1 || input > 5);
			
			switch (input) {
			case 1:
				createCustomer();
				System.out.println("\n\nClick Enter to Continue!");
				sc.nextLine();
				clear();
				break;
			case 2:
				createOrder();
				System.out.println("\n\nClick Enter to Continue!");
				sc.nextLine();
				clear();
				break;
			case 3:
				viewOrder();
				System.out.println("\n\nClick Enter to Continue!");
				sc.nextLine();
				clear();
				break;
			case 4:
				deleteOrder();
				System.out.println("\n\nClick Enter to Continue!");
				sc.nextLine();
				clear();
				break;
			case 5:
				isRun = !isRun;
				break;
			}
		} while (isRun);
	}
	
	public void clear() {
		for (int i = 0; i < 30; i++) {
			System.out.println();
		}
	}
	private void viewCustomer() {
		ArrayList<Customer> c = load.getAllCustomers();
		System.out.println("Customer ID\t| Customer Name | Customer Phone|");
		System.out.println("=================================================");
		for(int i=0; i< c.size();i++) {
			System.out.println(c.get(i).getCustomerID()+"\t\t| "+c.get(i).getCustomerName()+"\t| "
					+ c.get(i).getCustomerPhone()+"\t|");
		}
		
	}
	private void createCustomer() {
		// TODO Auto-generated method stub
		String nama;
		String phone;
		//CUSTOMER IDENTITAS
		viewCustomer();
		
		do {
			System.out.print("Input customer name [Must more than 2 character]: ");
			nama = sc.nextLine();
		} while (nama.length() < 2);
				
		do {
			System.out.println("Input customer phone [Must 12 character]: ");
			phone = sc.nextLine();
		} while (phone.length() < 12||phone.length()>12);
				
		String customerID= "C"+ran.nextInt(10)+ran.nextInt(10)+ran.nextInt(10)+ran.nextInt(10);
		System.out.println(customerID+" "+nama+" "+phone);
		System.out.println("Successfully Create Customer");
				
		insert.insertCustomer(customerID, nama, phone);
	}
	
	private void createOrder() {
		// TODO Auto-generated method stub
		//NULL NYA BELOM BISA SAYString pilihanMakan;
		int quantity,priceSnack = 0, priceBeverage=0;
		String customerID="";
		boolean uji = true, uji1=true,cari=true;
		
		String pilihanMakan;
		String pilihanMinum;
		ArrayList<Transaction> tr = load.getAllMenues();
		ArrayList<Customer> c = load.getAllCustomers();
		//pilih ID Pelanggan
		viewCustomer();
		do {
			
			System.out.print("Input Customer ID: ");
			customerID= sc.nextLine();
			for(int i=0; i< c.size();i++) {
				if(customerID.equals(c.get(i).getCustomerID())){
					cari=!cari;
				}
			}
			
			if(cari==true) System.out.println("Your input Customer ID is not Available");
		} while (cari==true);
		System.out.println("Customer ID is Found");
		sc.nextLine();
		clear();
		
		//pilih makan
		viewMenuSnack();
		do {
			System.out.print("Input Snack ID : ");
			pilihanMakan = sc.nextLine();
			
			
			for (int i = 0; i < tr.size(); i++) {
				if (tr.get(i) instanceof Snack) {
					if (pilihanMakan.equals(tr.get(i).getSnackID())) {
						priceSnack= ((Snack) tr.get(i)).getSnackPrice();
						uji=false;
					}
				}
			}
			if (uji==true) System.out.println("Your input Snack ID is not available");
			
		} while (uji==true);
		
		//pilih minum
		System.out.println("\n\n");
		viewMenuBeverage();
		do {
			System.out.print("Input Beverage ID : ");
			pilihanMinum = sc.nextLine();
			for (int i = 0; i < tr.size(); i++) {
				if (tr.get(i) instanceof Beverage) {
					if (pilihanMinum.equals(tr.get(i).getBeverageID())) {
						priceBeverage = ((Beverage) tr.get(i)).getBeveragePrice();
						uji1=!uji1;
					}
				}
				
			}
			if (uji1==true) System.out.println("Your input Beverage ID is not available");
			
		} while (uji1==true);
		
		System.out.println("\n\n");
		do {
			System.out.print("Input quantity : ");
			try {
				quantity = sc.nextInt();
			} catch (Exception e) {
				// TODO: handle exception
				quantity = -1;
			}
			sc.nextLine();
		} while (quantity < 0);
		
		
		//Transaction
		int totalBayar = (priceBeverage+priceSnack)*quantity;
		
		
		
		
		insert.InsertTransaction("T"+ran.nextInt(10)+ran.nextInt(10)+ran.nextInt(10)+ran.nextInt(10), 
				pilihanMinum, pilihanMakan, customerID, quantity, totalBayar);
		System.out.println("Successfully create order");
	}

	private void viewMenuBeverage() {
		ArrayList<Transaction> tr = load.getAllMenues();
		System.out.println("Menu ID | Menu Name\t| Price\t|");
		System.out.println("=================================");
		for(int i=0; i< tr.size();i++) {
			if(tr.get(i) instanceof Beverage) {
				System.out.println(tr.get(i).getBeverageID()+"\t| "+((Beverage) tr.get(i)).getBeverageName()+"\t| "+((Beverage) tr.get(i)).getBeveragePrice()+"\t|");
			}
		}// TODO Auto-generated method stub
		
	}
	
	private void viewMenuSnack() {
		ArrayList<Transaction> tr = load.getAllMenues();
		System.out.println("Menu ID | Menu Name\t| Price\t|");
		System.out.println("=================================");
		for(int i=0; i<tr.size();i++) {
			if (tr.get(i) instanceof Snack) {
				System.out.println(tr.get(i).getSnackID()+"\t| "+((Snack) tr.get(i)).getSnackName()+"\t| "+((Snack) tr.get(i)).getSnackPrice()+"\t|");
			}
		}
	}

	private void deleteOrder() {
		// TODO Auto-generated method stub
		//insert.insertCustomer(c);
		ArrayList<Transaction> tr = load.getAllTransaction();
		boolean uji= true;
		String id;
		viewOrder();
		System.out.println("\n\n");
		System.out.print("Input the finished Transaction ID: ");
		id= sc.nextLine();
		
		for(int i=0; i< tr.size();i++) {
			if (id.equals(tr.get(i).getTransactionID())) {
				uji=!uji;
				update.Delete(id);
				System.out.println("The Order have served");
			}
		}
		if(uji==true) System.out.println("Your input Transaction ID is not found!");
	}


	private void viewOrder() {
		// TODO Auto-generated method stub
		ArrayList<Transaction> tr = load.getAllTransaction();
		ArrayList<Transaction> t = load.getAllMenues();
		System.out.println("Transaction ID\t| Customer Name | Snack Name\t| "
				+ "Snack Price\t| Beverage Name\t| Beverage Price\t| Quantity\t| Total Pembayaran |");
		System.out.println("============================================================"
				+ "================================================================================");
		for(int i=0; i< tr.size();i++) {
			System.out.print(tr.get(i).getTransactionID()+"\t\t| "
					+ tr.get(i).getCustomerName()+"\t| "
					+ ((Snack) tr.get(i)).getSnackName()+"\t| "
					+ ((Snack) tr.get(i)).getSnackPrice()+"\t\t| ");
			for(int j=0; j<t.size();j++) {
				
					if (t.get(j).getBeverageID().equals(tr.get(i).getBeverageID())) {
						System.out.print(((Beverage) t.get(j)).getBeverageName()+"\t| "
								+ ((Beverage) t.get(j)).getBeveragePrice()+"\t\t\t| ");
					}
			}
			System.out.println(tr.get(i).getQuantity()+"\t\t| "+tr.get(i).getTotalpembayaran()+"\t\t   |");
		}
	}
	


	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
	}

}
