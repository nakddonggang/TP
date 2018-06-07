$.extend({
	// Create a jquery style modal confirm dialog
	// Usage:
	//    $.confirm(
	//        "message",
	//        "title",
	//        function() { /* Ok action here*/
	//        });
	Confirm : function(message, okAction) {
		$("<div></div>").dialog({
			// Remove the closing 'X' from the dialog
			open : function(event, ui) {
				$(".ui-dialog-titlebar-close").hide();
			},
			buttons : {
				"Ok" : function() {
					$(this).dialog("close");
					okAction();
				},
				"Cancel" : function() {
					$(this).dialog("close");
				}
			},
			close : function(event, ui) {
				$(this).remove();
			},
			resizable : false,
			title : "경고",
			modal : true
		}).text(message);
	},
	Alert : function(message, okAction) {
		$("<div></div>").dialog({
			buttons : {
				"Ok" : function() {
					$(this).dialog("close");
					okAction();
				}
			},
			close : function(event, ui) {
				$(this).remove();
			},
			resizable : false,
			title : "경고",
			modal : true
		}).text(message);
	}
});