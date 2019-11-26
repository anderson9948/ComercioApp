<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jspf" %>
<div class="container">
    <h2>CartaoFidelidade</h2>
    
    <!--Search Form -->
    <form action="/cartaoFidelidade" method="get" id="searchCartaoFidelidade" role="form">
        <input type="hidden" id="action" name="action" value="search">
        <div class="form-group col-xs-5">
            <input type="text" name="search" id="search" class="form-control" required="true" placeholder="Digite a descrição da cartaoFidelidade a procurar"/>                    
        </div>
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Procurar
        </button>
        <br></br>
        <br></br>
    </form>

    <!-- Include Botton -->
    <form action ="/cartaoFidelidade?action=new" method="POST">            
        <c:if test="${permissao.getCriar()}">
            <button type="submit" class="btn btn-primary  btn-md">Novo Cadastro</button> 
        </c:if>
        <br></br>
    </form>

    <!-- List-->
    <c:if test="${not empty message}">                
        <div class="alert alert-${message.indexOf("ERRO")>=0?"warning":"success"}">
            ${message}
        </div>
    </c:if> 
    <form action="/cartaoFidelidade" method="post" id="cartaoFidelidadeForm" role="form" >              
        <input type="hidden" id="id" name="id">
        <input type="hidden" id="action" name="action">
        <c:choose>
            <c:when test="${not empty entities}">
                <table  class="table-striped table-xl col-xs-10">
                    <thead>
                        <tr>
                            <td>#</td>
                            <td>vencimento</td>
                            <td>limite</td>
                            <td>fatorConversao</td>
                            <td>qtdPontos</td>
                            <td>senha</td>
                            <td>Pessoa</td>
                            <td></td>
                        </tr>
                    </thead>
                    <c:forEach var="obj" items="${entities}">
                        <tr class="${id == obj.id?"info":""}">
                            <td>
                                <c:if test="${permissao.getAlterar()}">
                                    <a href="/cartaoFidelidade?id=${obj.id}&search=searchById">${obj.id}</a>
                                </c:if>
                                <c:if test="${!permissao.getAlterar()}">
                                    ${obj.id}
                                </c:if>
                            </td>                                    
                            <td>${obj.vencimento}</td>
                            <td>${obj.limite}</td>
                            <td>${obj.fatorConversao}</td>
                            <td>${obj.qtdPontos}</td>
                            <td>${obj.senha}</td>
                            <td>${obj.pessoa}</td>
                            <td> <td>
                                <c:if test="${permissao.getExcluir()}">
                                    <a href="#" id="remove" 
                                       onclick="document.getElementById('action').value = 'remove';document.getElementById('id').value = '${obj.id}';
                                               document.getElementById('cartaoFidelidadeForm').submit();"> 
                                        <span class="glyphicon glyphicon-trash"/>
                                    </a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>               
                </table>  
            </c:when>                    
            <c:otherwise>
                <br>           
                <div class="alert alert-info">
                    Nenhum registro encontrado.
                </div>
            </c:otherwise>
        </c:choose>                        
    </form>
</div>
<%@include file="../footer.jspf" %>