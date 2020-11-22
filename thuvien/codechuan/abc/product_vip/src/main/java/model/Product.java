package model;

public class Product {
    private String id;
    private String name;
    private String price;
    private String quantity;
    private String idColor;

    public Product(String name, String price, String quantity, String idColor, String description, String idCategory) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.idColor = idColor;
        this.description = description;
        this.idCategory = idCategory;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    private String description;
    private String idCategory;

    public Product() {
    }

    public Product(String id, String name, String price, String quantity, String idColor, String description, String idCategory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.idColor = idColor;
        this.description = description;
        this.idCategory = idCategory;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getIdColor() {
        return idColor;
    }

    public void setIdColor(String idColor) {
        this.idColor = idColor;
    }

    public String getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(String idCategory) {
        this.idCategory = idCategory;
    }
}
