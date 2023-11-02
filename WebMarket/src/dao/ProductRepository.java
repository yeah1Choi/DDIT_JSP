package dao;

import java.util.ArrayList;

import vo.Product;

public class ProductRepository {
	// 상품 모두를 가지고 있을 리스트
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();

	// 싱글톤 적용
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance() {
		return instance;
	}

	public ProductRepository() {
		Product phone = new Product("P1234", "iphone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");

		Product laptop = new Product("P1235", "LG PC Gram", 1500000);
		laptop.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core Processors");
		laptop.setCategory("Laptop");
		laptop.setManufacturer("LG");
		laptop.setUnitsInStock(1000);
		laptop.setCondition("Refurbished");

		Product tablit = new Product("P1236", "Galaxy Tab 5", 900000);
		tablit.setDescription("212.8*125.6*6mm, Super AMOLED display, Octa-Core processors");
		tablit.setCategory("Tablet");
		tablit.setManufacturer("Samsung");
		tablit.setUnitsInStock(1000);
		tablit.setCondition("Old");

		listOfProducts.add(phone);
		listOfProducts.add(laptop);
		listOfProducts.add(tablit);
	}

	// 상품 전체 목록 가져오기
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	// 하나의 상품 가져오기
	public Product getProductById(String productId) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	// 상품 등록
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}