
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
});
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

});

//点击审核
$(".appCheck").on("click", function() {
	var statusname = $(this).attr("statusname");

	if ($(this).attr("status") != 1) {
		alert("该APP应用的状态为：【" + $(this).attr("statusname") + "】,不能进行审核操作！");
	} else if ($(this).attr("versionid") == null || $(this).attr("versionid") == "") {
		alert("该APP应用没有上传最新版本,不能进行审核操作！");
	} else {
		window.location.href = "appCheck?appinfoid=" + $(this).attr("appinfoid") + "&versionid=" + $(this).attr("versionid")
	}
})

