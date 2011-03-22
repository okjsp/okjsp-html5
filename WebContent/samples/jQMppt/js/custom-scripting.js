
$(document).bind("mobileinit", function(){	
	//alert('mobileinit event start:'+$.mobile.subPageUrlKey);
	var bar = 'tmp';

	//$.mobile object를 이용하여 extend 시켜 사용
	$.extend(  $.mobile , {
	    foo: bar
	});
	//또는 개별적으로도 설정 가능
	$.mobile.foo = bar;
	
});	