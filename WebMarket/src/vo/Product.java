package vo;

public class Product {
	private String productId; 			// 상품아이디
	private String pname; 				// 상품명
	private Integer uniPrice ; 			// 상품가격
	private String description; 		// 상품설명
	private String manufacturer; 		// 제조사
	private String category; 			// 카테고리(분류)
	private long unitsInStock; 			// 재고수
	private String condition; 			// 신상품 / 중고품 / 재생품
	private String filename; 			// 이미지 파일명
	private int quantity; 				// 장바구니에 담은 개수
	
	public Product() {}
	
	public Product(String productId,  String pname, Integer uniPrice) {
		this.productId = productId;
		this.pname = pname;
		this.uniPrice = uniPrice;
	}
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Integer getUniPrice() {
		return uniPrice;
	}
	public void setUniPrice(Integer uniPrice) {
		this.uniPrice = uniPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
