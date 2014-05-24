 requirejs.config({
    paths: {
    	"signals": "util/signals",
    	"hasher": "util/hasher",
    	"crossroads": "util/crossroads",
        "jquery": "jquery-1.11.1",
        "mustache": "util/mustache",
        "jquery.bootstrap": "bootstrap",
        "jqplot": "jqplot/jquery.jqplot",
        "jqplot.barRenderer": "jqplot/plugins/jqplot.barRenderer",
        "jqplot.pieRenderer": "jqplot/plugins/jqplot.pieRenderer",
    	"jqplot.pointLabels": "jqplot/plugins/jqplot.pointLabels",
    	"jqplot.categoryAxisRenderer": "jqplot/plugins/jqplot.categoryAxisRenderer",
    	"jqplot.dateAxisRenderer": "jqplot/plugins/jqplot.dateAxisRenderer",
    	"jqplot.canvasTextRenderer": "jqplot/plugins/jqplot.canvasTextRenderer",
    	"jqplot.canvasAxisLabelRenderer": "jqplot/plugins/jqplot.canvasAxisLabelRenderer"
    },
    shim: {
        "jquery.bootstrap": {
            deps: ["jquery"]
        },
        "jqplot.barRenderer": ["jqplot"],
    	"jqplot.pointLabels": ["jqplot"],
    	"jqplot.pieRenderer": ["jqplot"],
    	"jqplot.categoryAxisRenderer": ["jqplot"],
    	"jqplot.dateAxisRenderer": ["jqplot"],
    	"jqplot.canvasTextRenderer":["jqplot"],
    	"jqplot.canvasAxisLabelRenderer": ["jqplot", "jqplot.canvasTextRenderer"]
    }
});



require(["signals", "hasher", "crossroads", "mustache", "jquery"], function(signals, hasher, crossroads, mustache, $){
	//setup crossroads
	crossroads.addRoute('', function(){
		$.get( "templates/main.html", function( data ) {
			$( "#content-main" ).html( data );
		});
	});
	crossroads.addRoute('statistics', function(){
		$.get( "templates/statistics.html", function( data ) {
			$( "#content-main" ).html( data );
			require(["modules/statisticsModule"], function(statisticsModule){
				statisticsModule.init();
			});
		});
	});
	crossroads.addRoute('purchases', function(){
		//$.getJSON("data/purchasesTest1.json", function(data){
		$.getJSON("/purchases/month", function(data){
			$.get( "templates/purchases.html", function( template ) {
				var htmlData = mustache.to_html(template, data);
				$( "#content-main" ).html( htmlData );
				require(["modules/purchaseModule"], function(purchaseModule){
					purchaseModule.init(data);
				});
			});
		});
	});
	crossroads.addRoute('purchase/{id}', function(id){
		//$.getJSON("data/singlePurchaseTest1.json", function(data){
		$.getJSON("/purchase/"+id, function(data){
			$.get( "templates/purchase.html", function( template ) {
				var htmlData = mustache.to_html(template, data);
				$( "#content-main" ).html( htmlData );
				require(["modules/singlePurchaseModule"], function(purchaseModule){
					purchaseModule.init(id);
				});
			});
		});
	});


	crossroads.routed.add(console.log, console); //log all routes
	 
	//setup hasher
	function parseHash(newHash, oldHash){
	  crossroads.parse(newHash);
	}
	hasher.initialized.add(parseHash); //parse initial hash
	hasher.changed.add(parseHash); //parse hash changes
	hasher.init(); //start listening for history change
	 
	//update URL fragment generating new history record
	// hasher.setHash('lorem/ipsum');
});

require(["jquery", "jquery.bootstrap"], function ($) {

});

/*
require(["mustache"], function(mustache){
	var person = {
	    firstName: "Christophe",
	    lastName: "Coenraets",
	    blogURL: "http://coenraets.org"
	};
	var template = "<h1>{{firstName}} {{lastName}}</h1>Blog: {{blogURL}}";
	var html = mustache.to_html(template, person);
	alert(html)
});
*/

/*
require(["modules/mainPageModule"], function(testModule){
	testModule.doSomething();
});

require(["jquery", "jqplot", "jqplot.dateAxisRenderer", "jqplot.canvasAxisLabelRenderer"], function($){

});
*/


