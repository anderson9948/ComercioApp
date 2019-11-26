<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jspf" %>
<div class="container">
    <form action="/cidade" method="post"  role="form" data-toggle="validator" >
        <c:if test ="${empty action}">                        	
            <c:set var="action" value="add"/>
        </c:if>
        <input type="hidden" id="action" name="action" value="${action}">
        <input type="hidden" id="id" name="id" value="${obj.id}">
        <h2>Cidade</h2>
        <div class="form-group col-xs-4">
            <label for="nome" class="control-label col-xs-4">Nome:</label>
            <input type="text" name="nome" id="nome" class="form-control" value="${obj.nome}" required="true"/>                                   
            <label for="estado" class="control-label col-xs-4">Estado:</label>
            <select name="estado" class="form-control">
                <c:forEach var="estado" items="${listEstado}">
                    <option value="${estado.id}" ${estado.id == obj.estado.id?"selected":""}>${estado}</option>
                </c:forEach>
            </select>
            <br></br>
            <button type="submit" class="btn btn-primary  btn-md">Gravar</button> 
        </div>                                                      
    </form>
</div>
<%@include file="../footer.jspf" %>