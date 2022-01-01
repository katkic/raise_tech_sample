$(document).on('turbolinks:load', function () {
  $('#user_picture').change(function () {
    var size_in_megabytes = this.files[0].size / 1024 / 1024;
    if (size_in_megabytes > 4.7) {
      alert('最大ファイルサイズは5MB未満です。小さいファイルを選択してください。');
    }
  });
  
  // 新規作成・編集画面で、file_fieldに選択した画像をプレビューで確認できるようにする
  function readURL(input) {
    var bodyPicId = '#' + input.id + '_prev';

    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $(bodyPicId).attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#user_picture').change(function () {
    readURL(this);
  });
});
