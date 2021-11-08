document.addEventListener('DOMContentLoaded', () => {
  const radarLabel = gon.chart_label;
  const radarData = gon.chart_data;

  const radarChartData = {
    labels: radarLabel,
    datasets: [
      {
        label: '影響グラフ',
        data: radarData,
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1,
        spanGaps: true,
      },
    ],
  };

  const radarChartOption = {
    scales: {
      r: {
        min: 0,
        max: 4,
        pointLabels: {
          font: {
            size: 20,
          },
        },
        ticks: {
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
              return '日常生活に支障を来す';
            }
          },
        },
      },
    },
  };

  const radarChartContext = document.getElementById('radar-chart').getContext('2d');
  new Chart(radarChartContext, {
    type: 'radar',
    data: radarChartData,
    options: radarChartOption,
  });
});
