package controller;

import bo.contract_detail.ContractDetailBO;
import bo.contract_detail.ContractDetailBOImp;
import model.contract.Contract;
import model.contract_detail.AttachService;
import model.contract_detail.ContractDetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractDetailServlet", urlPatterns = {"/contractDetail"})
public class ContractDetailServlet extends HttpServlet {
    private ContractDetailBO contractDetailBO = new ContractDetailBOImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String actionFurama = request.getParameter("actionFurama");
        if (actionFurama.equals("createNewContractDetail")) {
            createNewContractDetail(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String actionFurama = request.getParameter("actionFurama");
        if (actionFurama.equals("addNewContractDetail")) {
            addNewContractDetail(request, response);
        }
    }

    private void addNewContractDetail(HttpServletRequest request, HttpServletResponse response) {
        List<Contract> contracts = this.contractDetailBO.findAllContract();
        request.setAttribute("idContracts", contracts);

        List<AttachService> attachServices = this.contractDetailBO.findAllAttachService();
        request.setAttribute("attachServices", attachServices);

      RequestDispatcher dispatcher = request.getRequestDispatcher("furama/contract_detail/create-new-contract-detail.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewContractDetail(HttpServletRequest request, HttpServletResponse response) {
        String quantity = request.getParameter("quantity");
        String idContract = request.getParameter("idContract");
        String attachService = request.getParameter("attachService");

        ContractDetail contractDetail = new ContractDetail(quantity, idContract, attachService);

        String message = this.contractDetailBO.saveContractDetail(contractDetail);
        request.setAttribute("message", message);

        addNewContractDetail(request, response);
    }
}
