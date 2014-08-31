///// GNB Script : START
var MN_CODE = "000000";
var arrGnbD1 = new Array("","gnb_1_1","gnb_1_2","gnb_1_3","gnb_1_4","gnb_1_5","gnb_1_6");

(function ( $ ) {
    var filters = $.expr[":"];
    if ( !filters.focus ) {
        filters.focus = function( elem ) {
           return elem === document.activeElement && ( elem.type || elem.href );
        };
    }
})( jQuery );

$(function() {

    $(window).load(setGnbDefault);
    $(window).resize(setGnbResize);

    var subflag = false;
    var subno = 0;

    // gnb
    $("ul.gnb > li > a").hover(function(){
            var tempno;
            var thisClass = "";

            thisClass = $(this).parent().attr("class");
            if (thisClass) {
                subno = thisClass.substring(3,4);

                setGnbAll(false);
                $(this).addClass("on");
                // ie6 처리
                setGnbIE6($(this), "12px");

                $(".top_2").hide();
                $(".gnb_2").hide();
                setGnbResize();
                $(".gnb_2:eq(" + (subno - 1) + ")").show();

                $(".leftcont > div").hide();
                $(".leftcont > div.left"+subno).show();

            }

        }, function(){
//          if ($(this).attr("id").substring(4,6) != selMenu){
//              $(this).attr("src", $(this).attr("src").replace("_on.jpg", "_off.jpg"));
//          }
    });
	/* GNB FOCUS START */
	$("ul.gnb > li > a").focusin(function(){
            var tempno;
            var thisClass = "";

            thisClass = $(this).parent().attr("class");
            if (thisClass) {
                subno = thisClass.substring(3,4);

                setGnbAll(false);
                $(this).addClass("on");
                // ie6 처리
                setGnbIE6($(this), "12px");

                $(".top_2").hide();
                $(".gnb_2").hide();
                setGnbResize();
                $(".gnb_2:eq(" + (subno - 1) + ")").show();

                $(".leftcont > div").hide();
                $(".leftcont > div.left"+subno).show();
            }
    });

	$("a").focus(function(){
		if( $("ul.gnb a:focus").length <= 0 && $("#top_customer a:focus").length <= 0 ) {
			if(navigator.userAgent.indexOf("Chrome") != -1) {
				if( $(this).parent().next().attr("id") == "top_customer" ) {
					$(".top_2").hide();
				};
				if( $(this).parent().prev().attr("class") == "navigation" ) {
					$(".gnb_2").hide();
					$('.gnb .leftcont div').hide();
					$('.leftcont div.left0').show();
				}
			} else {
				setGnbDefault();
			}
		}

		if(navigator.userAgent.indexOf("Chrome") != -1) {
			 if( $(".familySite1 a").is(":focus") == false ){
				btnFamily1 = false;
				familySite1();
			}
		} else {
			if( $(".familySite1 a:focus").length <= 0 ){
				btnFamily1 = false;
				familySite1();
			}
		}

	});

	// 푸터 스크립트 시작 //
	function familySite1(val){
		if(val){
			$(".familySite1").find("ul").fadeIn();
			$(".familySite1").find("ul").css({"height":"60px", "top": "-62px"});
			$(".familySite1").children("a").addClass("on");
		} else {
			$(".familySite1").find("ul").fadeOut("fase");
			$(".familySite1").children("a").removeClass("on");
		}
	}

	var btnFamily1 = false;
	$(".btnFamily1").click(function(){
		btnFamily1 = (btnFamily1 == false) ? true : false;
		familySite1(btnFamily1);
	});
	// 푸터 스크립트 끝 //

	/* GNB FOCUS END */

    // gnb sub
    $(".gnb_2 li a img").hover(function(){
            $(this).attr("src", $(this).attr("src").replace("error.html", "error.html"));
        }, function(){
        	if (!$(this).hasClass("on")) {
	            $(this).attr("src", $(this).attr("src").replace("error.html", "error.html"));
	        }
    });

	/* GNB SUB FOCUS START*/
	 $(".gnb_2 li a").focusin(function(){
		$(this).children("img").attr("src", $(this).children("img").attr("src").replace("error.html", "error.html"));
	});
	 $(".gnb_2 li a").focusout(function(){
		if (!$(this).children("img").hasClass("on")) {
			$(this).children("img").attr("src", $(this).children("img").attr("src").replace("error.html", "error.html"));
	    }
	 });
	/* GNB SUB FOCUS END */
    $(".gnb_2").hover(function(){
            subflag = true;
        }, function(){
            setGnbDefault();
    });

	// 고객지원
    $("#top_customer").hover(function(){
            $(".gnb_2").hide();
            $(".top_2", this).show();
		    		$(".top_2", this).css("height",(($(window).height() + $(window).scrollTop())) - 105 + "px");
        }, function(){
//            setGnbDefault();
    });
    $("#top_customer .top_2").hover(function(){
        }, function(){
            setGnbDefault();
    });
	$("#top_customer a").focusin(function(){
		$(".gnb_2").hide();
		$(".top_2").show();
		$(".top_2").css("height",(($(window).height() + $(window).scrollTop())) - 105 + "px");
	});

    // 고객지원 sub
    $("#menu .top li a img").hover(function(){
            $(this).attr("src", $(this).attr("src").replace("error.html", "error.html"));
        }, function(){
        	if (!$(this).hasClass("on")) {
	            $(this).attr("src", $(this).attr("src").replace("error.html", "error.html"));
	        }
    });

    //관련사이트
    $(".selRelSite").change(function(){
    	if ($(this).val()){
    		window.open($(this).val(),"","");
    	}
    });

});

