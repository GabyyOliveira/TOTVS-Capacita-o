#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L4Ex16()
	local aEstados := { 'MG' ,'AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO', }
	Local cEstado := ''
	Private oEstados
	Private oDlgPvt
	Private CLR_COLOR := rgb(237, 238, 247)
	Private CLR_TEXT := rgb(120, 104, 230)
	Private oBtn
	Private cExibe := ''


	oDlgPvt := MsDialog():New(0,0,190, 459, 'Busca por Estado',,,,,CLR_TEXT,CLR_COLOR,,,.T.)


	@ 014,6 Say 'Selecione o Estado: ' SIZE 70,07 OF oDlgPvt PIXEL
	@ 024,6 MsComboBox oEstados VAR cEstado ITEMS aEstados SIZE 90,17 OF oDlgPvt PIXEL

	@ 45,25 BUTTON oBtn PROMPT 'Procurar Clientes' SIZE 50,15 OF oDlgPvt ACTION (SearchClientes(cEstado)) PIXEL

	@ 6,100 Say cExibe SIZE 125,150 OF oDlgPvt PIXEL


	oDlgPvt:Activate(,,,.T.,,,)

	MsgInfo('Programa finalizado', 'Bye, Bye')
Return

//função busca clientes 
static function SearchClientes(cEstado)
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''
	Local cCliente := ''
	Local cMsg := 'Clientes situados em ' + cEstado + ' :' + CRLF
	Local nCont := 0

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA1' MODULO 'COM'

	cQuery := 'SELECT A1_NOME' + CRLF
	cQuery += "FROM " + RetSqlName('SA1') + " SA1" + CRLF
	cQuery += "WHERE A1_EST = '" + cEstado + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cCliente := &(cAlias)->(A1_NOME)

		cMsg += cCliente + CRLF + "==========" + CRLF
		nCont++

		&(cAlias)->(DbSkip())
	enddo

	if nCont > 0
		cExibe := cMsg
	else
		cExibe := 'Não há clientes cadastrados neste estado'
	endif


	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
return
