/**
 * Created by tlt on 17/2/19.
 */
function load_index_more(page,total){
  var num = parseInt(page) + 1;
  if(parseInt(total) > 8){
    var local = parseInt(total) - 9;
  }else{
    var local = 0;
  }
  $('.load-more').attr('onclick',"load_index_more ("+ num +","+ local +")");
  $('.load-more').html("<h4>MORE「 "+ local + "」</h4>");
  $('.load-menu').css('display','none');
  $('.processbar').css({'display':'block','width':'0%'});
  $.get('/videos/get_index_more',{page: page}, function(data){
    var i = 0;
    var timer = setInterval(function(){
      $(".processbar").css("width", i + "%");
      i++;
      if (i > 100) {
        clearInterval(timer);
      }
    },5);
    setTimeout(function(){
      $('.load-menu').css('display','block');
      $('.processbar').css('display','none');
      if(data != ''){
        $('.video-list').append(data);
      }else{
        $('.load-more').html('<h4>感谢您对我们视频的支持！(+ _ +) </h4>').removeAttr('onclick');
      }
    },555);
  })
};

function load_channel_more(page,channel,total){
  var num = parseInt(page) + 1;
  if(parseInt(total) > 8){
    var local = parseInt(total) - 9;
  }else{
    var local = 0;
  }
  $('.load-more').attr('onclick',"load_channel_more ("+ num +","+ channel +", "+ local +")");
  $('.load-more').html("<h4>MORE「 "+ local + "」</h4>");
  $('.load-menu').css('display','none');
  $('.processbar').css({'display':'block','width':'0%'});
  $.get('/videos/get_channel_more',{page: page, column:channel}, function(data){
    var i = 0;
    var timer = setInterval(function(){
      $(".processbar").css("width", i + "%");
      i++;
      if (i > 100) {
        clearInterval(timer);
      }
    },5);
    setTimeout(function(){
      $('.load-menu').css('display','block');
      $('.processbar').css('display','none');
      if(data != ''){
        $('.video-list').append(data);
      }else{
        $('.load-more').html('<h4>感谢您对我们视频的支持！(+ _ +) </h4>').removeAttr('onclick');
      }
    },555);
  })
};

$(function(){
})