function setGnbResize(){
    $(".gnb_2").css("height",(($(window).height() + $(window).scrollTop())) - 146 + "px");
}

function setGnbDefault(){
    var mnDepth1 = parseInt(MN_CODE.substring(0,2),10);
    var mnDepth2 = parseInt(MN_CODE.substring(2,4),10);
    var mnDepth3 = parseInt(MN_CODE.substring(4,6),10);

    if (!mnDepth1) mnDepth1 = 0;
    if (mnDepth1 == 0){	// 메인
        setGnbAll(true);
        $('.top_2').hide();
        $('.gnb_2').hide();
        $('.gnb .leftcont div').hide();
		$('.leftcont div.left0').show();
    } else if (mnDepth1 == 7) { // 고객지원
    	var targetDepth2 = ".top_2 li:eq(" + (mnDepth2 - 1) + ") a img:first ";

        setGnbAll(true);
        $('.top_2').hide();
        $('.gnb_2').hide();

        // sub_menu 활성화
        $(".top_2").show();
        $(targetDepth2).addClass("on");
        $(targetDepth2).attr("src", $(targetDepth2).attr("src").replace("error.html", "error.html"));
    } else {	// 서브
    	var targetDepth2 = ".gnb_2:eq(" + (mnDepth1 - 1) + ") > li:eq(" + (mnDepth2 - 1) + ") a img:first ";
    	var targetDepth3 = ".gnb_2:eq(" + (mnDepth1 - 1) + ") > li:eq(" + (mnDepth2 - 1) + ") .gnb_3 li:eq(" + (mnDepth3 - 1) + ") a img:first";

        setGnbAll(false);
        // Depth1 활성화
        $("#" + arrGnbD1[mnDepth1]).addClass("on");
        $('.top_2').hide();
        $('.gnb_2').hide();
        $(".gnb_2:eq(" + (mnDepth1 - 1) + ")").show();
        setGnbIE6($("#" + arrGnbD1[mnDepth1]), "12px"); // IE6

        // Depth2 활성화
        $(targetDepth2).addClass("on");
        $(targetDepth2).attr("src", $(targetDepth2).attr("src").replace("error.html", "error.html"));

        // Depth3 활성화
        $(targetDepth3).addClass("on");
        if ($(targetDepth3).attr("src")) {
	        $(targetDepth3).attr("src", $(targetDepth3).attr("src").replace("error.html", "error.html"));
	    }
    }
}

