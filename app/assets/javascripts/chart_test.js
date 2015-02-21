console.log("main.js linked");

var data = {
    labels: ["Cohort 1", "Cohort 2", "Cohort 3", "Cohort 4", "Cohort 5", "Cohort 6", "Cohort 6"],
    datasets: [
        {
            label: "Lateness",
            fillColor: "rgba(220,220,220,0.5)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(220,220,220,0.75)",
            highlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 80, 81, 56, 55, 40]
        },
        {
            label: "Excused Absence",
            fillColor: "rgba(151,187,205,0.5)",
            strokeColor: "rgba(151,187,205,0.8)",
            highlightFill: "rgba(151,187,205,0.75)",
            highlightStroke: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 86, 27, 90]
        },
        {
            label: "Unexcused Absence",
            fillColor: "rgba(120,120,120,.9)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(220,220,220,0.75)",
            highlightStroke: "rgba(220,220,220,1)",
            data: [69, 53, 89, 80, 51, 30, 49]
        },

    ]
};




// Get the context of the canvas element we want to select

// new Chart(ctx).PolarArea(data, options);
var ctx = document.getElementById("myChart").getContext("2d");

var myBarChart = new Chart(ctx).Bar(data);

// myBarChart.addData([40, 60], "August")

var legend = myBarChart.generateLegend();


// .bar-legend ul
// {
//     display:inline;
// }
