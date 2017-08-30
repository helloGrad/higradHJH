$(function() {
	$('#file').change(
			function() {
				// alert($('#file').prop("files")[0].name);
				for (var i = 0; i < $('#file').prop("files").length; i++) {
					$('#apndngfiles').append(
							"<p>" + $('#file').prop("files")[i].name + "</p>")
				}

			});

	$("#prnt")
			.click(
					function() {
						var url = "${pageContext.servletContext.contextPath }/resources/html/child.html"
						window
								.open(url, "childForm",
										"width=450, height=250, resizable = no, scrollbars = no");
					})

})

// function addFile(){
// $('#filetable').append( $('#preset tr').clone() );
// }
