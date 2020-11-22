package bo.contract_detail;

import model.contract.Contract;
import model.contract_detail.AttachService;
import model.contract_detail.ContractDetail;

import java.util.List;

public interface ContractDetailBO {
    String saveContractDetail(ContractDetail contractDetail);

    List<Contract> findAllContract();

    List<AttachService> findAllAttachService();
}
