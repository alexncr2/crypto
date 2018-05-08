
$(document).ready(function(){




	$.get("currencies/generate_chart", function(data) {

		//console.log("in generate");  
		var chart = c3.generate({
			    data: {
		        columns: data.currencies,
		        type : 'donut'
		    },
			donut: {
		        title: "Your wallet"
		    }
		});


		setInterval(function () {
			$.get("currencies/generate_chart", function(data) {
				//console.log("in interval");  
		    	chart.load({
		        	columns: data.currencies
		    	});
		    });
		}, 3000);
	});
});
