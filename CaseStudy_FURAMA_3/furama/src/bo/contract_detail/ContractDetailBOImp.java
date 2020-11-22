package bo.contract_detail;

import common.Validation;
import dao.contract_detail.ContractDetailDAO;
import dao.contract_detail.ContractDetailDAOImp;
import model.contract.Contract;
import model.contract_detail.AttachService;
import model.contract_detail.ContractDetail;

import java.util.List;

public class ContractDetailBOImp implements ContractDetailBO {
    ContractDetailDAO contractDetailDAO = new ContractDetailDAOImp();

    @Override
    public String saveContractDetail(ContractDetail contractDetail) {
        String message;

        if (Validation.regexPositiveIntegers(contractDetail.getQuantity())) {
            message = "Invalid quantity ! Quantity must be a positive integer !";
        } else message = this.contractDetailDAO.saveContractDetail(contractDetail);
        return message;
    }

    @Override
    public List<Contract> findAllContract() {
        return this.contractDetailDAO.findAllContract();
    }

    @Override
    public List<AttachService> findAllAttachService() {
        return this.contractDetailDAO.findAllAttachService();
    }

}
