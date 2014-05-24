define(["jquery", "jqplot", "jqplot.pieRenderer"],
    function($) {
    	var obj = {};

    	obj.init = function(){

			var data = [
			    ['Obst/Gemüse', 12],['Lebensmittel', 9], ['Kosmetik', 14],
			    ['Schreibwaren', 16],['Kleidung', 7], ['Getränke', 9]
			  ];
			var plot1 = $.jqplot('chart1', [data], {
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
		      	legend: { show:true, location: 'e' }
			});

			$(window).resize(function() {
		    	plot1.replot( { resetAxes: false } );
			});
    	}

        return obj;
    }
);