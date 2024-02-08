using {com.satinfotech.Project2DB as db} from '../db/schema';

service Project2DB {
    entity MasterData as projection on db.MasterData;
    entity State as projection on db.State;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;
    entity StockData as projection on db.StockData;

}
annotate Project2DB.MasterData @odata.draft.enabled;
annotate Project2DB.Store @odata.draft.enabled;
annotate Project2DB.Product @odata.draft.enabled;
annotate Project2DB.StockData with @odata.draft.enabled;

annotate Project2DB.MasterData with {
    gstinno  @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z][1-9A-Z]{1}Z[0-9A-Z]{1}$';
    pincode @assert.format: '^(\d{4}|^\d{6})$';  
    productimageurl @assert.formt: '^(jpeg|jpg|gif|png)$';  
}
annotate Project2DB.MasterData with @(
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

    UI.SelectionFields: [name, address1, address2]       
);
annotate Project2DB.MasterData with @(
    UI.FieldGroup #MasterDataInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type:'UI.DataField',
            Value:bpn,
        },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : address1,
            },
            {
                $Type : 'UI.DataField',
                Value : address2,
            },
            {
                $Type : 'UI.DataField',
                Value : pincode,
            },
            {
            $Type:'UI.DataField',
            Label:'state',
            Value:state
        },
        ]
    },
  UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'MasterDtaInfoFacet',
            Label : 'Mater Data Information',
            Target : '@UI.FieldGroup#MasterDataInformation',
        },
  ]
);
annotate Project2DB.Store with @(
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value:storeid
        },
        {
            $Type:'UI.DataField',
            Value:name
        },
        {
            $Type:'UI.DataField',
            Value:address1
        },
        {
            $Type:'UI.DataField',
            Value:address2
        },
        {
            $Type:'UI.DataField',
            Value:pincode
        },
        {
            $Type:'UI.DataField',
            Label:'state',
            Value:state
        },
    ],
    UI.SelectionFields:[storeid,name]
);
annotate Project2DB.Store with @(
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type:'UI.DataField',
                Value:storeid
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : address1,
            },
            {
                $Type : 'UI.DataField',
                Value : address2,
            },
            {
                $Type : 'UI.DataField',
                Value : pincode,
            },
            {
            $Type:'UI.DataField',
            Label:'state',
            Value:state
        },
        ]
    },
 UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'store Information',
            Target : '@UI.FieldGroup#StoreInformation',
        },
    ]
);
annotate Project2DB.State with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        }
    ],
);
annotate Project2DB.Product with @(
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value:productid
        },
        {
            $Type:'UI.DataField',
            Value:productName
        },
        {
            $Type:'UI.DataField',
            Value:productimageurl
        },
        {
            $Type:'UI.DataField',
            Value:productcostprice
        },
        {
            $Type:'UI.DataField',
            Value:productsellprice
        },
        
    ],
    UI.SelectionFields:[productid,productName]
);
annotate Project2DB.Product with @(
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type:'UI.DataField',
            Value:productid,
        },
            {
                $Type : 'UI.DataField',
                Value : productName,
            },
            {
                $Type : 'UI.DataField',
                Value : productimageurl,
            },
            {
                $Type : 'UI.DataField',
                Value : productcostprice,
            },
            {
                $Type : 'UI.DataField',
                Value : productsellprice,
            },
            
        ]
    },
  UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#ProductInformation',
        },
  ]
);
annotate Project2DB.StockData with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store
        },
        {
            $Type : 'UI.DataField',
             Value : product
        },
        {
            $Type : 'UI.DataField',
            Value : stockQty
        }
    ],
);
annotate Project2DB.StockData with @(
    UI.FieldGroup #StockDataInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                 Value : store_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : product_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : stockQty,
            },
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StockDataInfoFacet',
            Label : 'Stock Data Information',
            Target : '@UI.FieldGroup#StockDataInformation',
        },
    ]
);

annotate Project2DB.MasterData with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'States',
            CollectionPath: 'State',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: state,
                    ValueListProperty: 'code'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    )
};
annotate Project2DB.Store with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'States',
            CollectionPath: 'State',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: state,
                    ValueListProperty: 'code'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    )
};







