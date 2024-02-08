sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'businesspartner/test/integration/FirstJourney',
		'businesspartner/test/integration/pages/MasterDataList',
		'businesspartner/test/integration/pages/MasterDataObjectPage'
    ],
    function(JourneyRunner, opaJourney, MasterDataList, MasterDataObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('businesspartner') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMasterDataList: MasterDataList,
					onTheMasterDataObjectPage: MasterDataObjectPage
                }
            },
            opaJourney.run
        );
    }
);