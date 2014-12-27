public class FileUploader 
{
    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<String> fileContentsLine {get;set;}
    
    public Pagereference ReadFile()
    {
        if(contentFile != null){
            nameFile=contentFile.toString();
            fileContentsLine  = nameFile.split(';');
            system.assert(false, fileContentsLine);
        }
        return null;
    } 
}