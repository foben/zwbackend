define(["jquery", "jqplot", "jqplot.dateAxisRenderer", "jqplot.canvasAxisLabelRenderer"],
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

			$(window).resize(function() {
		    	plot1.replot( { resetAxes: false } );
			});
    	}

        return obj;
    }
);