function setGnbAll(flag){
    var i = 0;

    if (flag) {
        for (i=1;i<arrGnbD1.length;i++){
            $("#" + arrGnbD1[i]).addClass("on");
			$("#" + arrGnbD1[i]).parent("li").addClass("on");
            setGnbIE6($("#" + arrGnbD1[i]), "12px"); // IE6
        }
    } else {
        for (i=1;i<arrGnbD1.length;i++){
            $("#" + arrGnbD1[i]).removeClass("on");
			$("#" + arrGnbD1[i]).parent("li").removeClass("on");
            setGnbIE6($("#" + arrGnbD1[i]), "-141px"); // IE6
        }
    }
}

function setGnbIE6(objBg,pos_X){

    var isIE6 = false;

    if(document.all) {
        if (!window.XMLHttpRequest) isIE6 = true;
    }

    if (isIE6){
        var bg_y = objBg.css("background-position-y");
        var bg_id = objBg.attr("id");
        if (bg_id){
            var objTarget = DD.dom.id(bg_id);
            objTarget.style['backgroundPosition'] = pos_X + " " + bg_y;
        }
    }
}
///// GNB Script : END


///// BBS Script : START
function initPage(){
   	$("#Page").val(1);
}

function goPage(p) {
	$("#Page").val(p);
	$("#frmPage").attr({action:window.location.href, method:"post"}).submit();
}

function goDown(seq, fld) {
	$("#dnSeq").val(seq);
	$("#dnFld").val(fld);
	$("#frmDown").attr({action:"/common/FileDown.asp", method:"post"}).submit();
}

function goDownStatic(fname) {
	window.location.href = "common/FileDowna142.html?dnFlag=STATIC&amp;dnFName=" + encodeURIComponent(fname);
}

function goListCommon(url){
	$("#frmPage").attr({action:url, method:"post"}).submit();
}

function goViewCommon(seq, url){
	$("#seq").val(seq);
	$("#frmPage").attr({action:url, method:"post"}).submit();
}


$(function() {
    $("#searchKey").change(initPage);
    $("#searchWord").keydown(initPage);
});
///// BBS Script : End

///// Pattern Check : START
function IsEmail (emailStr) { // E-Mail 체크
	var emailPat=/^(.+)@(.+)$/
	var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
	var validChars="\[^\\s" + specialChars + "\]"
	var firstChars=validChars
	var quotedUser="(\"[^\"]*\")"
	var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
	var atom="(" + firstChars + validChars + "*" + ")"
	var word="(" + atom + "|" + quotedUser + ")"
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")


	var matchArray=emailStr.match(emailPat)
	if (matchArray==null) {
		//alert("@,.")
		return false
	}
	var user=matchArray[1]
	var domain=matchArray[2]

	if (user.match(userPat)==null) {
		//alert("id")
		return false
	}

	var IPArray=domain.match(ipDomainPat)
	if (IPArray!=null) {
		for (var i=1;i<=4;i++) {
			if (IPArray[i]>255) {
				//alert("IP")
				return false
			}
		}
		return true
	}

	var domainArray=domain.match(domainPat)

	if (domainArray==null) {
		//alert("domain")
		return false
	}
	var atomPat=new RegExp(atom,"g")
	var domArr=domain.match(atomPat)
	var len=domArr.length

	if (domArr[domArr.length-1].length<2 ||
		domArr[domArr.length-1].length>3) {
		//alert("country")
		return false
	}

	/*
	if (domArr[domArr.length-1].length==2 && len<3) {
		var errStr="This address ends in two characters, which is a country"
		errStr+=" code. Country codes must be preceded by "
		errStr+="a hostname and category (like com, co, pub, pu, etc.)"
		//alert(errStr)
		return false
	}
	*/

	if (domArr[domArr.length-1].length==3 && len<2) {
		//var errStr="hostname"
		//alert(errStr)
		return false
	}
	return true;
}

