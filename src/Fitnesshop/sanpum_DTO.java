package Fitnesshop;

public class sanpum_DTO {
	private int ordernum; 						  /*참조키  = 구매 번호*/
	private String lw_id;
	
	private int lw_salesnum; 
	private int quantity;   /*수량*/
	private int selling_price;   /*수량*/
	private String product_name;
	private int delivery_charge; /*배송비*/
	private String img0; 
	private String option1; 
	private int option1price;
	private String option2;
	private int option2price;
	private String option3; 
	private int option3price;
	private int obj_order_num;
	private int orderstatus;
	
	public int getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(int orderstatus) {
		this.orderstatus = orderstatus;
	}
	public int getSelling_price() {
		return selling_price;
	}
	public void setSelling_price(int selling_price) {
		this.selling_price = selling_price;
	}
	
	public int getObj_order_num() {
		return obj_order_num;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public int getLw_salesnum() {
		return lw_salesnum;
	}
	public int getQuantity() {
		return quantity;
	}
	public String getProduct_name() {
		return product_name;
	}
	public int getDelivery_charge() {
		return delivery_charge;
	}
	public String getImg0() {
		return img0;
	}
	public String getOption1() {
		return option1;
	}
	public int getOption1price() {
		return option1price;
	}
	public String getOption2() {
		return option2;
	}
	public int getOption2price() {
		return option2price;
	}
	public String getOption3() {
		return option3;
	}
	public int getOption3price() {
		return option3price;
	}
	public void setObj_order_num(int obj_order_num) {
		this.obj_order_num = obj_order_num;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public void setLw_salesnum(int lw_salesnum) {
		this.lw_salesnum = lw_salesnum;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
	}
	public void setImg0(String img0) {
		this.img0 = img0;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public void setOption1price(int option1price) {
		this.option1price = option1price;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public void setOption2price(int option2price) {
		this.option2price = option2price;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public void setOption3price(int option3price) {
		this.option3price = option3price;
	}
	
	public String getLw_id() {
		return lw_id;
	}
	public void setLw_id(String lw_id) {
		this.lw_id = lw_id;
	}

}
