wlog.controller('graphsController', ['$rootScope','$scope', function($rootScope,$scope) {

	var pieData = {
      type: 'pie',  // Specify your chart type here.
      title: {
        text: 'Status Code' // Adds a title to your chart
      },
      legend: {}, // Creates an interactive legend
      series: [  // Insert your series data here.
          { values: [35, 42, 67, 89]},
          { values: [28, 40, 39, 36]}
      ]
    };
    zingchart.render({ // Render Method[3]
      id: 'pieDiv',
      data: pieData,
      height: 400,
      width: 600
    });

    var barData = {
      type: 'bar',  // Specify your chart type here.
      title: {
        text: 'Status Code' // Adds a title to your chart
      },
      legend: {}, // Creates an interactive legend
      series: [  // Insert your series data here.
          { values: [35, 42, 67, 89]},
          { values: [28, 40, 39, 36]}
      ]
    };
    zingchart.render({ // Render Method[3]
      id: 'barDiv',
      data: barData,
      height: 400,
      width: 600
    });

}]);