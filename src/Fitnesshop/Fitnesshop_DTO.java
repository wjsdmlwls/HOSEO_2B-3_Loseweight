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
	private Timestamp write_date;
	
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
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
}
