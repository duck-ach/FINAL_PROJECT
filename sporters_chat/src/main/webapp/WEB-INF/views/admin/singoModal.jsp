<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="" />
<!-- histoty Modal-->
<div class="modal-header">
    <h5 class="modal-title" id="historyModalLabel">ID - Modal</h5>
    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span>
    </button>
</div>
<div class="modal-body">
    <div class="table-responsive">
        <div class="container">
        </div>
        <table class="table table-hover">
            <thead class="text-center">
            <tr class="content">
                <th class="text-center">
                    ID
                </th>
                <th class="text-center">
                    PassWord
                </th>
            </tr>
            </thead>
            <tbody class="text-center">
            <c:forEach items="${Moa}" var="Moa">
                <tr class="content" style="font-size: 12px;">
                    <td class="text-center">${Moa.id }</td>
                    <td class="text-center">${Moa.password}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<div class="modal-footer">
    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
</div>