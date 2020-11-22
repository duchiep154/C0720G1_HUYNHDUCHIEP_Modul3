package dao.contract_detail;

import dao.BaseDAO;
import model.contract.Contract;
import model.contract_detail.AttachService;
import model.contract_detail.ContractDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailDAOImp implements ContractDetailDAO {
    private static final String CREATE_NEW_CONTRACT_DETAIL = "insert into contract_detail values (null, ?, ?, ?)";
    private static final String SELECT_ALL_CONTRACT = "select contract_id from contract";
    private static final String SELECT_ALL_ATTACH_SERVICE = "select attach_service_id, attach_service_name from attach_service";

    @Override
    public String saveContractDetail(ContractDetail contractDetail) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(CREATE_NEW_CONTRACT_DETAIL);
            preparedStatement.setString(1, contractDetail.getQuantity());
            preparedStatement.setString(2, contractDetail.getIdContract());
            preparedStatement.setString(3, contractDetail.getIdAttachService());

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
    public List<Contract> findAllContract() {
        BaseDAO baseDAO = new BaseDAO();
        List<Contract> contracts = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_CONTRACT);
            ResultSet resultSet = preparedStatement.executeQuery();
            Contract contract;
            while (resultSet.next()) {
                String id = resultSet.getString("contract_id");

                contract = new Contract(id);
                contracts.add(contract);
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
        return contracts;
    }

    @Override
    public List<AttachService> findAllAttachService() {
        BaseDAO baseDAO = new BaseDAO();
        List<AttachService> attachServices = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_ATTACH_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            AttachService attachService;
            while (resultSet.next()) {
                String id = resultSet.getString("attach_service_id");
                String name = resultSet.getString("attach_service_name");

                attachService = new AttachService(id, name);
                attachServices.add(attachService);
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
        return attachServices;
    }
}
