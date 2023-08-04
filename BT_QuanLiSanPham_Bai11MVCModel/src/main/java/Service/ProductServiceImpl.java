package Service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer,Product> products;
    static {
        products = new HashMap<>();
        products.put(1,new Product("productA",200,"motaA","NhaSX_A"));
        products.put(2,new Product("productB",300,"motaB","NhaSX_B"));
        products.put(3,new Product("productC",400,"motaC","NhaSX_C"));
        products.put(4,new Product("productD",500,"motaD","NhaSX_D"));
        products.put(5,new Product("productE",600,"motaE","NhaSX_E"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }
    @Override
    public List<Product> Search(String nameProduct){
        List<Product> products1 = new ArrayList<>();
        List<Product> products2 = findAll();
        for (Product p:products2) {
            if (p.getNameProduct().equals(nameProduct)){
                products1.add(p);
            }
        }
        return products1;
    }

}
