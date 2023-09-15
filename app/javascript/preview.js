document.addEventListener('turbo:load', function(){
console.log("in_1");
  const postForm = document.getElementById('item_form'); //フォームを取得
  const previewList = document.getElementById('previews'); //divを取得

  if (!postForm) return null; // 要素が存在しない場合は処理を終了
  console.log("in_2");
  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="spot[image]"]');
  console.log(`in_2.5 ${fileField}`);

  fileField.addEventListener('change', function(e){
    console.log("in_3");
    // 古いプレビューが存在する場合は削除
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    console.log("in_4");
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file); //取得した画像情報のURLを生成

    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper); 
    console.log("in_5");
  });
});