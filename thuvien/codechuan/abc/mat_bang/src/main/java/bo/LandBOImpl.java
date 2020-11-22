package bo;

import common.Validation;
import dao.LandDAO;
import dao.LandDAOImpl;
import model.Land;
import model.LandStatus;
import model.LandType;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class LandBOImpl implements LandBO {
    LandDAO landDAO = new LandDAOImpl();

    @Override
    public List<Land> findAllLand() {
        return this.landDAO.findAllLand();
    }

    @Override
    public Land findByID(String id) {
        return this.landDAO.findByID(id);
    }

    @Override
    public List<Land> findByFloor(String floor) {
        return this.landDAO.findByFloor(floor);
    }

    @Override
    public List<Land> findByPrice(String price) {
        return this.landDAO.findByPrice(price);
    }

    public List<Land> findByLandType(String landType) {
        return this.landDAO.findByLandType(landType);
    }

    @Override
    public List<Land> findByFloorAndPriceAndLandType(String floor, String price, String landType) {
        return this.landDAO.findByFloorAndPriceAndLandType(floor, price, landType);
    }

    @Override
    public String save(Land land) {
        boolean check = true;
        String message = "";

        DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");
        Date dateStart;
        Date dateEnd;
        long getDaysDiff = 0;
        try {
            String startDate = land.getStartDate();
            String endDate = land.getEndDate();

            dateStart = simpleDateFormat.parse(startDate);
            dateEnd = simpleDateFormat.parse(endDate);
            long getDiff = dateEnd.getTime() - dateStart.getTime();
            getDaysDiff = getDiff / (24 * 60 * 60 * 1000);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (getDaysDiff < 181) {
            check = false;
            message += "Invalid date end ! Date End must be greater than Date Start (less than 6 months),";
        }
        if (testID(land.getId())) {
            check = false;
            message += "Invalid ID ! ID is exists ! Please input ID other ,";
        } else if (Validation.regexID(land.getId())) {
            check = false;
            message += "Invalid ID ! Format id is XXX-XX-XX with X is number from 0 to 9 or A-Z (upcasse),";
        }
        if (Validation.regexArea(land.getArea())) {
            check = false;
            message += "Invalid area ! Area must be greater than 20 m2 ,";
        }
        if (Validation.regexPositiveIntegers(land.getFloor())) {
            check = false;
            message += "Invalid floor ! Floor must be positive integer and smaller than 16 floors ,";
        }
        if (Validation.regexPrice(land.getPrice())) {
            check = false;
            message += "Invalid price ! Price must be greater than 1000000 !";
        }

        if (check) {
            message = this.landDAO.save(land);
        }

        return message;

//        return this.land.save(land);
    }

    @Override
    public String update(Land land) {

        boolean check = true;
        String message = "";


        DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");
        Date dateStart;
        Date dateEnd;
        long getDaysDiff = 0;
        try {
            String startDate = land.getStartDate();
            String endDate = land.getEndDate();

            dateStart = simpleDateFormat.parse(startDate);
            dateEnd = simpleDateFormat.parse(endDate);
            long getDiff = dateEnd.getTime() - dateStart.getTime();
            getDaysDiff = getDiff / (24 * 60 * 60 * 1000);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (getDaysDiff < 181) {
            check = false;
            message += "Invalid date end ! Date End must be greater than Date Start (less than 6 months) ,";
        }
        if (Validation.regexArea(land.getArea())) {
            check = false;
            message += "Invalid area ! Area must be greater than 20 m2 ,";
        }
        if (Validation.regexPositiveIntegers(land.getFloor())) {
            check = false;
            message += "Invalid floor ! Floor must be positive integer and greater than 0 ,";
        }
        if (Validation.regexPrice(land.getPrice())) {
            check = false;
            message += "Invalid price ! Price must be greater than 1.000.000 !";
        }

        if (check) {
            message = this.landDAO.update(land);
        }
        return message;

//        return this.landDAO.update(land);
    }

    @Override
    public void delete(String id) {
        this.landDAO.delete(id);
    }

    @Override
    public List<LandType> findAllLandType() {
        return this.landDAO.findAllLandType();
    }

    @Override
    public List<LandStatus> findAllLandStatus() {
        return this.landDAO.findAllLandStatus();
    }

    private boolean testID(String id) {
        List<String> listID = this.landDAO.findAllIDLand();
        for (String idExist : listID) {
            if (idExist.equals(id)) {
                return true;
            }
        }
        return false;
    }
}
