<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.Timestamp" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
    <%@ page import = "Fitnesshop.order_DAO" %>
    <%@ page import = "Fitnesshop.sanpum_DAO" %>
    <%@ page import = "user.*"%>
    
    <%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="sanpum_DTO"  scope="page" class="Fitnesshop.sanpum_DTO">
   <jsp:setProperty name="sanpum_DTO" property="*"/>
</jsp:useBean>

<jsp:useBean id="user"  scope="page" class="user.User">
   <jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%
    //마일리지
	int lw_lpminor = Integer.parseInt(request.getParameter("lw_lpminor"));
	int lw_lp = Integer.parseInt(request.getParameter("lw_lp"));

	//상세정보 리퀘스트
	SimpleDateFormat date = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");

    String product_names = request.getParameter("product_names");
    String img0 = request.getParameter("img0");
    int total_money = Integer.parseInt(request.getParameter("total_money"));
    int product_total = Integer.parseInt(request.getParameter("product_total"));
    int delivery_total = Integer.parseInt(request.getParameter("delivery_total"));
    
    
    int payment = Integer.parseInt(request.getParameter("payment"));
    String lw_zipcode = request.getParameter("lw_zipcode");
    String lw_addr1 = request.getParameter("lw_addr1");
    String lw_addr2 = request.getParameter("lw_addr2");
    
    String Recipient = request.getParameter("Recipient");
    String demand = request.getParameter("demand");
    
	String lw_id = request.getParameter("lw_id");

	//구입 시간 
	Timestamp time = new Timestamp(System.currentTimeMillis());
	String order_times = date.format(time);
	Timestamp order_time = Timestamp.valueOf(order_times);
	
	//구매제품 리퀘스트	
	String[] lw_salesnum = request.getParameterValues("lw_salesnum");
	String[] imgs = request.getParameterValues("imgs");
	
	String[] product_name = request.getParameterValues("product_name");
	String[] selling_price = request.getParameterValues("selling_price");
	String[] delivery_charge = request.getParameterValues("delivery_charge");
	String[] quantity = request.getParameterValues("quantity");	
	String[] option1 = request.getParameterValues("option1");	
	String[] option1price = request.getParameterValues("option1price");		
	

%>
<%
//상품 테이블 insert 
order_DAO dbPro = order_DAO.getInstance(); 
dbPro.userdatein(product_names,img0,total_money,payment,lw_addr1,Recipient,demand,lw_id,order_time,product_total,delivery_total,lw_addr2,lw_zipcode);

//상품테이블과 주문내역을 연동시킬 번호
 int ordernum = dbPro.selectordernum(lw_id,order_time);

	
	sanpum_DAO dbPros = sanpum_DAO.getInstance(); 


 for(int i = 0 ; i < imgs.length ; i++){
	sanpum_DTO.setOrdernum(ordernum);
	sanpum_DTO.setLw_id(lw_id);
	sanpum_DTO.setLw_salesnum(Integer.parseInt(lw_salesnum[i]));
	sanpum_DTO.setImg0(imgs[i]);
	sanpum_DTO.setProduct_name(product_name[i]);
	sanpum_DTO.setQuantity(Integer.parseInt(quantity[i]));
	sanpum_DTO.setSelling_price(Integer.parseInt(selling_price[i]));
	sanpum_DTO.setOption1(option1[i]);
	sanpum_DTO.setOption1price(Integer.parseInt(option1price[i]));
	sanpum_DTO.setDelivery_charge(Integer.parseInt(delivery_charge[i]));
	
	
    dbPros.insertsanpum(sanpum_DTO);   
}  
	//마일리지 연산
	user.setLw_lp((lw_lp)-(lw_lpminor)); 
 	
 	UserDAO db2= UserDAO.getInstance(); 
 	db2.updatelp(user);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoseWeight</title>
</head>
<body>
<%=product_names%><br>
<%=img0%><br>
<%=total_money%><br>
<%=lw_addr1%><br>
<%=lw_addr2%><br>
<%=lw_zipcode%><br>
<%=Recipient%><br>
<%=demand%><br>
<%=payment%><br><br>
연동할 번호 <%= ordernum%>


</body>
</html>