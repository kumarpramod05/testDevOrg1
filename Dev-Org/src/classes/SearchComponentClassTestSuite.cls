@isTest
private class SearchComponentClassTestSuite {

    static testMethod void runPositiveTestCases() 
    {
        SearchComponentClass ClsObj = new SearchComponentClass();
        ClsObj.SelectedType = 'ApexClass';
        ClsObj.toSearch();
        ClsObj.SelectedType = 'ApexPage';
        ClsObj.toSearch();
        ClsObj.SelectedType = 'ApexComponent';
        ClsObj.toSearch();
    }

}