$(document).on('turbolinks:load', function () {
  function appendOption(category) {
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML) {
    var childSelectHtml = '';
    childSelectHtml = `<div class="category__child" id="children_wrapper">
                        <select id="child__category" name="post[category_id]" class="select_field">
                          <option value="">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('.append__category').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML) {
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class="category__child" id="grandchildren_wrapper">
                              <select id="grandchild__category" name="post[category_id]" class="select_field">
                                <option value="">---</option>
                                ${insertHTML}
                                </select>
                            </div>`;
    $('.append__category').append(grandchildSelectHtml);
  }

  $('#post_category_id').on('change', function () {
    var parentId = document.getElementById('post_category_id').value;
    if (parentId != '') {
      $.ajax({
        url: '/categories/get_category_children/',
        type: 'GET',
        data: { parent_id: parentId },
        dataType: 'json',
      })
        .done(function (children) {
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function (child) {
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
          if (insertHTML == '') {
            $('#children_wrapper').remove();
          }
        })
        .fail(function () {
          alert('カテゴリー取得に失敗しました');
        });
    } else {
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  $('.append__category').on('change', '#child__category', function () {
    var childId = document.getElementById('child__category').value;
    if (childId != '') {
      $.ajax({
        url: '/categories/get_category_grandchildren/',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json',
      })
        .done(function (grandchildren) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function (grandchild) {
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
          if (insertHTML == '') {
            $('#grandchildren_wrapper').remove();
          }
        })
        .fail(function () {
          alert('カテゴリー取得に失敗しました');
        });
    } else {
      $('#grandchildren_wrapper').remove();
    }
  });
});
