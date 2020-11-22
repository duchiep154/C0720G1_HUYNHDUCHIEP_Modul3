package model;

public class Land {
    private String id;
    private String area;
    private String floor;
    private String price;
    private String startDate;
    private String endDate;
    private String idLandType;
    private String idLandStatus;

    public Land() {
    }

    public Land(String id, String area, String floor, String price, String startDate, String endDate, String idLandType, String idLandStatus) {
        this.id = id;
        this.area = area;
        this.floor = floor;
        this.price = price;
        this.startDate = startDate;
        this.endDate = endDate;
        this.idLandType = idLandType;
        this.idLandStatus = idLandStatus;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getIdLandType() {
        return idLandType;
    }

    public void setIdLandType(String idLandType) {
        this.idLandType = idLandType;
    }

    public String getIdLandStatus() {
        return idLandStatus;
    }

    public void setIdLandStatus(String idLandStatus) {
        this.idLandStatus = idLandStatus;
    }
}
