<%@page import="java.util.List"%>
<%@page import="Modelo.Endereco"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Componente"%>
<%@page import="Modelo.Pedido"%>
<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>PC Maker - Monte aqui seu PC !</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/customModal.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="https://fonts.googleapis.com/css?family=Bungee+Inline|Gruppo" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Palanquin+Dark" rel="stylesheet">
    </head>
    <body>

        <% Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

            if (usuario != null) {

                List<Endereco> listaEnderecos = usuario.getEnderecos();
                Pedido pedidoModal = new Pedido();

        %>


        <!-- Dropdown das pe�as -->
        <ul id="dropdown1" class="dropdown-content">

        </ul>
        <!-- Inic�o Barra de Navega��o -->
        <header>
            <div class="nav-content">
                <nav> 
                    <div class="nav-wrapper grey darken-4">
                        <a href="#" class="brand-logo grey-text text-lighten-1 left">PC MAKER</a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down grey darken-4">
                            <li><a href="" class="hoverable grey-text text-lighten-1 modal-trigger"><i class="material-icons left red-text text-darken-4">group</i><%=usuario.getLogin()%></a></li>
                            <li><a class="dropdown-button hoverable grey-text text-lighten-1" href="#!" data-activates="dropdown1">Componentes<i class="material-icons left red-text text-darken-4">layers</i><i class="material-icons right red-text text-darken-4">arrow_drop_down</i></a></li>
                            <li><a href="principal.jsp" class="hoverable grey-text text-lighten-1"><i class="material-icons left red-text text-darken-4">home</i>Home</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <!-- Fim da Barra de Navega��o -->
        <main>  
            <table class="highlight">
                <thead>
                    <tr>
                        <th class="center-align">ID do Pedido</th>
                        <th class="center-align">Nome do Cliente</th>
                        <th class="center-align">Telefone</th>
                        <th class="center-align">Data da Compra</th>
                        <th class="center-align">Valor Total (R$)</th>
                        <th class="center-align">Status da Compra</th>                       
                        <th class="center-align">Endere�o de Entrega</th>
                        <th class="center-align">Cidade</th>
                        <th class="center-align">UF</th>
                        <th class="center-align">Itens</th>
                        <th class="center-align">Cancelar Pedido</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <% ArrayList<Pedido> listaPedidos = (ArrayList<Pedido>) request.getAttribute("listaDePedido");

                            for (Pedido pedido : listaPedidos) {
                                for (Endereco endereco : listaEnderecos) {

                        %>

                <div id="modalPedido<%=pedido.getIdPedido()%>" class="modal modal-fixed-footer">

                    <ul class="collapsible" data-collapsible="accordion">              
                        <% List<Componente> listaDeComponentes = pedido.getItensComponente();

                            for (Componente comp : listaDeComponentes) {

                        %>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">layers</i><%=comp.getTipoComponente().getNomeComponente()%>
                                <span class="alinhado-direita"><%=comp.getModelo()%></span>
                            </div>
                            <div class="collapsible-body">
                                <p class="descricaoComponente">Descri��o: <%=comp.getDescricao()%></p>                        
                            </div>
                        </li>
                        <%}%>
                    </ul>
                </div>
                <td class="center-align"><%=pedido.getIdPedido()%></td>
                <td class="center-align"><%=pedido.getUsuarioDoPedido().getNomeCompleto()%></td>
                <td class="center-align"><%=pedido.getUsuarioDoPedido().getTelefone()%></td>
                <td class="center-align"><%=pedido.getDataPedido()%></td>
                <td class="center-align">R$ <%=pedido.getValorTotal()%></td>
                <td class="center-align"><%=pedido.getStatusPedido()%></td>
                <td class="center-align"><%=endereco.getRua()%></td>
                <td class="center-align"><%=endereco.getCidade()%></td>
                <td class="center-align"><%=endereco.getUf()%></td>
                <%}%>
                <td class="center-align"><a href="#modalPedido<%=pedido.getIdPedido()%>" class="modal-trigger">Ver itens</a></td>    
                <td class="center-align"><a href="excluirPedido?id=<%=pedido.getIdPedido()%>">Cancelar Pedido</a></td>
                <%}%>
                
                <tr>
                    </tbody>
            </table>
        </main>
        <!-- In�cio do Rodap� -->
        <footer class="page-footer grey darken-4">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12 left-align">
                        <h5 class="grey-text text-lighten-1"><i class="material-icons left green-text text-darken-2">local_grocery_store</i> Pe�as mais procuradas </h5>
                        <ul>
                            <li><a class="" href="#!">Processador</a></li>
                            <li><a class="" href="#!">Placa-m�e</a></li>
                            <li><a class="" href="#!">Placa de V�deo</a></li>
                            <li><a class="" href="#!">HD</a></li>
                            <li><a class="" href="#!">Fonte</a></li>
                            <li><a class="" href="#!">Gabinete</a></li>
                            <li><a class="" href="#!">Mem�ria</a></li>
                        </ul>
                    </div>

                    <div class="col l4 offset-l2 s12">
                        <h5 class="white-text grey-text text-lighten-1"><i class="material-icons left red-text text-red darken-4">share</i>Siga-nos nas redes sociais</h5>
                        <ul class="social-nav model-9">
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="facebook"> <i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                        <br/>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    � 2017 Todos os direitos reservados de PC MAKER | Vers�o 1.0
                    <a class="grey-text text-lighten-1 right" href="#!">Fale Conosco</a>
                </div>
            </div>
        </footer>
        <!-- Fim do Rodap� -->
        <%}%>
        
        <!-- Scripts-->
        <script type="text/javascript" src="js/jQuery.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/customJS.js"></script>
        <script src="js/init.js"></script>
        <script src="https://use.fontawesome.com/93d491e836.js"></script>
        <script type="text/javascript" src="js/main.js"></script>
    </body>
</html>
