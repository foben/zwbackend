 requirejs.config({
    paths: {
    	"signals": "util/signals",
    	"hasher": "util/hasher",
    	"crossroads": "util/crossroads",
        "jquery": "jquery-1.11.1",
        "jquery.bootstrap": "bootstrap",
        "jqplot": "jqplot/jquery.jqplot",
        "jqplot.barRenderer": "jqplot/plugins/jqplot.barRenderer",
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
    	"jqplot.categoryAxisRenderer": ["jqplot"],
    	"jqplot.dateAxisRenderer": ["jqplot"],
    	"jqplot.canvasTextRenderer":["jqplot"],
    	"jqplot.canvasAxisLabelRenderer": ["jqplot", "jqplot.canvasTextRenderer"]
    }
});



require(["signals", "hasher", "crossroads", "jquery"], function(signals, hasher, crossroads, $){
	//setup crossroads
	crossroads.addRoute('', function(){
		$.get( "templates/main.html", function( data ) {
			$( "#content-main" ).html( data );
		});
	});
	crossroads.addRoute('statistics', function(){
		$.get( "templates/statistics.html", function( data ) {
			$( "#content-main" ).html( data );
			require(["modules/statisticsModule"], function(testModule){
				testModule.init();
			});
		});
	});
	crossroads.addRoute('purchases', function(){
		$.get( "templates/purchases.html", function( data ) {
			$( "#content-main" ).html( data );
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
require(["modules/mainPageModule"], function(testModule){
	testModule.doSomething();
});

require(["jquery", "jqplot", "jqplot.dateAxisRenderer", "jqplot.canvasAxisLabelRenderer"], function($){

});
*/


