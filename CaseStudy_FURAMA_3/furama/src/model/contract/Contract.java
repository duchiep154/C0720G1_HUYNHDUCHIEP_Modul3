package model.contract;

public class Contract {
    private String id;
    private String startDate;
    private String endDate;
    private String deposite;
    private String totalMoney;
    private String idEmployee;
    private String idCustomer;
    private String idService;

    public Contract() {
    }

    public Contract(String id, String startDate, String endDate, String deposite, String totalMoney, String idEmployee, String idCustomer, String idService) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposite = deposite;
        this.totalMoney = totalMoney;
        this.idEmployee = idEmployee;
        this.idCustomer = idCustomer;
        this.idService = idService;
    }

    public Contract(String startDate, String endDate, String deposit, String totalMoney, String idEmployee, String idCustomer, String idService) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposite = deposite;
        this.totalMoney = totalMoney;
        this.idEmployee = idEmployee;
        this.idCustomer = idCustomer;
        this.idService = idService;
    }

    public Contract(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getDeposite() {
        return deposite;
    }

    public void setDeposite(String deposite) {
        this.deposite = deposite;
    }

    public String getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(String totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(String idEmployee) {
        this.idEmployee = idEmployee;
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getIdService() {
        return idService;
    }

    public void setIdService(String idService) {
        this.idService = idService;
    }
}
