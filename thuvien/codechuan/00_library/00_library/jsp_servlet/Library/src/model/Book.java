package model;

public class Book {
    private int id;
    private String name;
    private double cost;
    private String description;
    private int categoryId;
    private int authorId;
    private int publisherId;

    public Book() {
    }

    public Book(int id, String name, double cost, String description, int categoryId, int authorId, int publisherId) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.description = description;
        this.categoryId = categoryId;
        this.authorId = authorId;
        this.publisherId = publisherId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }
}
