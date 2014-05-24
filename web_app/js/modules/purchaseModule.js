define(["hasher", "jquery", "jquery.bootstrap"],
    function(hasher, $) {
    	var obj = {};

    	obj.init = function(data){
			console.log("init purchase module");
			
			$('.purchaseTable tr').click(function() {
                var purchaseId =($(this).attr('purchaseId'));
				hasher.setHash('purchase/'+purchaseId);
		    });

            if(data.purchaseslist.length > 0){
                $('#collapse'+data.purchaseslist[0].month+data.purchaseslist[0].year).collapse('show');
            }

    	};

        return obj;
    }
);