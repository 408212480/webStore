package bean;

public class Che {
	private String name;
	private Integer count;
	private Double price;
	private Double sum;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getSum() {
		this.sum= this.count*this.price*1.0;
		return sum;
	}
	public void setSum(Double sum) {
		this.sum= this.count*this.price*1.0;
		this.sum = sum;
	}
	
	
}
