public class ShowHideHTMLControler {  
  
    //Public Properties  
    public Boolean showContent { get; set; }  
    
    public String test { get; set; }  
  
    //Constructor  
    public ShowHideHTMLControler() {  
        //Set the showContent variable to true on page load  
        showContent = true;  
    }  
  
    //Method called when the Toggle Content button is clicked  
    public PageReference toggleContent() {  
        //If the showContent variable is true, set it to false, else, set it to true  
        if(showContent){  
            showContent = false;  
        }  
        else{  
            showContent = true;  
        }  
        return null;  
    }  
}