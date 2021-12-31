$(document).on('turbolinks:load', function () {
  $('#user_picture').change(function () {
    var size_in_megabytes = this.files[0].size / 1024 / 1024;
    if (size_in_megabytes > 4.7) {
      alert('最大ファイルサイズは5MB未満です。小さいファイルを選択してください。');
    }
  });
});
