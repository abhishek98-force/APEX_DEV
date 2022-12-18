public with sharing class LVDQueueFramework {
    private final Integer chunkSize =  4 ;
    List<Account> accList;
    private Id offSetId;  
    private static Integer chunksExecuted = 0 ;
    public LVDQueueFramework() {
         accList = getRecords(this.offsetId);
    }
    public LVDQueueFramework(Integer offsetId){
         if(offsetId != null){
            this.offsetId = offsetId;
         }
         accList = getRecords(this.offsetId);
    }
    public void execute(QueueableContext context) { 
        LVDQueueFramework.chunksExecuted += 1;
        Id lastProcessedId = accList[acclist.size()-1].Id;
        System.enqueueJob(new LVDQueueFramework(lastProcessedId));
    }

    private List<Account> getRecords(Id offsetId) {

        String queryString = '';
        queryString += 'Select id, name';
        queryString += 'From Account';
        if(offsetIdd != null){
            queryString += 'Where Id > :offsetId';
        }
        queryString += 'LIMIT :chunkSize';

        return Database.query(queryString);
    }
}

// System.enqueueJob(new LVDQueueFramework());
//
