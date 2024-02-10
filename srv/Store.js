const cds = require('@sap/cds');
function validateCostPrice(productData) {
    const { productcostprice, productsellprice } = productData;
    if (productcostprice >= productsellprice) {
        throw new Error("Product cost price must be less than selling price.");
    }
}
module.exports = cds.service.impl(function () {
    const { MasterData,State,Product } = this.entities();
    this.before(['CREATE', 'UPDATE'], Product, async (req) => {
        try {
             validateCostPrice(req.data);
        } catch (error) {
            req.error({ code: 'INVALID_COST_PRICE', message: error.message });
        }
    });
    this.on('READ', State, async(req) => {
        states = [
            {"code":"Ap", "description":"Andhra Pradesh"},
            {"code":"TS", "description":"Telangana"}
        ]
        states.$count=states.length;
        return states;
    }
    )
  
this.before("CREATE",  MasterData, async (req) => {
    const { bpn, Is_gstn_registered, Gst_num } = req.data;
    if (Is_gstn_registered && !Gst_num) {
        req.error({
            code: "MISSING_GST_NUM",
            message: "GSTIN number is mandatory when Is_gstn_registered is true",
            target: "Gst_num",
        });
    }
})
});