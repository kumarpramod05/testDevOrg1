public class AsyncExecutionExample2 implements Queueable {
    public ID accountId = '';
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme',Phone='(415) 555-1212');
        insert a;    
        accountId = a.id;    
        system.debug('*************** AsyncExecutionExample2  = ' + context.getJobId());
    }
}