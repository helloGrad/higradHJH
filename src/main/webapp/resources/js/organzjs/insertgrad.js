var codeList1 = new Array();

$(function() {

	var type = $("#type").val()

	if (type == "학과" || type == "연구실") {
		fetchListByType(type);
	}
	autoComplete(); 

});


