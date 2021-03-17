({
    init: function (cmp, event, helper) 
    {
        
        cmp.set('v.columns', [
            {label: 'Case Number', fieldName: 'CaseNumber', type: 'Auto Number'},
            {label: 'Subject', fieldName: 'Subject', type: 'text'},
            {label: 'Status', fieldName: 'Status', type: 'Picklist'},
            {label: 'Date/Time Opened', fieldName: 'CreatedDate', type: 'Date/Time'},
            {label: 'Case Owner', fieldName: 'OwnerId', type: 'Lookup(User,Group)'}  ]);
            helper.getData(cmp);
            }
})