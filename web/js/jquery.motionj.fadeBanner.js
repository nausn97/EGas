/**
* Title : Fade Banner Rolling
* Author : Won Joso (http://blog.naver.com/josoblue , http://www.motionj.com)
* Email : joso@motionj.com
* URL : http://www.motionj.com
* Version : v1.0
* License : Free (�������� ������ ������, js ������ �ּ��� �����ϰ? ���Ǹſ����� �̿�Ǽ��� �ʵ˴ϴ�.)
* Description :
*
* width : �̹����� �ʺ�
* height : �̹����� ����
* speed : ���̵� �ӵ� ����.
* delay : ����� �Ǵ� �߰� ������
**/

(function($){
	$.fn.motionj_fadeBanner = function(o){
		o = $.extend({
			width : 330,
			height: 200,
			speed : 1500,
			delay : 6000
		}, o || { });

		return this.each(function(){
			var e = $(this);
			var n_h = e.find('p').height();
			var pause = false;
			var no = 1, ext;
			var len = e.find('ul li').length-1;
			var replace_img = function(o, s, ext){
				if (o.attr("src") != undefined) {
					if(s) o.attr('src', o.attr('src').replace('off.'+ext, 'on.'+ext));
					else o.attr('src', o.attr('src').replace('on.'+ext, 'off.'+ext));
				}				
			}
			var find_ext = function(imgE){				
				if (imgE.find('img').attr('src') !== undefined) {
					var xt = imgE.find('img').attr('src').lastIndexOf('.') + 1;
					xt = imgE.find('img').attr('src').substr(xt);
					return xt;
				} else {
					return '';
				}
			}
			/*
			e.css({
				position : 'relative',
				overflow : 'hidden',
				width : o.width
				
			}).find('ul').css({
				position : 'relative',
				'z-index' : 0,
				height : o.height
			}).find('li').css({
				position : 'absolute'
			});
			*/
			e.find('ul li:not(:eq(0))').hide();
			e.find('p').css({
				position : 'relative',
				'z-index' : 1,
				'text-align' : 'center',
				'margin-top' : -(n_h)
			}).find('span').css('cursor', 'pointer');
			e.find('ul li:eq(0)').addClass('on');
			e.find('p span:eq(0)').addClass('on');
			ext = find_ext(e.find('p span'));

			if (ext != '') {
				replace_img(e.find('p span:eq(0)').find('img'), true, ext);
			}

			var ani = function(num, m) {
				if(!e.find('p span:eq(' + num + ')').hasClass('on')){
					if(e.find('p span.on').length > 0){
						ext = find_ext(e.find('p span.on'));
						replace_img(e.find('p span.on').find('img'), false, ext);
						e.find('p span.on').removeClass('on');
					}
					e.find('p span:eq(' + num + ')').addClass('on');
					ext = find_ext(e.find('p span:eq(' + num + ')'));
					replace_img(e.find('p span:eq(' + num + ')').find('img'), true, ext);
					if(m){
						e.find('ul li').fadeOut('fast');
						e.find('ul li').removeClass('on');
						e.find('ul li:eq(' + num + ')').queue( function(){
							$(this).addClass('on');
							$(this).clearQueue();
							$(this).fadeIn('fast');
						});
					}else{
						e.find('ul li.on').fadeOut(o.speed);
						e.find('ul li.on').removeClass('on');
						e.find('ul li:eq(' + num + ')').fadeIn(o.speed);
						e.find('ul li:eq(' + num + ')').addClass('on');
					}
					if(num >= len) no = 0; 
					else{ no = num; no++; }
				}
			}
			e.find('p span').each(function(i){
				$(this).mouseover( function(){
					ani(i, true);
				});
			});

			e.click( function(){
				if (viewCount == 0) {
					pause = true;
					viewCount = 1;

					if ($(this).find("a").attr("id") == "btn1970") {
						$('#btn1970').find("img").attr("src", "../images/company/btn_play.png");
						$('#btn1970').find("img").attr("alt", "1970's history slide playback(during pause)");
					} else if ($(this).find("a").attr("id") == "btn1980") {
						$('#btn1980').find("img").attr("src", "../images/company/btn_play.png");
						$('#btn1980').find("img").attr("alt", "1980's history slide playback(during pause)");
					} else if ($(this).find("a").attr("id") == "btn1990") {
						$('#btn1990').find("img").attr("src", "../images/company/btn_play.png");
						$('#btn1990').find("img").attr("alt", "1990's history slide playback(during pause)");
					} else if ($(this).find("a").attr("id") == "btn2000") {
						$('#btn2000').find("img").attr("src", "../images/company/btn_play.png");
						$('#btn2000').find("img").attr("alt", "2000's history slide playback(during pause)");
					} else if ($(this).find("a").attr("id") == "btn2010") {
						$('#btn2010').find("img").attr("src", "../images/company/btn_play.png");
						$('#btn2010').find("img").attr("alt", "2010's history slide playback(during pause)");
					}
				} else {
					pause = false;
					viewCount = 0;

					if ($(this).find("a").attr("id") == "btn1970") {
						$('#btn1970').find("img").attr("src", "../images/company/btn_pause.png");
						$('#btn1970').find("img").attr("alt", "1970's history slide pause(during playback)");
					} else if ($(this).find("a").attr("id") == "btn1980") {
						$('#btn1980').find("img").attr("src", "../images/company/btn_pause.png");
						$('#btn1980').find("img").attr("alt", "1980's history slide pause(during playback)");
					} else if ($(this).find("a").attr("id") == "btn1990") {
						$('#btn1990').find("img").attr("src", "../images/company/btn_pause.png");
						$('#btn1990').find("img").attr("alt", "1990's history slide pause(during playback)");
					} else if ($(this).find("a").attr("id") == "btn2000") {
						$('#btn2000').find("img").attr("src", "../images/company/btn_pause.png");
						$('#btn2000').find("img").attr("alt", "2000's history slide pause(during playback)");
					} else if ($(this).find("a").attr("id") == "btn2010") {
						$('#btn2010').find("img").attr("src", "../images/company/btn_pause.png");
						$('#btn2010').find("img").attr("alt", "2010's history slide pause(during playback)");
					}
				}
			});

			setInterval(function(){ if(pause == false) ani(no, false); }, o.delay);
		});	
	}
})(jQuery);
