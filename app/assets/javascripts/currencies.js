
$(document).ready(function(){

	var chart;
	var values, old_values;

	function readValues(funct){
		values = $.get("currencies/generate_chart", funct);
		return values;
	}

	//console.log("in generate");
	function generateChart(data){
		chart = c3.generate({
			    data: {
		        columns: data.currencies,
		        type : 'donut'
		    },
			donut: {
		        title: "Your wallet"
		    }
		});
	}

	readValues(generateChart);
	old_values = values;

	function updateChart(data){
		chart.load({
			columns: data.currencies
		});
	}

	setInterval(function () {
		if(values != old_values){
			readValues(updateChart);
			old_values = values;
		}
	}, 3000);

});
