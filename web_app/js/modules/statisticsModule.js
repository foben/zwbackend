define(["jquery", "jqplot", "jqplot.dateAxisRenderer", "jqplot.canvasAxisLabelRenderer", "jqplot.pieRenderer"],
    function($) {
    	var obj = {};

    	obj.init = function(){

			var line1=[['2014-01-01',250], 
				['2014-02-01',185], 
				['2014-03-01',120], 
				['2014-04-01',330],
				['2014-05-01',240],
				['2014-06-01',200],
				['2014-07-01',185],
				['2014-08-01',243],
				['2014-09-01',201],
				['2014-10-01',299],
				['2014-11-01',156],
				['2014-12-01',207]
				];
			var plot1 = $.jqplot('chart1', [line1], {
				title:'Ausgaben in den letzten 12 Monaten',
				axes:{
					xaxis:{
						renderer:$.jqplot.DateAxisRenderer,
						tickInterval:'1 month',
						tickOptions:{formatString:'%b'}
					},
					yaxis:{
						label:"Euro",
						labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
						labelOptions: {
				            fontFamily: 'Georgia, Serif',
				            fontSize: '12pt'
				          }
					}
				},
				series:[{lineWidth:4, 
					markerOptions:{style:'circle'}
				}]
			});

			var data = [
			    ['Obst/Gemüse', 12],['Lebensmittel', 9], ['Kosmetik', 14],
			    ['Schreibwaren', 16],['Kleidung', 7], ['Getränke', 9]
			  ];
			var plot2 = $.jqplot('chart2', [data], {
				title:'Einkauf nach Kategorien in den letzten 12 Monaten',
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

			var data2 = [
			    ['Rewe', 12],['Aldi', 9], ['Edeka', 14],['DM', 16]
			  ];
			var plot3 = $.jqplot('chart3', [data2], {
				title:'Einkauf nach Geschäft in den letzten 12 Monaten',
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
                var text = jQuery("#chart2 table[class='jqplot-table-legend']").html();
                jQuery("#legendContainer2").html(text);
                jQuery("#chart2 table[class='jqplot-table-legend']").html(''); 

                var text = jQuery("#chart3 table[class='jqplot-table-legend']").html();
                jQuery("#legendContainer3").html(text);
                jQuery("#chart3 table[class='jqplot-table-legend']").html(''); 
            }

            fixLegend();

			$(window).resize(function() {
		    	plot1.replot( { resetAxes: false } );
		    	plot2.replot( { resetAxes: false } );
		    	plot3.replot( { resetAxes: false } );
		    	fixLegend();
			});
    	}

        return obj;
    }
);