function IsSSN(jnum_01, jnum_02) { // 주민등록번호 체크
	check_jumin = false;
	// 잘못된 생년월일 검사.
	b_Year = (jnum_02.charAt(0) <= "2") ? "19" : "20";
	/* 2000년도부터 성구별 번호 변경
	구별수가 2보다 작다면 1900년도 생이되고 2보다 크다면 2000년도 이후.
	단 1800년도 생은 계산에서 제외합니다.*/

	b_Year += jnum_01.substr(0, 2);
	// 생년계산.
	b_Month = jnum_01.substr(2, 2) - 1;
	// 월계산.
	b_Date = jnum_01.substr(4, 2);

	b_sum = new Date(b_Year, b_Month, b_Date);
	if ( b_sum.getYear() % 100 != jnum_01.substr(0, 2) || b_sum.getMonth() != b_Month || b_sum.getDate() != b_Date) {
		return check_jumin;
		// 생년월일의 타당성을 검사하여 거짓이 있을시 에러메세지를 나타냄
	}

	total = 0;
	temp = new Array(13);
	for(i=1; i<=6; i++) temp[i] = jnum_01.charAt(i-1);
	for(i=7; i<=13; i++) temp[i] = jnum_02.charAt(i-7);
	for(i=1; i<=12; i++) {
		k = i + 1;
		if(k >= 10) k = k % 10 + 2;
		/* 각 수와 곱할 수를 뽑아냅니다. 곱수가 만일 10보다 크거나 같다면
		계산식에 의해 2로 다시 시작하게 됩니다. */
		total = total + (temp[i] * k);
		// 각 자리수와 계산수를 곱한값을 변수 total에 누적합산시킵니다.
	}

	last_num = (11- (total % 11)) % 10;
	// 마지막 계산식을 변수 last_num에 대입합니다.
	if(last_num == temp[13]) check_jumin = true;
	// laster_num이 주민번호의마지막수와 같은면 참을 틀리면 거짓을 반환합니다.
	else check_jumin = false;

	return check_jumin;
}

function IsNumerics(checkStr) {
  	var checkOK = "0123456789" ;
  	var isnumeric = false ;

	for (i = 0;  i < checkStr.length;  i++) {
		ch = checkStr.charAt(i) ;

		isnumeric = false ;
		for (j = 0;  j < checkOK.length;  j++) {
			if (ch == checkOK.charAt(j)) {
        		isnumeric = true ;
			}
		}

		if (isnumeric == false)
    		return false ;
	}
	return true;
}
///// Pattern Check : END

/* 브라우져 체크 */
function chkBrowser(){
	var browser;
	if(navigator.userAgent.indexOf("MSIE") != -1){
		browser = "IE";
	}else if(navigator.userAgent.indexOf("Chrome") != -1){
		browser = "CHROME";
	}else if(navigator.userAgent.indexOf('iPhone') != -1 || navigator.userAgent.indexOf('iPad') != -1){
		browser = "IPHONE";
	}else if(navigator.userAgent.indexOf('Android') != -1 || navigator.userAgent.indexOf('Android') != -1){
		browser = "ANDROID";
	}else{
		browser = "OTHER";
	}

	return browser;
}

function getAjaxPage(url ,param, objTarget) {
	$.ajax({
		type: "GET",
		url: url,
		data : param,
		dataType: "html",
		async: false,
		success: function(msg){ objTarget.html(msg);},
		error : function(xhr, status, error){ objTarget.html("[Error] 관련 글을 찾을 수 없습니다.");}
	});
}

