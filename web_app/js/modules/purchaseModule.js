define(["hasher", "jquery", "jquery.bootstrap"],
    function(hasher, $) {
    	var obj = {};

    	obj.init = function(){
			console.log("init purchase module");
			
			$('.purchaseTable tr').click(function() {
                var purchaseId =($(this).attr('purchaseId'));
				hasher.setHash('purchase/'+purchaseId);
		    });
    	};

        return obj;
    }
);