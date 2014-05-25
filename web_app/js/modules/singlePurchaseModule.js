define(["jquery", "jqplot", "jqplot.pieRenderer"],
    function($) {
    	var obj = {};

    	obj.init = function(itemId){

    		//$.getJSON("data/productCategoriesTest1.json", function(data){
			$.getJSON("/purchase/"+itemId+"/category", function(data){

				var plot1 = $.jqplot('chart1', [data.productCategories], {
					title:'Einkauf nach Kategorien',
					seriesDefaults: {
				        // Make this a pie chart.
				        renderer: jQuery.jqplot.PieRenderer,
				        rendererOptions: {
				          // Put data labels on the pie slices.
				          // By default, labels show the percentage of the slice.
				          showDataLabels: true
				        }
			      	},
			      	legend: { show:true, location: 's', placement: "outside" }
				});

				var fixLegend = function(){
					var text = jQuery("table[class='jqplot-table-legend']").html();
					jQuery('#legendContainer').html(text);
					jQuery("table[class='jqplot-table-legend']").html(''); 
				}

				$(window).resize(function() {
			    	plot1.replot( { resetAxes: false } );
			    	fixLegend();
				});

				fixLegend();
			});
    	}

        return obj;
    }
);