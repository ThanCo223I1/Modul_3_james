package Service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    List<Product> Search(String string);

    void save(Product product);

    void update(int id, Product product);

    void remove(int id);
    Product findById(int id);

}
