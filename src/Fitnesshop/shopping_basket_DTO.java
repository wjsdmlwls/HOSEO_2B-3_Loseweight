package Fitnesshop;

import java.sql.Timestamp;

public class shopping_basket_DTO {
	private int num;
	private int lw_salesnum;
	private String lw_id;
	private Timestamp reg_date;
	private String product_name ;
	private int quantity;
	private String link;
	private int cost;
	private int selling_price;
	private int reduced_price;
	private int delivery_charge ;

	private String img0;
	public String getImg0() {
		return img0;
	}
	public void setImg0(String img0) {
		this.img0 = img0;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getLw_salesnum() {
		return lw_salesnum;
	}
	public void setLw_salesnum(int lw_salesnum) {
		this.lw_salesnum = lw_salesnum;
	}
	public String getLw_id() {
		return lw_id;
	}
	public void setLw_id(String lw_id) {
		this.lw_id = lw_id;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
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
	public int getDelivery_charge() {
		return delivery_charge;
	}
	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
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
	public String getBig_category() {
		return big_category;
	}
	public void setBig_category(String big_category) {
		this.big_category = big_category;
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
	private String option1;
	private int option1price;
	private String big_category ;
	private String middle_category ;
	private String small_category ;
	
}
