package model;

public class BenhAn {
    private String maBenhAn;
    private String maBenhNhan;
    private String ngayNhapVien;
    private String ngayRaVien;
    private String lyDo;
    private String phuongPhapTri;
    private String bacSi;

    public BenhAn() {
    }

    public BenhAn(String maBenhAn, String maBenhNhan, String ngayNhapVien, String ngayRaVien, String lyDo, String phuongPhapTri, String bacSi) {
        this.maBenhAn = maBenhAn;
        this.maBenhNhan = maBenhNhan;
        this.ngayNhapVien = ngayNhapVien;
        this.ngayRaVien = ngayRaVien;
        this.lyDo = lyDo;
        this.phuongPhapTri = phuongPhapTri;
        this.bacSi = bacSi;
    }

    public String getMaBenhAn() {
        return maBenhAn;
    }

    public void setMaBenhAn(String maBenhAn) {
        this.maBenhAn = maBenhAn;
    }

    public String getMaBenhNhan() {
        return maBenhNhan;
    }

    public void setMaBenhNhan(String maBenhNhan) {
        this.maBenhNhan = maBenhNhan;
    }

    public String getNgayNhapVien() {
        return ngayNhapVien;
    }

    public void setNgayNhapVien(String ngayNhapVien) {
        this.ngayNhapVien = ngayNhapVien;
    }

    public String getNgayRaVien() {
        return ngayRaVien;
    }

    public void setNgayRaVien(String ngayRaVien) {
        this.ngayRaVien = ngayRaVien;
    }

    public String getLyDo() {
        return lyDo;
    }

    public void setLyDo(String lyDo) {
        this.lyDo = lyDo;
    }

    public String getPhuongPhapTri() {
        return phuongPhapTri;
    }

    public void setPhuongPhapTri(String phuongPhapTri) {
        this.phuongPhapTri = phuongPhapTri;
    }

    public String getBacSi() {
        return bacSi;
    }

    public void setBacSi(String bacSi) {
        this.bacSi = bacSi;
    }
}
