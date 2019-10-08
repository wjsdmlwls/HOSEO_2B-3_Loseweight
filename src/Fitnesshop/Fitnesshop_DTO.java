package Fitnesshop;

import java.sql.Timestamp;

public class Fitnesshop_DTO {
	private int lw_salesnum;
	private String product_code;
	private int cost;
	private int selling_price;
	private int reduced_price;
	private String product_name ;
	private String product_contents;
	private int quantity;
	private String big_category;
	private String middle_category;
	private String small_category;
	private String brand;
	private int delivery_charge;
	private int pointplus;
	private String img0;
	private int exposure;
	private int salestatus;
	private int productevent;
	private String option1;
	private int option1price;
	private String option2;
	private int option2price;
	private String option3;
	private int option3price;
	
	
	
	
	
	private Timestamp write_date;
	private String lw_id;
	private String passwd;
	
	

	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getBig_category() {
		return big_category;
	}
	public void setBig_category(String big_category) {
		this.big_category = big_category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getDelivery_charge() {
		return delivery_charge;
	}
	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
	}
	public String getImg0() {
		return img0;
	}
	public void setImg0(String img0) {
		this.img0 = img0;
	}
	public int getExposure() {
		return exposure;
	}
	public void setExposure(int exposure) {
		this.exposure = exposure;
	}
	public int getLw_salesnum() {
		return lw_salesnum;
	}
	public void setLw_salesnum(int lw_salesnum) {
		this.lw_salesnum = lw_salesnum;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public int getSelling_price() {
		return selling_price;
	}
	public void setSelling_price(int selling_price) {
		this.selling_price = selling_price;
	}
	public int getReduced_price() {
		return reduced_price;
	}
	public void setReduced_price(int reduced_price) {
		this.reduced_price = reduced_price;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_contents() {
		return product_contents;
	}
	public void setProduct_contents(String product_contents) {
		this.product_contents = product_contents;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getMiddle_category() {
		return middle_category;
	}
	public void setMiddle_category(String middle_category) {
		this.middle_category = middle_category;
	}
	public String getSmall_category() {
		return small_category;
	}
	public void setSmall_category(String small_category) {
		this.small_category = small_category;
	}
	public int getPointplus() {
		return pointplus;
	}
	public void setPointplus(int pointplus) {
		this.pointplus = pointplus;
	}
	public int getSalestatus() {
		return salestatus;
	}
	public void setSalestatus(int salestatus) {
		this.salestatus = salestatus;
	}
	public int getProductevent() {
		return productevent;
	}
	public void setProductevent(int productevent) {
		this.productevent = productevent;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public int getOption1price() {
		return option1price;
	}
	public void setOption1price(int option1price) {
		this.option1price = option1price;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public int getOption2price() {
		return option2price;
	}
	public void setOption2price(int option2price) {
		this.option2price = option2price;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public int getOption3price() {
		return option3price;
	}
	public void setOption3price(int option3price) {
		this.option3price = option3price;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
	public String getPasswd() {
		return passwd;
	}
	public String getLw_id() {
		return lw_id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setLw_id(String lw_id) {
		this.lw_id = lw_id;
	}

	
}
