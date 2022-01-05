$(function () {
  $('#detail-association-insertion-point1 a').hide();

  $('#detail-association-insertion-point1').on('cocoon:after-insert', function () {
    check_content();
  });

  $('#detail-association-insertion-point1').on('cocoon:before-remove', function () {
    var confirmation = confirm('項目を削除します。よろしいですか？');
    if (!confirmation) {
      preventDefault();
    }
  });

  $('#detail-association-insertion-point1').on('cocoon:after-remove', function () {
    check_content();
  });

  function check_content() {
    if ($('#detail-association-insertion-point1 .nested-fields').length == 2) {
      $('#detail-association-insertion-point2 a').hide();
    } else {
      $('#detail-association-insertion-point2 a').show();
    }
  }
});
