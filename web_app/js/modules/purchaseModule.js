define(["hasher", "jquery", "jquery.bootstrap", "jqplot", "jqplot.pieRenderer"],
    function(hasher, $) {
    	var obj = {};

        var drawPlot = function(year, month){
            var yearMonth = month + year;

            if($('#chart'+yearMonth).html() !== ""){
                return;
            }

            $.getJSON("/category/year/"+year+"/month/"+month, function(data){
                var plot = $.jqplot('chart'+yearMonth, [data.productCategories], {
                    title:'Monat nach Kategorien',
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
                    var text = jQuery("#chart"+yearMonth+" table[class='jqplot-table-legend']").html();
                    jQuery('#legendContainer'+yearMonth).html(text);
                    jQuery("#chart"+yearMonth+" table[class='jqplot-table-legend']").html(''); 
                }

                $(window).resize(function() {
                    plot.replot( { resetAxes: false } );
                    fixLegend();
                });

                fixLegend();
            });
        }

    	obj.init = function(data){
			console.log("init purchase module");


            // add click listener for navigation
			$('.purchaseTable tr').click(function() {
                var purchaseId =($(this).attr('purchaseId'));
				hasher.setHash('purchase/'+purchaseId);
		    });

            // open current month
            if(data.purchaseslist.length > 0){
                $('#collapse'+data.purchaseslist[0].month+data.purchaseslist[0].year).collapse('show');
            }

            // draw categories
            data.purchaseslist.forEach(function(entry){
                var year = entry.year;
                var month = entry.month;
                var yearMonth = month + year;

                $('#collapse'+yearMonth).on('shown.bs.collapse', function () {
                    console.log("shown: " + yearMonth);
                    drawPlot(year, month);
                });


            });

    	};


        return obj;
    }
);