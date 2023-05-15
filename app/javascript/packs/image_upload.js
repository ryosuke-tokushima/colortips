let dropArea = document.getElementById('drop-area');
let fileInput = document.getElementById('file-input');

// ドラッグ&ドロップ時のイベントハンドラを設定
['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
  dropArea.addEventListener(eventName, preventDefaults, false);
});

function preventDefaults(e) {
  e.preventDefault();
  e.stopPropagation();
}

// ドロップ時のイベントハンドラを設定
dropArea.addEventListener('drop', handleDrop, false);

function handleDrop(e) {
  let files = e.dataTransfer.files;
  fileInput.files = files;
  handleFiles(files);
}

// クリック時にファイル選択ダイアログを開く
dropArea.addEventListener('click', function() {
  fileInput.click();
});

// ファイル選択時にプレビューを表示
fileInput.addEventListener('change', function() {
  handleFiles(this.files);
});

function handleFiles(files) {
  let preview = document.getElementById('image-preview');
  let file = files[0];
  let reader = new FileReader();

  reader.addEventListener("load", function () {
    preview.src = reader.result;
    preview.style.display = "block";
  }, false);

  if (file) {
    reader.readAsDataURL(file);
  }
}