// 찾아오시는 길

$(function() {
	$(".building").mouseover(function(){
		$(".tag_off",this).hide();
        $(".tag_on",this).fadeIn();
    });
    $(".building").mouseleave(function(){
        $(".tag_on",this).fadeOut("fast");
        $(".tag_off",this).fadeIn("slow");
    });
    $(".building").focusin(function(){
    	$(".tag_off",this).hide();
	$(".tag_on",this).fadeIn();
	$(this).css("outline", "0");
    });
    $(".building").focusout(function(){
        $(".tag_on",this).hide();
        $(".tag_off",this).show();
    });
});

// 지사 법인

$(function() {
	$(".branchMap .branch").mouseover(function(){
        $(".inner").hide();   // <----추가 부분(한줄만..)
        $(".inner",this).fadeIn("fast");
    });
    $(".branchMap .branch").mouseleave(function(){
        $(".inner",this).hide();
    });
});

//연혁
$(function() {
    $(".decade").find("h4 a").click(function(){
    	$(".decade h4 a").removeClass("on");
    	$(this).addClass("on");
    	$(".decArea").hide()
    	$(this).parent().parent().find(".decArea").show()
     });
     $(".decade .img p").hide();
     $(".decade .img p:eq(0)").show();

});

// 품질경영 tab
$(function() {
    $(".culture .tab03 li.tab0301 a").click(function(){
    	$(".culture .culture_tab > div").hide();
        $(".culture .culture_tab_01").show();
		replaceTab03(1);
     });
    $(".culture .tab03 li.tab0302 a").click(function(){
    	$(".culture .culture_tab > div").hide();
        $(".culture .culture_tab_02").show();
		replaceTab03(2);
     });
    $(".culture .tab03 li.tab0303 a").click(function(){
    	$(".culture .culture_tab > div").hide();
        $(".culture .culture_tab_03").show();
		replaceTab03(3);
     });
    $(".culture .tab03 li.tab0304 a").click(function(){
    	$(".culture .culture_tab > div").hide();
        $(".culture .culture_tab_04").show();
		replaceTab03(4);
     });
});

function replaceTab03(sw) {
	var tab0301 = $(".culture .tab03 li.tab0301 a").find("img").attr("alt");
	var tab0302 = $(".culture .tab03 li.tab0302 a").find("img").attr("alt");
	var tab0303 = $(".culture .tab03 li.tab0303 a").find("img").attr("alt");
	var tab0304 = $(".culture .tab03 li.tab0304 a").find("img").attr("alt");
	var txtTitle = "";

	tab0301 = tab0301.replace("(current tab)", "");
	tab0302 = tab0302.replace("(current tab)", "");
	tab0303 = tab0303.replace("(current tab)", "");
	tab0304 = tab0304.replace("(current tab)", "");

	switch(sw) {
		case 1: {
			tab0301 = tab0301 + "(current tab)";
			txtTitle = "Vision";
			break;
		}
		case 2: {
			tab0302 = tab0302 + "(current tab)";
			txtTitle = "Strategy";
			break;
		}
		case 3: {
			tab0303 = tab0303 + "(current tab)";
			txtTitle = "Approach";
			break;
		}
		case 4: {
			tab0304 = tab0304 + "(current tab)";
			txtTitle = "I.Q. 2015";
			break;
		}
	}

	top.document.title = txtTitle + " < Quality Culture < Management Activity < Quality Management < Management Policy < About us < SK E&C";

	$(".culture .tab03 li.tab0301 a").find("img").attr("alt", tab0301);
	$(".culture .tab03 li.tab0302 a").find("img").attr("alt", tab0302);
	$(".culture .tab03 li.tab0303 a").find("img").attr("alt", tab0303);
	$(".culture .tab03 li.tab0304 a").find("img").attr("alt", tab0304);
}

