namespace com.satinfotech.Project2DB;
using { managed, cuid } from '@sap/cds/Common';

entity MaterData: managed, cuid {
    @title: 'Business partner Number'
    bpn:  String(5);
    @title: 'Name'
    name: String(20);
    @title : 'Address1'
    address1: String(30) @mandatory;
    @title: 'Address2'
    address2: String(30) @mandatory;
    @title: 'City'
    city: String(50) @mandatory;
    @title : 'State'
    state: String(15) @mandatory;
    @title: 'PINCode'
    pincode: String(15) @mandatory;
    @title: 'GSTIN Number'
    gstinno: String(20);
    @title: 'IS_Vendor'
    is_vendor : String(20);
    @title: 'IS_Coustomer'
    is_customer : String(12);
}
@cds.persistence.skip
entity State {
    @title: 'code'
    key code: String(20);
    @title: 'DESCRIPTION'
    description : String(10);
}
entity Store: managed,cuid {
    @title: 'Store ID'
    storeid : String(20);
    @title: 'Name'
    name : String(20);
    @title: 'Address1'
    address1: String(30);
    @title: 'Address2'
    address2: String(40);
    @title: 'City'
    city: String(50) @mandatory;
    @title : 'State'
    state: String(15) @mandatory;
    @title: 'PINCode'
    pincode: String(15) @mandatory;
}
