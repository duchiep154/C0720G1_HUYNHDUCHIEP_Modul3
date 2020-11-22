package dao.contract_detail;

import model.contract.Contract;
import model.contract_detail.AttachService;
import model.contract_detail.ContractDetail;

import java.util.List;

public interface ContractDetailDAO {
    String saveContractDetail(ContractDetail contractDetail);

    List<Contract> findAllContract();

    List<AttachService> findAllAttachService();
}
