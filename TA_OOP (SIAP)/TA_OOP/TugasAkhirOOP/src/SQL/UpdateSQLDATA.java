package SQL;

public class UpdateSQLDATA {
	Connect con = Connect.getConnection();
	
	public void Delete(String id) {
		String queryDelete = String.format("DELETE FROM transactionmenu WHERE TransactionID = '%s'",id);
		con.executeUpdate(queryDelete);
	}

}
