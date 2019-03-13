$(function(){

// Pay.jpからトークンを取得してusersコントローラーのpayアクションに送る処理
  $(".add-card-submit").on("click", function(e){
    e.preventDefault();
    var number = $("#number").val().replace(/[^0-9]/g, '');
    var cvc = $("#cvc").val();
    var exp_month = $("#exp_month").val();
    var exp_year = $("#exp_year").val();
    var card = {
      number: number,
      cvc: cvc,
      exp_month: exp_month,
      exp_year: exp_year
    };
    var payjp_pk_key = "pk_test_27a9c466b59537fafa72dbf8";
    Payjp.setPublicKey(payjp_pk_key);
    Payjp.createToken(card, function(status, response) {
      if(status == 200){
        var token = response.id;
        $(".add-card").append(`<input type="hidden" name="token" value=${token}>`);
        $(".add-card").submit();
      }else{
        var error_message = response.error.message;
      }
    });
  })

// カード番号が4文字入力されるごとにハイフンを追加する処理
  $("#number").on("keypress", function(){
    var num = $(this).val();
    var num_length = num.length;
    if([4,9,14].indexOf(num_length) >= 0){
      $(this).val(num + "-");
    }
  })

// 「カード裏面の番号とは」をクリックすると説明がポップアップする処理
  $(".card-main__content__add-card__cvc--text").on("click", function(){
    $(".card-main__content__add-card__cvc__pop").fadeIn();
  })
  $(document).on("click", function(e) {
    if (!$(e.target).closest(".card-main__content__add-card__cvc--text").length) {
      $(".card-main__content__add-card__cvc__pop").fadeOut();
    }
  });

})
