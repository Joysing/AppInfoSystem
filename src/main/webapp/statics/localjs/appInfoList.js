//加载二级列表
$("#queryCategoryLevel1").change(function() {
	var queryCategoryLevel1 = $("#queryCategoryLevel1").val();
	if (queryCategoryLevel1 != null && queryCategoryLevel1 != "") {
		$.ajax({
			type : "GET",
			url : "category.json",
			dataType : "json",
			data : {
				parentId : queryCategoryLevel1
			},
			success : function(data) {
				$("#queryCategoryLevel2").html("");
				var option = "<option value=\"\">请选择</option>";
				for (i = 0; i < data.length; i++) {
					option += "<option value=\"" + data[i].id + "\">" + data[i].categoryName + "</option>";
				}
				$("#queryCategoryLevel2").html(option);
			},
			error : function() {
				alert("分类加载失败");
			}
		})
	} else {
		$("#queryCategoryLevel2").html("<option value=\"\">请选择</option>");
		$("#queryCategoryLevel3").html("<option value=\"\">请选择</option>");
	}
})
//加载三级列表
$("#queryCategoryLevel2").change(function() {
	var queryCategoryLevel2 = $("#queryCategoryLevel2").val();
	if (queryCategoryLevel2 != null && queryCategoryLevel2 != "") {
		$.ajax({
			url : "category.json",
			type : "GET",
			dataType : "json",
			data : {
				parentId : queryCategoryLevel2
			},
			success : function(data) {
				$("#queryCategoryLevel3").html("");
				var option = "<option value=\"\">请选择</option>";
				for (i = 0; i < data.length; i++) {
					option += "<option value=\"" + data[i].id + "\">" + data[i].categoryName + "</option>";
				}
				$("#queryCategoryLevel3").html(option);
			},
			error : function() {
				alert("分类加载失败");
			}
		})
	} else {
		$("#queryCategoryLevel3").html("<option value=\"\">请选择</option>");
	}

})
//查询APP信息
$(".viewApp").on("click", function() {
	var id = $(this).attr("appinfoid");
	window.location.href = "appInfoView?id=" + id;
})

//添加版本
$(".addAppVersion").on("click", function() {
	window.location.href = "addVersion?appInfoId=" + $(this).attr("appInfoId")
})


//修改版本
$(".updateVersion").on("click", function() {
	window.location.href = "updateVersion?appInfoId=" + $(this).attr("appInfoId") + "&versionId=" + $(this).attr("versionId")
})

//修改app信息
$(".update").on("click", function() {
	var status = $(this).attr("status");
	if (status == 2 || status == 4 || status == 5) {
		alert("只有未审核或者审核未通过的可以修改");
	} else {
		window.location.href = "update?appInfoId=" + $(this).attr("appInfoId")
	}
});

//删除APP信息
$(".delAppInfo").on("click", function() {
	if (confirm("你确定要删除APP应用【" + $(this).attr("softwareName") + "】及其所有的版本吗？")) {
		$.ajax({
			type : "GET",
			url : "delapp.json",
			data : {
				id : $(this).attr("appinfoid")
			},
			dataType : "json",
			success : function(data) {
				if (data.delResult == "true") { //删除成功：移除删除行
					$(this).parents("tr").remove();
					alert("删除成功");
				} else if (data.delResult == "false") { //删除失败
					alert("对不起，删除AAP应用【" + $(this).attr("softwareName") + "】失败");
				} else {
					alert("对不起，删除AAP应用【" + $(this).attr("softwareName") + "】失败");
				}
			},
			error : function(data) {
				alert("对不起，删除失败");
			}
		});
	}
});

//上架
$(".soldUp").on("click", function() {
	if (confirm("确定要上架吗???")) {
		var appId = $(this).attr("appinfoid");
		var $show = $("#status" + appId);
		$.ajax({
			url : "soldUp.json",
			dataType : "json",
			type : "get",
			data : {
				id : appId
			},
			success : function(data) {
				if (data.result == "null") {
					alert("APPId不能为空!!!!");
				}
				if (data.result == "false") {
					alert("上架失败!!");
				}
				if (data.result == "true") {
					$show.html("以上架");
					var calssName = "btn btn-info btn-xs";
					$show.addClass(calssName);
					$show.hide();
					$show.slideDown(200);
				}
			}
		})
	}
});

//下架
$(".soldDown").on("click", function() {
	if (confirm("确定要下架吗???")) {
		var appId = $(this).attr("appinfoid");
		var $show = $("#status" + appId);
		$.ajax({
			url : "soldDown.json",
			dataType : "json",
			type : "get",
			data : {
				id : appId
			},
			success : function(data) {
				if (data.result == "null") {
					alert("APPId不能为空!!!!");
				}
				if (data.result == "false") {
					alert("下架失败!!");
				}
				if (data.result == "true") {
					$show.html("以下架");
					var calssName = "btn btn-success btn-xs";
					$show.addClass(calssName);
					$show.hide();
					$show.slideDown(200);
				}
			}
		})
	}
});