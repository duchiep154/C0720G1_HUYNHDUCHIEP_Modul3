package model;

public class Book {
    private int id;
    private String name;
    private String tacgia;
    private String mota;
    private String soluong;

    public Book(int id, String name, String tacgia, String mota, String soluong) {
        this.id = id;
        this.name = name;
        this.tacgia = tacgia;
        this.mota = mota;
        this.soluong = soluong;
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

    public String getTacgia() {
        return tacgia;
    }

    public void setTacgia(String tacgia) {
        this.tacgia = tacgia;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public String getSoluong() {
        return soluong;
    }

    public void setSoluong(String soluong) {
        this.soluong = soluong;
    }
}
