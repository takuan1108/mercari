$(function(){

  var upload_image = $(".sell-dropbox-items");
  var i_count = 1;

  function appendImage(image) {
    var html = `<li class="sell-upload-item">
                  <img src="${image}" alt="画像">
                  <div class="sell-upload-button">
                    <a href="" class="sell-upload-edit">編集</a>
                    <a href="" class="sell-upload-delete">削除</a>
                  </div>
                </li>`
    upload_image.append(html);
    ImageCount()
  }
// https://www.softel.co.jp/blogs/tech/archives/5679

  // targetにdropzoneを定義する
  var target = document.getElementById('drop');
  if (target) {
    // ドラッグ
    target.addEventListener('dragover', function (e) {
      // デフォルトアクションを抑止
      e.preventDefault();
      // 親要素へのイベントの伝播をストップ
      e.stopPropagation();
      // ドロップされた要素はローカルからのコピー
      e.dataTransfer.dropEffect = 'copy';
    });

    // ドロップ
    target.addEventListener('drop', function (e) {
      e.preventDefault();
      e.stopPropagation();
      //DataTransfer.files - ファイルの一覧
      document.getElementById('item_image'+ i_count).files = e.dataTransfer.files;
    });
  }

// ドロップ後 表示させとく
  $('.item_images').on("change",function(e) {
    for(var i = 0; i < this.files.length; i++){
      // FileReaderを作成
      var fileReader = new FileReader();
      // 読み込み完了時のイベント
      fileReader.onload = function (e) {
      //e.target.result
        appendImage(e.target.result);
      }
      // 読み込み実行readAsDataURL()は、FileReaderのメソッド
      fileReader.readAsDataURL(this.files[i]);
      i_count += 1;
      $("label.sell-dropbox-uploader_container").attr('for','item_image'+ i_count);
    }
  });

  // ここから連動プルダウン
  var select_large = $('.large-category')
  var select_middle = $('.middle-category')
  var select_small = $('.small-category')
  var select_size = $('.size-select')
  var middle_box = $('.select-middle')
  var small_box = $('.select-small')
  var size_box = $('.select-size')
  var brand_box = $('.select-brand')
  // var parent_val = null

  // 呼び出し元に、選択された値に紐づくカテだけを返す
  function compare(category, value){
    results = category.filter(function(e){
      if (e.ancestry == value){
      //filterメソッドでresultsにlargeのvalueとmiddleカテのancestryが同じものを代入
        return e
      }
    })
    return results
  }

  function middle_choices(large_results,select_middle){
    large_results.forEach(function(result){
      var html = `<option value="${result.id}">
                  ${result.name}
                </option>`
    //middleboxに選択肢を入れる
    select_middle.append(html)
    })
  }

  function small_choices(select_small, large_val, middle_val){
    //smallの定義（ancestry)
    var category_value = `${large_val}/${middle_val}`
    //紐づいたsmall要素だけresultsに代入
    var middle_results = compare(gon.small, category_value)
    if ($.isEmptyObject(results)){
      small_box.hide();
      size_box.show();
    } else{
      middle_results.forEach(function(result){
        var html = `<option value="${result.id}">
                     ${result.name}
                    </option>`
        select_small.append(html)
      })
    }
  }
  // function size_choices(select_middle,middle_val){
  //   var results = gon.cloth;
  //   if(results = 1){
  //     size_box.show();
  //     }else{
  //       size_box.hide();
  //     }
  //   }
    // largeが変わったら発動
  select_large.change(function() {
    // largeの値を代入
    var large_val = $(this).val();
    // largeが空なら隠しとく
    if ($.isEmptyObject(large_val)){
      middle_box.hide();
      } else {
    // 入ってるならmiddle出現
      middle_box.show();
    }
    var large_results = compare(gon.middle, large_val)
    // largeに紐づくmiddleカテをmiddleboxの選択肢として加える
    middle_choices(large_results,select_middle);
  });

    // middleが変わったら発動
  select_middle.change(function() {
    //largeのvalueを代入
    var large_val = select_large.val();
    //middleのvalueを代入
    var middle_val  = $(this).val();
    //middleが空なら隠しとく
    if ($.isEmptyObject(middle_val)){
      small_box.hide();
      } else {
    //入ってたらsmall出現
      small_box.show();
    }
    small_choices(select_small,large_val, middle_val);
    // size_choices(select_middle,middle_val);
  });
  // smallが変わったら発動
  select_small.change(function() {
    var small_val = $(this).val();
     // smallの値が入ったらsizeのselectboxを出現
    if ($.isEmptyObject(small_val)){
      size_box.hide();
      } else {
      size_box.show();
      brand_box.show();
    }
  });

  //配送料の選択で配送方法を出現
  $('#item_shipping_fee').change(function(){
    $('.select_shipping_method').show();
  })
  // function ReplaceNum(num) {
  //   var str = new String(num).replace(/,/g, "");
  //   while(str != (str = str.replace(/^(-?\d+)(\d{3})/, "$1,$2")));
  //   return str;
  // }

  // $(".sell-form-text_number").on("keyup", function(e) {
  //   var input = $(this).val();
  //   var price = Number(input.replace(/[^0-9]/g, ''));

  //   if( price >= 300 && price <= 9999999 ){
  //     var fee = Math.floor(price / 10);
  //     var gains = Math.floor(price - fee);
  //     var fee_num = ReplaceNum(fee)
  //     $(".right").text('¥ ' + fee_num);
  //     var gains_num = ReplaceNum(gains)
  //     $(".sell-form-price-gains-num").text('¥ ' + gains_num);
  //     }
  //   else {
  //     $(".sell-form-price-fee-num").text('-');
  //     $(".sell-form-price-gains-num").text('-');
  //   }
  // });
});
