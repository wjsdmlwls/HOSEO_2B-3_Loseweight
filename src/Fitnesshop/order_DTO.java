package Fitnesshop;
import java.sql.Timestamp;

public class order_DTO {
	private int ordernum;      				   /*구매 번호*/
	private String product_names;			   /*총 상품 이름*/
	private String img0; 					   /*대표 이미지 1개 상품 이미지*/
	private int total_money;				   /*총 가격*/
	private int pointplus;					   /*적립금*/
	private int cardnum;					   /*카드번호*/
	private int lw_point;					   /*사용 포인트*/
	private int payment;					   /*결제 방법*/
	private String addr;				  	   /*배송지 */
	private String Recipient;				   /*수령인*/
	private String demand;					   /*요구사항*/
	private int orderstatus;				   /*결제 상태*/
	private String lw_id;					   /*구매자 아이디*/
	private Timestamp order_time;			   /*주문 날짜*/

	private int product_total;				   /*결제 상태*/
	private int delivery_total;				   /*결제 상태*/
	
	public int getProduct_total() {
		return product_total;
	}
	public void setProduct_total(int product_total) {
		this.product_total = product_total;
	}
	public int getDelivery_total() {
		return delivery_total;
	}
	public void setDelivery_total(int delivery_total) {
		this.delivery_total = delivery_total;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public String getProduct_names() {
		return product_names;
	}
	public String getImg0() {
		return img0;
	}
	public int getTotal_money() {
		return total_money;
	}
	public int getPointplus() {
		return pointplus;
	}
	public int getCardnum() {
		return cardnum;
	}
	public int getLw_point() {
		return lw_point;
	}
	public int getPayment() {
		return payment;
	}
	public String getAddr() {
		return addr;
	}
	public String getRecipient() {
		return Recipient;
	}
	public String getDemand() {
		return demand;
	}
	public int getOrderstatus() {
		return orderstatus;
	}
	public String getLw_id() {
		return lw_id;
	}
	public Timestamp getOrder_time() {
		return order_time;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public void setProduct_names(String product_names) {
		this.product_names = product_names;
	}
	public void setImg0(String img0) {
		this.img0 = img0;
	}
	public void setTotal_money(int total_money) {
		this.total_money = total_money;
	}
	public void setPointplus(int pointplus) {
		this.pointplus = pointplus;
	}
	public void setCardnum(int cardnum) {
		this.cardnum = cardnum;
	}
	public void setLw_point(int lw_point) {
		this.lw_point = lw_point;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setRecipient(String recipient) {
		Recipient = recipient;
	}
	public void setDemand(String demand) {
		this.demand = demand;
	}
	public void setOrderstatus(int orderstatus) {
		this.orderstatus = orderstatus;
	}
	public void setLw_id(String lw_id) {
		this.lw_id = lw_id;
	}
	public void setOrder_time(Timestamp order_time) {
		this.order_time = order_time;
	}

}
