namespace com.satinfotech.Project2DB;
using { managed, cuid} from '@sap/cds/Common';

entity MasterData: managed, cuid {
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
    pincode: String(6) @mandatory;
    @title: 'GSTIN Number'
    gstinno: String(13);
    @title: 'IS_Vendor'
    is_vendor : Boolean default false;
    @title: 'IS_Coustomer'
    is_customer : Boolean default false;
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
    storeid : String(10);
    @title: 'Name'
    name : String(20);
    @title: 'Address1'
    address1: String(20);
    @title: 'Address2'
    address2: String(20);
    @title: 'City'
    city: String(50) @mandatory;
    @title : 'State'
    state: String(15) @mandatory;
    @title: 'PINCode'
    pincode: String(15) @mandatory;
}
entity Product: managed,cuid {
    @title: 'Product ID'
    productid : String(20);
    @title: 'ProductName'
    productName: String(20);
    @title: 'Product Image URL'
    productimageurl: String(100);
    @title: 'Product Cost Price'
    productcostprice: Decimal(10,2);
    @title: 'Product Sell Price'
    productsellprice: Decimal(10,2);
}
entity StockData : cuid, managed {
    @title:'Store id'
     store  : Association to Store;
     @title:'Product id'
  product : Association to Product;
  @title:'stock qty'
  stockQty : Integer;
}

