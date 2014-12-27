public with sharing class sampleCon {

    public List<SelectOption> getItems(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('US', 'United State'));
        options.add(new SelectOption('Ind', 'India'));
        options.add(new SelectOption('Pak','Pakisthan'));
        return options;
    }

    String[] countries = new String[]{};
    
    public String item {get; set;}

    public PageReference test() {
        return null;
    }
    
        public String[] getCountries() {
        return countries;
    }

    public void setCountries(String[] countries) {
        this.countries = countries;
    }
}