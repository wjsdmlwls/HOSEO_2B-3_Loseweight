<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>

</style>
<!--slide-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.slim.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<!--slide end-->
<div>

	<div class="picDiv">

		<img id="picture_preview" src="" alt="" style="display:none; width:600px; height:600px; z-index:-1;" />

	</div>



	<input type="text" name="imgfile_set" id="imgfile_set" style="width:30%;" value="" disabled>

	<div style="position:relative; display:inline; top:0px; left:0px; width:70px; height:25px; cursor:pointer;">

		<input type="button" style="width:70px; height:25px;" value="찾아보기" />

		<input type="file" name="imgfile" id="imgfile" style="position:absolute; top:-4px; left:0px; z-index:100; filter:alpha(opacity:0); opacity:0; width:70px; height:25px; cursor:pointer;" onchange="document.getElementById('imgfile_set').value=this.value;" />

	</div>

</div>



<script type="text/javascript">

	$(function(){

		var opt = {

			img: $('#picture_preview'),

			w: 200,

			h: 200

		};

	 

		$('#imgfile').setPreview(opt);

	});



	$.fn.setPreview = function(opt){

		"use strict"

		var defaultOpt = {

			inputFile: $(this),

			img: null,

			w: 600,

			h: 600

		};

		$.extend(defaultOpt, opt);

	 

		var previewImage = function(){

			if (!defaultOpt.inputFile || !defaultOpt.img) return;

	 

			var inputFile = defaultOpt.inputFile.get(0);

			var img       = defaultOpt.img.get(0);

	 

			// FileReader

			if (window.FileReader) {

				// image 파일만

				if (!inputFile.files[0].type.match(/image\//)) return;

	 

				// preview

				try {

					var reader = new FileReader();

					reader.onload = function(e){

						img.src = e.target.result;

						img.style.width  = '600px';

						img.style.height = '600px';

						img.style.display = '';

					}

					reader.readAsDataURL(inputFile.files[0]);

				} catch (e) {

					// exception...

				}

			// img.filters (MSIE)

			} else if (img.filters) {

				inputFile.select();

				inputFile.blur();

				var imgSrc = document.selection.createRange().text;

	 

				img.style.width  = '600px';

				img.style.height = '600px';

				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";           

				img.style.display = '';

			// no support

			} else {

				// Safari5, ...

			}

		};

	 

		// onchange

		$(this).change(function(){

			previewImage();

		});

	};

</script>




</body>
</html>