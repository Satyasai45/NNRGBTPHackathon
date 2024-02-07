using {com.satinfotech.Project2DB as db} from '../db/schema';

service Project2DB {
    entity MaterData as projection on db.MaterData;
    entity State as projection on db.State;
    entity Store as projection on db.Store;
}
annotate Project2DB.MaterData @odata.draft.enabled;
annotate Project2DB.Store @odata.draft.enabled;
annotate Project2DB.MaterData with {
    gstinno  @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z][1-9A-Z]{1}Z[0-9A-Z]{1}$';
    pincode @assert.format: '^(\d{4}|^\d{6})$';    
}
annotate Project2DB.MaterData with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bpn
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Label : 'Gender',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
        {
            $Type : 'UI.DataField',
            Value : gstinno
        },
        {
            $Type : 'UI.DataField',
            Value : is_vendor
        },
        {
            $Type : 'UI.DataField',
            Value : is_customer
        },
       
    ],

    UI.SelectionFields: [name, adress1, address2]       
);
annotate Project2DB.Store with @ (
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : storeid
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
    ],
);