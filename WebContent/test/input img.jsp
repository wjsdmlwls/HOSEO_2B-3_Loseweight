<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<script src="js/jquery.MultiFile.js"></script>
	<script>
	
		$(function(){ // wait for page to load
		  $('input.afile3').MultiFile({
			max: 3, //���ε� �ִ� ���� ���� (�������� ������ ���Ѵ�)
			accept: 'jpg|png|gif', //����� Ȯ����(�������� ������ ��� Ȯ���� ���)
			maxfile: 1024, //�� ���� �ִ� ���ε� ũ��
			maxsize: 3024,  //��ü ���� �ִ� ���ε� ũ��
			STRING: { //Multi-lingual support : �޽��� ���� ����
				remove : "����", //�߰��� ���� ���� ����, �̹��±׸� ����ϸ� �̹�����밡��
				duplicate : "$file �� �̹� ���õ� �����Դϴ�.", 
				denied : "$ext ��(��) ���ε� �Ҽ� ���� ����Ȯ�����Դϴ�.",
 			    selected:'$file �� �����߽��ϴ�.', 
				toomuch: "���ε��� �� �ִ� �ִ�ũ�⸦ �ʰ��Ͽ����ϴ�.($size)", 
				toomany: "���ε��� �� �ִ� �ִ� ������ $max�� �Դϴ�.",
				toobig: "$file �� ũ�Ⱑ �ſ� Ů�ϴ�. (max $size)"
			},
			list:"#afile3-list" //���ϸ���� ����� ��� ��������
			
			//������ �̺�Ʈ�� ���� ��ũ�� ó���� �Ҽ��ִ�.
			/*
			,onFileRemove: function(element, value, master_element) {
			  $('#afile3-list').append('<li>onFileRemove - ' + value + '</li>')
			},
			afterFileRemove: function(element, value, master_element) {
			  $('#afile3-list').append('<li>afterFileRemove - ' + value + '</li>')
			},
			onFileAppend: function(element, value, master_element) {
			  $('#afile3-list').append('<li>onFileAppend - ' + value + '</li>')
			},
			afterFileAppend: function(element, value, master_element) {
			  $('#afile3-list').append('<li>afterFileAppend - ' + value + '</li>')
			},
			onFileSelect: function(element, value, master_element) {
			  $('#afile3-list').append('<li>onFileSelect - ' + value + '</li>')
			},
			afterFileSelect: function(element, value, master_element) {
			  $('#afile3-list').append('<li>afterFileSelect - ' + value + '</li>')
			},
			onFileInvalid: function(element, value, master_element) {
			  $('#afile3-list').append('<li>onFileInvalid - ' + value + '</li>')
			},
			onFileDuplicate: function(element, value, master_element) {
			  $('#afile3-list').append('<li>onFileDuplicate - ' + value + '</li>')
			},
			onFileTooMany: function(element, value, master_element) {
			  $('#afile3-list').append('<li>onFileTooMany - ' + value + '</li>')
			},
			onFileTooBig: function(element, value, master_element) {
			  $('#afile3-list').append('<li>onFileTooBig - ' + value + '</li>')
			},
			onFileTooMuch: function(element, value, master_element) {
			  $('#afile3-list').append('<li>onFileTooMuch - ' + value + '</li>')
			}
			*/

		  });

		});
	</script>
<!--slide-->
<body>

 1.  <input type="file" class="multi with-preview" multiple />
 
 
 <input type="file" class="afile3 with-preview" />
 <div id="afile3-list" style="border:2px solid #c9c9c9;min-height:50px"></div>
 <br/>
</body>
</html>