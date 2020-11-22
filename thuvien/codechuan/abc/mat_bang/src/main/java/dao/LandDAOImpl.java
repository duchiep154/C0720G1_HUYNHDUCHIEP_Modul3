package dao;

import model.Land;
import model.LandStatus;
import model.LandType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LandDAOImpl implements LandDAO {
    private static final String SELECT_ALL_LAND = "select * from land";
    private static final String SELECT_LAND_BY_FLOOR = "select * from land where floor like ?";
    private static final String SELECT_LAND_BY_PRICE = "select * from land where price like ?";
    private static final String SELECT_LAND_BY_LAND_TYPE = "select * from land where land_type_id like ?";
    private static final String SELECT_LAND_BY_FLOOR_AND_PRICE_AND_LAND_TYPE = "select * from land where floor like ? and price like ? and land_type_id like ?";
    private static final String SELECT_LAND_BY_ID = "select * from land where land_id = ?";
    private static final String SELECT_ALL_LAND_TYPE = "select * from land_type";
    private static final String SELECT_ALL_LAND_STATUS = "select * from land_status";
    private static final String CREATE_NEW_LAND = "insert into land values (?, ?, ?, ?, ?, ?, ?,?)";
    private static final String SELECT_ALL_ID_LAND = "select land_id from land";

    @Override
    public List<Land> findAllLand() {
        BaseDAO baseDAO = new BaseDAO();
        List<Land> landList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_LAND);
            ResultSet resultSet = preparedStatement.executeQuery();
            Land land;
            while (resultSet.next()) {
                String id = resultSet.getString("land_id");
                String area = resultSet.getString("area");
                String floor = resultSet.getString("floor");
                String price = resultSet.getString("price");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                String idLandType = resultSet.getString("land_type_id");
                String idLandStatus = resultSet.getString("land_status_id");

                land = new Land(id, area, floor, price, startDate, endDate, idLandType, idLandStatus);
                landList.add(land);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return landList;
    }

    @Override
    public Land findByID(String idNeedFind) {
        BaseDAO baseDAO = new BaseDAO();
        Land land = null;

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_LAND_BY_ID);
            preparedStatement.setString(1, idNeedFind);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("land_id");
                String area = resultSet.getString("area");
                String floor = resultSet.getString("floor");
                String price = resultSet.getString("price");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                String idLandType = resultSet.getString("land_type_id");
                String idLandStatus = resultSet.getString("land_status_id");

                land = new Land(id, area, floor, price, startDate, endDate, idLandType, idLandStatus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return land;
    }

    @Override
    public List<Land> findByFloor(String floorNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Land> landList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_LAND_BY_FLOOR);
            preparedStatement.setString(1, '%' + floorNeedSearch + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Land land;
            while (resultSet.next()) {
                String id = resultSet.getString("land_id");
                String area = resultSet.getString("area");
                String floor = resultSet.getString("floor");
                String price = resultSet.getString("price");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                String idLandType = resultSet.getString("land_type_id");
                String idLandStatus = resultSet.getString("land_status_id");

                land = new Land(id, area, floor, price, startDate, endDate, idLandType, idLandStatus);
                landList.add(land);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return landList;
    }

    @Override
    public List<Land> findByPrice(String priceNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Land> landList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_LAND_BY_PRICE);
            preparedStatement.setString(1, '%' + priceNeedSearch + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Land land;
            while (resultSet.next()) {
                String id = resultSet.getString("land_id");
                String area = resultSet.getString("area");
                String floor = resultSet.getString("floor");
                String price = resultSet.getString("price");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                String idLandType = resultSet.getString("land_type_id");
                String idLandStatus = resultSet.getString("land_status_id");

                land = new Land(id, area, floor, price, startDate, endDate, idLandType, idLandStatus);
                landList.add(land);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return landList;
    }

    @Override
    public List<Land> findByLandType(String landTypeNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Land> landList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_LAND_BY_LAND_TYPE);
            preparedStatement.setString(1, '%' + landTypeNeedSearch + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Land land;
            while (resultSet.next()) {
                String id = resultSet.getString("land_id");
                String area = resultSet.getString("area");
                String floor = resultSet.getString("floor");
                String price = resultSet.getString("price");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                String idLandType = resultSet.getString("land_type_id");
                String idLandStatus = resultSet.getString("land_status_id");

                land = new Land(id, area, floor, price, startDate, endDate, idLandType, idLandStatus);
                landList.add(land);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return landList;
    }

    @Override
    public List<Land> findByFloorAndPriceAndLandType(String floorNeedSearch, String priceNeedSearch, String landTypeNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Land> landList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_LAND_BY_FLOOR_AND_PRICE_AND_LAND_TYPE);
            preparedStatement.setString(1, '%' + floorNeedSearch + '%');
            preparedStatement.setString(2, '%' + priceNeedSearch + '%');
            preparedStatement.setString(3, '%' + landTypeNeedSearch + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Land land;
            while (resultSet.next()) {
                String id = resultSet.getString("land_id");
                String area = resultSet.getString("area");
                String floor = resultSet.getString("floor");
                String price = resultSet.getString("price");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                String idLandType = resultSet.getString("land_type_id");
                String idLandStatus = resultSet.getString("land_status_id");

                land = new Land(id, area, floor, price, startDate, endDate, idLandType, idLandStatus);
                landList.add(land);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return landList;
    }

    @Override
    public String save(Land land) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(CREATE_NEW_LAND);
            preparedStatement.setString(1, land.getId());
            preparedStatement.setString(2, land.getArea());
            preparedStatement.setString(3, land.getFloor());
            preparedStatement.setString(4, land.getPrice());
            preparedStatement.setString(5, land.getStartDate());
            preparedStatement.setString(6, land.getEndDate());
            preparedStatement.setString(7, land.getIdLandType());
            preparedStatement.setString(8, land.getIdLandStatus());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Create Complete !";
    }

    @Override
    public String update(Land land) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call update_land(?, ?,?,?,?,?,?,?)");
            callableStatement.setString(1, land.getId());
            callableStatement.setString(2, land.getArea());
            callableStatement.setString(3, land.getFloor());
            callableStatement.setString(4, land.getPrice());
            callableStatement.setString(5, land.getStartDate());
            callableStatement.setString(6, land.getEndDate());
            callableStatement.setString(7, land.getIdLandType());
            callableStatement.setString(8, land.getIdLandStatus());

            callableStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Update Complete !";
    }

    @Override
    public void delete(String idNeedDelete) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call delete_land(?)");
            callableStatement.setString(1, idNeedDelete);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<LandType> findAllLandType() {
        BaseDAO baseDAO = new BaseDAO();
        List<LandType> landTypeList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_LAND_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            LandType landType;
            while (resultSet.next()) {
                String id = resultSet.getString("land_type_id");
                String name = resultSet.getString("land_type_name");

                landType = new LandType(id, name);
                landTypeList.add(landType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return landTypeList;
    }

    @Override
    public List<LandStatus> findAllLandStatus() {
        BaseDAO baseDAO = new BaseDAO();
        List<LandStatus> landStatusList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_LAND_STATUS);
            ResultSet resultSet = preparedStatement.executeQuery();
            LandStatus landStatus;
            while (resultSet.next()) {
                String id = resultSet.getString("land_status_id");
                String name = resultSet.getString("land_status_name");

                landStatus = new LandStatus(id, name);
                landStatusList.add(landStatus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return landStatusList;
    }

    @Override
    public List<String> findAllIDLand() {
        BaseDAO baseDAO = new BaseDAO();
        List<String> listID = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_ID_LAND);
            ResultSet resultSet = preparedStatement.executeQuery();
            String id;
            while (resultSet.next()) {
                id = resultSet.getString("land_id");
                listID.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listID;
    }
}
