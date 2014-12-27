Public Class SearchComponentClass{
    
    // Public Properties
    public String   SelectedType{get;set;}
    public String   toSearchItem{get;set;}
    public String   IditemFound{get;set;}
    
    // Main Method to search Item
    public void toSearch()
    {
        IditemFound = '';
        if(SelectedType == 'ApexClass')
        {   
            for(ApexClass AC : [Select id from ApexClass where Name =:toSearchItem])
            {
                IditemFound= AC.id;                
            }
        }
        else if(SelectedType == 'ApexPage')
        {
            for(ApexPage AP : [Select id from ApexPage where Name =:toSearchItem])
            {
                IditemFound= AP.id;                
            }
        }        
        else if(SelectedType == 'ApexComponent')
        {
            for(ApexComponent AComp : [Select id from ApexComponent where Name = :toSearchItem])
            {
                IditemFound= AComp .id;                
            }
        }        
    }
}