$(function() {
	$(".culture .tab03 li a").click(function(){
		$(".culture .tab03 li.tab0301 a img").attr("src", $(".culture .tab03 li.tab0301 a img").attr("src").replace("error.html", "error.html"));
		$(".culture .tab03 li.tab0302 a img").attr("src", $(".culture .tab03 li.tab0302 a img").attr("src").replace("error.html", "error.html"));
		$(".culture .tab03 li.tab0303 a img").attr("src", $(".culture .tab03 li.tab0303 a img").attr("src").replace("error.html", "error.html"));
		$(".culture .tab03 li.tab0304 a img").attr("src", $(".culture .tab03 li.tab0304 a img").attr("src").replace("error.html", "error.html"));
		$("img",this).attr("src", $("img",this).attr("src").replace("error.html", "error.html"));
	});
});

$(function() {
	$('table.data tr').find('th:eq(0)').addClass('first');
	$('table.data tr').find('td:eq(0)').addClass('first');

});

// 특화기술
$(function() {
    $(".prize .dlList dt").click(function(){
        $(this).parent().toggleClass("on");
     });
});

$(function() {
    $(".dd_sum ul li").find("a.more").click(function(){
    	$(".layer_dd_sum").hide()
    	$(this).parent().find(".layer_dd_sum").show();
    	$(this).parent().find(".layer_dd_sum .inner1").css("width",$(this).parent().find(".layer_dd_sum .inner1 img:first").width() + 80 + "px");
     });
    $(".layer_dd_sum").find(".close").click(function(){
    	$(this).parent().parent().hide()
     });

});

// 인증서
$(function() {
	 $(".licence").find(".layer_wrap:eq(0) .layer_pop").css("left", "-80px");
	 $(".licence").find(".layer_wrap:eq(1) .layer_pop").css("left", "120px");
	 $(".licence").find(".layer_wrap:eq(2) .layer_pop").css("left", "360px");
	 $(".licence").find(".layer_wrap:eq(3) .layer_pop").css("left", "520px");
});

$(function() {
	$(".licence .layer_pop").hide()
    $(".licence .layer_wrap").find("img:first").click(function(){
    	$(".licence .layer_pop").hide();
    	$(this).parent().parent().find(".layer_pop").show();
    	$(this).parent().parent().find(".layer_pop .inner1").css("width",$(this).parent().parent().find(".layer_pop .inner1 img:first").width() + 80 + "px");
     });
    $(".licence .layer_pop").find(".close").click(function(){
    	$(this).parent().parent().hide()
     });
     $(".licence .layer_pop").click(function(){
    	$(this).hide();
     });

});

$(function() {
	$(".safety .licence .layer_pop").hide()
    $(".safety .licence .layer_wrap").find("img:first").click(function(){
    	$(".safety .licence .layer_pop").hide();
    	$(".safety .licence").css("z-index","2");
    	$(this).parent().parent().parent().css("z-index","3");
    	$(this).parent().parent().find(".layer_pop").show();
    	$(this).parent().parent().find(".layer_pop .inner1").css("width",$(this).parent().parent().find(".layer_pop .inner1 img:first").width() + 80 + "px");
     });
    $(".licence .layer_pop").find(".close").click(function(){
    	$(this).parent().parent().hide();
    	$(this).parent().parent().css("z-index","2");
     });
    $(".licence .layer_pop").click(function(){
    	$(this).hide();
    	$(this).parent().parent().delay(1000).css("z-index","2")
     });

});

// 반복영역 건너뛰기 <body> 바로 다음에 넣기 //
$(function() {

	// 본문 바로가기 //
	var ass = "";
		ass += "<ul class=\"ass\">";
		ass += "<li><a href=\"#contents\">Skip to Content</a></li>";
		ass += "<li><a href=\"#gnb\">Skip to Main menu</a></li>";
		ass += "</ul>";

	var skipBody = jQuery( "body" );

	skipBody.prepend(ass);
	// 본문 바로가기 //

});