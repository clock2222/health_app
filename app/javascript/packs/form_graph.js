document.addEventListener('DOMContentLoaded', () => {
  const radarLabel = ['心', '身体', '睡眠', '集中力', '社会', 'お金'];
  const radarData = [0, 0, 0, 0, 0, 0];

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

  const formChartContext = document.getElementById('myChart').getContext('2d');
  let myChart = new Chart(formChartContext, {
    type: 'radar',
    data: radarChartData,
    options: radarChartOption,
  });

  var sliders = document.getElementById('sliders');
  sliders.addEventListener(
    'input',
    function () {
      let a = document.getElementById('slider_a').value;
      let b = document.getElementById('slider_b').value;
      let c = document.getElementById('slider_c').value;
      let d = document.getElementById('slider_d').value;
      let e = document.getElementById('slider_e').value;
      let f = document.getElementById('slider_f').value;
      document.getElementById('val_a').textContent = a;
      document.getElementById('val_b').textContent = b;
      document.getElementById('val_c').textContent = c;
      document.getElementById('val_d').textContent = d;
      document.getElementById('val_e').textContent = e;
      document.getElementById('val_f').textContent = f;
      myChart.data.datasets[0].data = [Number(a), Number(b), Number(c), Number(d), Number(e), Number(f)];
      myChart.update();
    },
    false
  );
});
