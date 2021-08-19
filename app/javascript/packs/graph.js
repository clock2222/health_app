document.addEventListener('turbolinks:load', () => {
  const lineLabel = gon.chart_label;
  const lineData = gon.chart_data;

  const lineChartData = {
    labels: lineLabel,
    datasets: [
      {
        label: '影響グラフ',
        data: lineData,
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1,
      },
    ],
  };

  const lineChartOption = {
    scales: {
      r: {
        ticks: {
          suggestedMin: 0,
          suggestedMax: 5,
          stepSize: 1,
          callback: function (value, index, values) {
            if (value == 0) {
              return '影響なし';
            } else if (value == 1) {
              return 'やや影響する';
            } else if (value == 2) {
              return 'ハッキリ影響する';
            } else if (value == 3) {
              return '強く影響する';
            } else if (value == 4) {
              return '日常生活に支障する';
            } else if (value == 5) {
              return '医者にかかる/かかった';
            }
          },
        },
      },
    },
  };

  const lineChartContext = document.getElementById('line-chart').getContext('2d');
  new Chart(lineChartContext, {
    type: 'radar',
    data: lineChartData,
    options: lineChartOption,
  });
});
