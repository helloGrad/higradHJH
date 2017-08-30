var openWin;

function openOrganzSearch(type) {
	console.log(type);
	window.name = "parentForm";
	openWin = window.open("/admin/organz/search?type=" + type, "childForm",
			"width=570, height=350, resizable = no, scrollbars = no");
}