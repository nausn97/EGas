	
	function pop_content(url,param){
		// html 작업되지 않은 상태
		$.ajax({
			type: "POST"
			, url: url
			, data: param
			, success: function(content) { $("#pop_content").html(content); $("#pop_content").toggle(function(){pop_open(); pop_repos();} ); }
			//, error: function(xhr, status, error) {alert(error);}
			
		});
	}

	function pop_open(){
		$(".menuAll_bg").css({"opacity": "0.7"});
		$(".menuAll_bg").fadeIn();
		$('.menuAll_area').fadeIn();
		$("select").hide();
		$(".menuAll_close").eq(0).focus();
	}
	
	function pop_close(){
		$('.menuAll_area').fadeOut();
		$(".privacy_pop .privacy_layer_pop").hide()
		$('.privacy_pop').fadeOut();
		$('.menuAll_bg').fadeOut();
		$('select:not(".selRelSite")').show();
		$('#MediaPlayer').show();
		$(".menuAll_open").focus();
		//return false;
	}

	function pop_closePrivacy(){
		$('.menuAll_area').fadeOut();
		$(".privacy_pop .privacy_layer_pop").hide()
		$('.privacy_pop').fadeOut();
		$('.menuAll_bg').fadeOut();
		$('select:not(".selRelSite")').show();
		$('#MediaPlayer').show();
		$(".btnPolicy_pop").focus();
		//return false;
	}
	
	function pop_repos(){

		if ($(".menuAll_bg").css("display")!="none"){
			var top_m = 40;
			
			if ( $('.menuAll_area').height() + $(window).scrollTop() < $('#wrap').height()) {
				if ($(window).height() > $('.menuAll_area').height()) {
					$('.menuAll_area').css("top", ( ($(window).height() - $('.menuAll_area').height() ) / 2+$(window).scrollTop() - top_m) + "px");
				}else{
					$('.menuAll_area').css("top",($(window).scrollTop() - top_m) + "px");
				}
			}

			if ( $('.menuAll_area').width() + $(window).scrollLeft() < $('#wrap').width()) {
				if ($(window).width() > $('.menuAll_area').width()) {
					$('.menuAll_area').css("left", ( $(window).width() - $('.menuAll_area').width() ) / 2+$(window).scrollLeft() + "px");
				}else{
					$('.menuAll_area').css("left",$(window).scrollLeft() + "px");
				}
			}

			$(".menuAll_bg").css("height",($(window).height() + $(window).scrollTop()) + "px");  
			$(".menuAll_bg").css("width",($(window).width() + $(window).scrollLeft()) + "px");
		}
	}

	function popPolicy_open(){
		$(".menuAll_bg").css({"opacity": "0.7"});
		$(".menuAll_bg").fadeIn();
		$(".privacy_pop").fadeIn();
		$(".privacy_pop .privacy_layer_pop").show();
		$('select:not("#sel1")').hide();
	}
	
	function popPolicy_repos(){
		if ($(".menuAll_bg").css("display")!="none"){
			var top_m = 30;
			/*
			$('.privacy_pop').css("top","80px");
			$('.privacy_pop').css("left","430px");
			*/
			if ( $('.privacy_pop').height() + $(window).scrollTop() < $('#wrap').height()) {
				if ($(window).height() > $('.privacy_pop').height()) {
					$('.privacy_pop').css("top", ( ($(window).height() - $('.privacy_pop .privacy_layer_pop').height() ) / 2+$(window).scrollTop() - top_m) + "px");
				}else{
					$('.privacy_pop').css("top",($(window).scrollTop() - top_m) + "px");
				}
			}

			if ( $('.privacy_pop').width() + $(window).scrollLeft() < $('#wrap').width()) {
				if ($(window).width() > $('.privacy_pop').width()) {
					$('.privacy_pop').css("left", ( $(window).width() - $('.privacy_pop .privacy_layer_pop').width() ) / 2+$(window).scrollLeft() + "px");
				}else{
					$('.privacy_pop').css("left",$(window).scrollLeft() + "px");
				}
			}
			$(".menuAll_bg").css("height",($(window).height() + $(window).scrollTop()) + "px");  
			$(".menuAll_bg").css("width",($(window).width() + $(window).scrollLeft()) + "px");
		}
		$(".btnPrivacy_close").eq(0).focus();
	}
			
	$(function() {
		$(window).scroll(pop_repos);
		$(window).resize(pop_repos);
		$(window).load(function(){	
			$('.menuAll_area').hide();
			$('.menuAll_bg').hide();
		});
		
		$('.menuAll_open').click(function(){
			pop_open();
			pop_repos();
			$('#MediaPlayer').hide();
		});
		$('.menuAll_bg').click(pop_close);
		$('.menuAll_close').click(pop_close);

		$('.btnPolicy_pop').click(function(){
			popPolicy_open();
			popPolicy_repos();	
			$('#MediaPlayer').hide();
		});
		
		$('.btnPrivacy_close').click(pop_closePrivacy);

	});

	function win_open(url,target,t,l,w,h,s){
		return window.open(url,target,"top="+t+",left="+l+",width="+w+",height="+h+",scrollbars="+s+",toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1");
	}
	
	function openMap(flag){
		var popWin = win_open("customer/map_pop3d60.html?MapFlag="+ flag,"PopMap",0,0,800,600,0);
	}
	
	function openMapPrint(flag){
		var fname = "";
		if (flag=="1-1"){
			fname="error.html";
		}else if (flag=="1-2"){
			fname="error.html";
		}else if (flag=="1-3"){
			fname="error.html";
		}else if (flag=="2"){
			fname="error.html";
		}else if (flag=="3"){
			fname="error.html";
		}

		var popPrint = win_open("/pop/"+ fname,"PopMap",0,0,770,600,1);
		
		popPrint.focus();
		popPrint.print();
	}

	function openAudit(){
		var popWin = win_open("https://audit.skec.co.kr/html/front/front_popup.html","PopAudit",0,0,600,540,0);
	}

	function win_open1(url,target,t,l,w,h,s){
		return window.open(url,target,"resizable=1,scrollbars=1");
	}

	function openAudit1(){
		var popWin = win_open1("https://ethics.sk.co.kr/advice/report.aspx","PopAudit",0,0,740,780,0);
	}