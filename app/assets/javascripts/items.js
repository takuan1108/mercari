$(function(){
  function plus_menu(s){
    $(s).on('mouseover',function(){
      plus_menu = $(this).parent().next().children()
      plus_menu.css('display','block');
      plus_menu.children().addClass('new_switch1')
    });
  }

  plus_menu('.switch');
// ブサイクすぎるから入れ子関係整理すること！！！！！(未完成)
  $(document).on('mouseover','.new_switch1',function(){
    plus_menu = $(this).next().children();
    $(this).css('background','#ea352d');
    $(this).children().css('color','white')
    plus_menu.css('display','block');
    plus_menu.addClass('new_switch2')
  });

    $(document).on('mouseover','.new_switch2',function(){
    plus_menu = $(this).children().children();
    plus_menu.css('display','block');

  });





  // $('#category_switch').on('mouseover',function(){
  //   console.log('1');
  //   $('.pc-header-nav-parent').css('display','block');
  // });
  // $('.switch').on('mouseout',function(){
  // console.log('1');
  // $('.pc-header-nav-parent').css('display','none');
  // });

// 以下maypage操作
  function show_right_list(hover,show){
    $(hover).on('mouseover',function(){
      $(show).css('display','block');
      console.log('OK')
    });
  }
    function not_show_right_list(hover,show){
    $(hover).on('mouseout',function(){
      $(show).css('display','none');
      console.log('OK')
    });
  }

  show_right_list('.mypage','.mypage-detail')
  not_show_right_list('.mypage','.mypage-detail')
})

// ===スクレイピング===
// $(function(){
//   var url='https://www.mercari.com/jp/'
//   window.open(url)
//   $(url).find('.pc-header-nav-grand-child')
//   $('.pc-header-nav-grand-child').append('aaaa');
//   console.log('check-1')
// })


// $(function(){
//   function readHtml(url) {
//     $.ajax({
//       type: 'GET',
//       url: url,
//       success: function(data) {
//         $('#content').append(data.responseText);
//       },
//       error: function(xhr, status, err) {
//         alert('HTML読み出しで問題がありました:' + url);
//       }
//     });
//   }
//   readHtml('https://www.mercari.com/jp/')
// })

// $(function() {
//   $.ajax({
//     url: 'https://www.mercari.com/jp/', //読み込むファイルを指定
//     cache: false, //キャッシュを保存するかの指定
//     success: function(html){
//       //データ取得後に実行する処理
//       $(html).find('.pc-header-nav-grand-child').each(function(){　//読み込みたい部分の指定　※今回は#demo_blockの中身のulから読み込まれる
//         $('#info').html($(this).html()); //読み込んだ外部HTMLを表示する領域を指定
//         return false;
//       });
//       $('ul li:gt(4)').remove(); //6件目以降の li を削除
//     }
//   });
// });
