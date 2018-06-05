/* 
	jQuery Alert 1.0
	http://ekfqkqhd.tistory.com
*/
;(function($){
	jQuery.Alert = function (options) {
		var $messageBox = $.parseHTML('<div id="alertBox"></div>');
		$("body").append($messageBox);

		$.Alert.options = {
			Title : "경고창",
			Message : "메세지",
			ModalLayer : true,
			ButtonText : "Ok",
			AutoClose : false,
			OpenCallback : function(){

			},
			CloseCallBack : function(){
				
			}
		}					
		
		if(typeof options == 'object'){
			options = $.extend($.Alert.options,options);	
		}else{
			$.Alert.options.Message = options;
		}
		
		var b = $.Alert.options.ButtonText;
		var buttonOpts = {};
		buttonOpts[b] = function(){
			$("#alertBox").dialog("close");
		}

		$($messageBox).dialog({
			open: function(event,ui){
				$($messageBox).append($.Alert.options.Message)
				if($.Alert.options.AutoClose){
					setTimeout(function(){
						$($messageBox).dialog("close");
					},3000);
				}
				$.Alert.options.OpenCallback();
			},
			title: $.Alert.options.Title,
			autoOpen: true,
			modal: $.Alert.options.ModalLayer,
			buttons: buttonOpts,
			close : function(){
				$.Alert.options.CloseCallBack();
			}
		});
	};
})(jQuery);