// Controller code for Help Sales Stage VisualForce Page Handler
public class clsHelpSalesStages{
// This is a public getter method and returns a list of Opportunity Sales Stages
// the method is called from the Visualforce page
public List<OpportunityStage> getSalesStages(){
// This is a SOQL query to retrieve a list of matching Opportunity Sales Stages
// The SELECT clause returns the fields: MasterLabel, IsClosed, IsWon, ForecastCategory,
// ForecastCategoryName, DefaultProbability, Description
// The WHERE clause (WHERE IsActive = true) filters the query so that only Active
// Opportunity Stages are returned
// The the ORDER BY clause (ORDER BY SortOrder ASC sorts the list of Opportunity Stages
// in ascending order using the SortOrder field
// the standard Sort Order
List<OpportunityStage> lstOppStage = [ SELECT MasterLabel,IsClosed,IsWon,ForecastCategory,ForecastCategoryName,DefaultProbability,Description FROM OpportunityStage WHERE IsActive = true ORDER BY SortOrder ASC ];
return lstOppStage;
}
// This is a test method - The test methods must provide at least 75% code coverage
// test methods are required to deploy Apex to a production environment

}