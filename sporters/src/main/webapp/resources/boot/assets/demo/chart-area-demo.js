// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// 날짜구하기
var date = new Date();
let now = date.getMonth() + "-" + date.getDate();
let day1 = date.getMonth() + "-" + (date.getDate() - 6);
let day2 = date.getMonth() + "-" + (date.getDate() - 5);
let day3 = date.getMonth() + "-" + (date.getDate() - 4);
let day4 = date.getMonth() + "-" + (date.getDate() - 3);
let day5 = date.getMonth() + "-" + (date.getDate() - 2);
let day6 = date.getMonth() + "-" + (date.getDate() - 1);

let labels = [day1, day2, day3, day4, day5, day6, now];

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [labels[0], labels[1], labels[2], labels[3], labels[4], labels[5], labels[6]],
    datasets: [{
      label: "Sessions",
      lineTension: 0.3,
      backgroundColor: "#C8C8FF",
      borderColor: "#8C8CFF",
      pointRadius: 5,
      pointBackgroundColor: "#8C8CFF",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "#8C8CFF",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 40000,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
