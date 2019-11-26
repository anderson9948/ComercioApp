<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jspf" %>
<div class="container">
    <form action="/cartaoFidelidade" method="post"  role="form" data-toggle="validator" >
        <c:if test ="${empty action}">                        	
            <c:set var="action" value="add"/>
        </c:if>
        <input type="hidden" id="action" name="action" value="${action}">
        <input type="hidden" id="id" name="id" value="${obj.id}">
        <h2>CartaoFidelidade</h2>
        <div class="form-group col-xs-4">
            <label for="vencimento" class="control-label col-xs-4">Vencimento:</label>
            <input type="text" name="vencimento" id="vencimento" class="form-control" value="${obj.vencimento}" required="true"/>
            <label for="limite" class="control-label col-xs-4">limite</label>
            <input type="text" name="limite" id="limite" class="form-control" value="${obj.limite}" required="true"/>  
            <label for="fatorConversao" class="control-label col-xs-4">fatorConversao</label>
            <input type="text" name="fatorConversao" id="fatorConversao" class="form-control" value="${obj.fatorConversao}" required="true"/>  
            <label for="qtdPontos" class="control-label col-xs-4">qtdPontos</label>
            <input type="text" name="qtdPontos" id="qtdPontos" class="form-control" value="${obj.qtdPontos}" required="true"/>  
            <label for="senha" class="control-label col-xs-4">senha</label>
            <input type="text" name="senha" id="senha" class="form-control" value="${obj.senha}" required="true"/>  
            
            <label for="pessoa" class="control-label col-xs-4">Cliente :</label>
            <select name="pessoa" class="form-control">
                <c:forEach var="pessoa" items="${listPessoa}">
                    <option value="${pessoa.id}" ${pessoa.id == obj.pessoa.id?"selected":""}>${pessoa}</option>
                </c:forEach>
            </select>
            <br></br>
            <button type="submit" class="btn btn-primary  btn-md">Gravar</button> 
        </div>                                                      
    </form>
</div>
<%@include file="../footer.jspf" %>