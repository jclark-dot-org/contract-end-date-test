@IsTest
public class ContractTest {

  @IsTest
  static void testCreateContractWithExplicitEndDate() {
    Contract c = new Contract(
      StartDate = Date.today(),
      EndDate = Date.today().addDays(365)
    );
    insert c;
  }

}