#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function TODOL
    Rotina em MVC para cadastrar uma tarefa e os passos necessários para realizá-la
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 30/03/2023
/*/
User Function TODOL()
	Local cAlias  := 'ZZT'
	Local cTitle  := 'TO-DO List'
	Local oMark := FwMarkBrowse():New()

	//inicializando o browse
	oMark:SetAlias(cAlias)
	oMark:SetDescription(cTitle)
	oMark:SetFieldMark('ZZT_MARC')
	oMark:DisableDetails()
	oMark:DisableReport()

	oMark:AddLegend("ZZT->ZZT_SITU == '1'", "RED",    "Tarefa Parada")
	oMark:AddLegend("ZZT->ZZT_SITU == '2'", "YELLOW", "Aguardando Liberação")
	oMark:AddLegend("ZZT->ZZT_SITU == '3'", "PINK",   "Tarefa Em Andamento")
	oMark:AddLegend("ZZT->ZZT_SITU == '4'", "GREEN",  "Tarefa Concluida")


	//ativando o browse
	oMark:Activate()
Return

//definindo o menu 
Static Function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.TODOL' OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.TODOL' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.TODOL' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.TODOL' OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Legenda'    ACTION 'U_LEGEN()'    OPERATION 9 ACCESS 0
Return aRotina

// modelo de dados
Static Function ModelDef()
	Local bLineLoad := { |oGrid,nLine| LoadPassos(oGrid)}

	Local oModel := MPFormModel():New('TODOLM')
	Local oStruZZT := FWFormStruct(1,'ZZT')
	Local oStruZZP := FWFormStruct(1,'ZZP')

	//Define de os submodelos serão field ou grid
	oModel:AddFields('ZZTMASTER', , oStruZZT)
	oModel:AddGrid('ZZPDETAILS', 'ZZTMASTER', oStruZZP,/**/,/**/,/**/,/**/,bLineLoad)

	//descrição do modelo
	oModel:SetDescription('Modelo de dados TO-DO List')

	oModel:GetModel('ZZTMASTER'):SetDescription('Tarefas')
	oModel:GetModel('ZZPDETAILS'):SetDescription('Passos')

	//gerando código automatico
	oStruZZT:SetProperty('ZZT_COD',MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'GETSXENUM("ZZT", "ZZT_COD")'))

	//relacionando as tabelas
	oModel:SetRelation('ZZPDETAILS', {{'ZZP_FILIAL', 'xFilial("ZZP")'}, {'ZZP_COD', 'ZZT_COD'}}, ZZP->(IndexKey(1)))

	oModel:SetPrimaryKey({'ZZT_COD', 'ZZP_COD'})

return oModel

Static Function ViewDef()
	Local oModel := FwLoadModel('TODOL')
	Local oView := FwFormView():New()
	Local oStruZZT := FWFormStruct(2, 'ZZT')
	Local oStruZZP := FWFormStruct(2, 'ZZP')

	oView:SetModel(oModel)

	oView:AddField('VIEW_ZZT', oStruZZT, 'ZZTMASTER')
	oView:AddGrid('VIEW_ZZP', oStruZZP, 'ZZPDETAILS')

	oView:CreateHorizontalBox('TAREFAS', 30)
	oView:CreateHorizontalBox('PASSOS', 70)

	oView:SetOwnerView('VIEW_ZZT', 'TAREFAS')
	oView:SetOwnerView('VIEW_ZZP', 'PASSOS')

	oView:EnableTitleView('VIEW_ZZT', 'Tarefa')
	oView:EnableTitleView('VIEW_ZZP', 'Passos')

return oView

/*/{Protheus.doc} User Function LEGEN
    Função que cria a legenda da tabela 
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 30/03/2023
/*/
User Function LEGEN()
	Local aLegenda := {}

	aAdd(aLegenda, {"BR_VERMELHO",    "Tarefa Parada"})
	aAdd(aLegenda, {"BR_AMARELO", "Aguardando Liberação"})
	aAdd(aLegenda, {"BR_PINK",   "Tarefa Em Andamento"})
	aAdd(aLegenda, {"BR_VERDE",  "Tarefa Concluida"})

	BrwLegenda("Legenda",'Legenda', aLegenda)
Return



