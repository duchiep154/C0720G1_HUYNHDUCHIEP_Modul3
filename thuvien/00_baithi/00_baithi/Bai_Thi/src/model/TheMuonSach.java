package model;

public class TheMuonSach {
    private String id;
    private int sachId;
    private int hocSinhId;
    private boolean trangThai;
    private String ngayMuon;
    private String ngayTra;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getSachId() {
        return sachId;
    }

    public void setSachId(int sachId) {
        this.sachId = sachId;
    }

    public int getHocSinhId() {
        return hocSinhId;
    }

    public void setHocSinhId(int hocSinhId) {
        this.hocSinhId = hocSinhId;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }

    public String getNgayMuon() {
        return ngayMuon;
    }

    public void setNgayMuon(String ngayMuon) {
        this.ngayMuon = ngayMuon;
    }

    public String getNgayTra() {
        return ngayTra;
    }

    public void setNgayTra(String ngayTra) {
        this.ngayTra = ngayTra;
    }

    public TheMuonSach() {
    }

    public TheMuonSach(String id, int sachId, int hocSinhId, boolean trangThai, String ngayMuon, String ngayTra) {
        this.id = id;
        this.sachId = sachId;
        this.hocSinhId = hocSinhId;
        this.trangThai = trangThai;
        this.ngayMuon = ngayMuon;
        this.ngayTra = ngayTra;
    }
}
