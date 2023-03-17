#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CalcDolar
    Ponto de Entrada para que, caso o cancele a inclusão de um novo Pedido de Venda, seja apresentada uma mensagem com o seguinte texto: “Operação cancelada pelo usuário!”
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function M410ABN()

	MSGINFO('Operação cancelada pelo Usuário')

Return

