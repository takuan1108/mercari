$(function(){
  function show_menu(s){
    $(s).on('mouseover',function(){
      plus_menu = $(this).parent().next()
      plus_menu.css('display','block');
      plus_menu.children().addClass('new_switch1')
    });
  }
// 消える方うまくいっていない
  function not_show_menu(s){
    $(s).on('mouseout',function(){
      plus_menu = $(this).parent().next()
      plus_menu.css('display','none');
      plus_menu.children().addClass('new_switch1')
    });
  }

  show_menu('.switch');

// ブサイクすぎるから入れ子関係整理すること！！！！！(未完成)
  $(document).on('mouseover','.new_switch1',function(){
    plus_menu = $(this).children('ul');
    plus_menu.css('display','block');
    plus_menu.children('li').addClass('new_switch1')
    $(this).css('background','#ea352d');
    $(this).children().css('color','white');
  });

  $(document).on('mouseout','.new_switch1',function(){
    plus_menu = $(this).children('ul');
    plus_menu.css('display','none');
    $(this).css('background','#fff');
    $(this).children().css('color','black');
  });
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
//   function show_right_list(hover,show){
//     $(hover).on('mouseover',function(){
//       $(show).css('display','block');
//       console.log('OK')
//     });
//   }
//     function not_show_right_list(hover,show){
//     $(hover).on('mouseout',function(){
//       $(show).css('display','none');
//       console.log('OK')
//     });
//   }

//   show_right_list('.mypage','.mypage-detail')
//   not_show_right_list('.mypage','.mypage-detail')
// })
