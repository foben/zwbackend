define(["hasher", "jquery", "jquery.bootstrap"],
    function(hasher, $) {
    	var obj = {};

    	obj.init = function(){
			console.log("init purchase module");
			
			$('.purchaseTable tr').click(function() {
				hasher.setHash('purchase/57');
		    });
    	};

        return obj;
    }
);