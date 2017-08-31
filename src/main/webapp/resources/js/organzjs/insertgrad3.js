
var results;
var availableTags=new Array();
var resultSet = new Array();
var NoResultsMsg = "검색 결과가 없음";
var index=0;
var checkList = [];
var testList = ['1','2','3','가'];
var clickDelete=function(id){
	//선택제거되면 리스트에 다시 추가
	$("#"+id).remove();
}

var checkDuplicate = function(name){
	
	for(var i=0;i<checkList.length;i++){
		if(checkList[i]===name){
			return true;
		}
	}
	return false;
	
}

var fetchListByType=function(type){
	

	
	$.ajax({
		url : "/admin/organz/api/getcode?type="+type,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			console.log(response.data)
			for(var i=0;i<response.data.length;i++){
				resultSet = response.data;
				availableTags.push(resultSet[i]["cdNm"]);
			}
		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
		}
	});
	
};

var findNo=function(name){
	for(var i=0;i<availableTags.length;i++){
		if(availableTags[i]===name){
			return i;
		}
	}
}

$(function () {
	
	var type = $("#type").val();
	if(type=="학과"||type=="연구실"){
		fetchListByType(type);
	}

            $.extend($.ui.autocomplete.prototype, {
                _renderMenu: function (ul, items) {
                    //remove scroll event to prevent attaching multiple scroll events to one container element
                    $(ul).unbind("scroll");
                    var self = this;
                    self._scrollMenu(ul, items);
                    
                },

                _scrollMenu: function (ul, items) {
                    var self = this;
                    var maxShow = 5;
                    var results = [];
                    var pages = Math.ceil(items.length / maxShow);
                    results = items.slice(0, maxShow);

                    
                    if (pages > 1) {
                        $(ul).scroll(function () {
                            if (isScrollbarBottom($(ul))) {
                                ++window.pageIndex;
                                if (window.pageIndex >= pages) return;

                                results = items.slice(window.pageIndex * maxShow, window.pageIndex * maxShow + maxShow);

                                //append item to ul
                                $.each(results, function (index, item) {
                                	console.log("index111",index);
                                	console.log("item1111>>", item)
                                	console.log(ul)
                                    self._renderItemData(ul, item);
                                });
                                
                                console.log("ul>>id", $(ul).attr('id'));
                                $('#' + $(ul).attr('id') + " li").addClass('ui-menu-item');
                                $( ul ).find( "li div" ).addClass( "ui-menu-item-wrapper" );
                                //refresh menu
                                console.log("123>>",self.menu)
                                if (typeof(self.menu.deactivate) == "function")
                                	self.menu.deactivate();
                                
                                self.menu.refresh();
                                // size and position menu
                                ul.show();
                                self._resizeMenu();
                                ul.position($.extend({
                                    of: self.element
                                }, self.options.position));
                                if (self.options.autoFocus) {
                                    self.menu.next(new $.Event("mouseover"));
                                }
                            }
                        });
                    }

                    $.each(results, function (index, item) {
                    	console.log("index222",index);
                    	console.log("item222>>", item)

                    	$(item).addClass("ui-menu-item");
                        self._renderItemData(ul, item);
                    });
                }
            });
            
            function isScrollbarBottom(container) {
                 var height = container.outerHeight();
                 var scrollHeight = container[0].scrollHeight;
                 var scrollTop = container.scrollTop();
                 if (scrollTop >= scrollHeight - height) {
                     return true;
                 }
                 return false;
             };
    
            $("#tags").autocomplete({
            	source: function(request, response) {
            		$("#duplicateMsg").css("display","none");
            		
                    results = $.ui.autocomplete.filter(availableTags, request.term);
                    if (!results.length) {
                        results = [NoResultsMsg];
                    }
                    response(results);
                    
                },
                select:function(event, ui, request, response){
                	console.log(ui)
                },
                minLength: 0,
                delay: 0
            }).focus(function () {
                window.pageIndex = 0;
                $(this).autocomplete("search");
            });
 });