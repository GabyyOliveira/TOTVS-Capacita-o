#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCVS
    Rotina MVC para visualizar 
    @type  Function
    @author GABRIELA OLIVEIRA 
    @since 27/03/2023
/*/
User Function MVCVS()
	Local oBrowse := FWMBrowse():New()
	Local cTitle := 'Visualização de Categoria x Instrutor x Alunos'
	Local cAlias := 'ZZN'

	//Instanciando o Browse
	oBrowse:SetAlias(cAlias)
	oBrowse:SetDescription(cTitle)
	oBrowse:DisableReport()

	//Ativando o browse
	oBrowse:Activate()
Return

Static Function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCVS' OPERATION 2 ACCESS 0
return aRotina

Static Function ModelDef()
	Local oModel   := MPFormModel():New('MVCVSM')
	Local oStruZZN := FWFormStruct(1,'ZZN')
	Local oStruZZI := FWFormStruct(1, 'ZZI')
	Local oStruZZM := FWFormStruct(1, 'ZZM')

	//definição dos submodelos
	oModel:AddFields('ZZNMASTER', /*PAI*/, oStruZZN)
	oModel:AddGrid('ZZIDETAIL', 'ZZNMASTER', oStruZZI)
	oModel:AddGrid('ZZMDETAIL', 'ZZIDETAIL', oStruZZM)

	//descrição do modelo
	oModel:SetDescription('Modelo de dados - Visualização de Categoria x Instrutor x Alunos')

	oModel:GetModel('ZZNMASTER'):SetDescription('Cabeçalho do Pedido')
	oModel:GetModel('ZZIDETAIL'):SetDescription('Cabeçalho ZZI')
	oModel:GetModel('ZZMDETAIL'):SetDescription('Cabeçalho ZZM')

	//estabelecendo relações das tabelas
	oModel:SetRelation('ZZIDETAIL', {{'ZZI_FILIAL', 'xFilial("ZZI")'}, {'ZZI_CATEGO', 'ZZN_COD'}}, ZZI->(IndexKey(1)))
	oModel:SetRelation('ZZMDETAIL', {{'ZZM_FILIAL', 'xFilial("ZZM")'}, {'ZZM_INSTRU', 'ZZI_COD'}}, ZZM->(IndexKey(1)))

	oModel:SetPrimaryKey({'ZZN_COD','ZZI_COD', 'ZZM_COD'})

return oModel

//Visualização de dados
Static Function ViewDef()
	Local oModel   := FWLoadModel('MVCVS')
	Local oView    := FWFormView():New()
	Local oStruZZN := FWFormStruct(2,'ZZN')
	Local oStruZZI := FWFormStruct(2,'ZZI')
	Local oStruZZM := FWFormStruct(2,'ZZM')


	//indica o modelo da view
	oView:SetModel(oModel)

	//cria a estrutura visual de campos
	oView:AddField('VIEW_ZZN', oStruZZN, 'ZZNMASTER')
	oView:AddGrid('VIEW_ZZI', oStruZZI, 'ZZIDETAIL')
	oView:AddGrid('VIEW_ZZM', oStruZZM, 'ZZMDETAIL')

	//cria boxes horizontais
	oView:CreateHorizontalBox('CATEGORIA', 30)
	oView:CreateHorizontalBox('INSTRUTORES', 30)
	oView:CreateHorizontalBox('ALUNOS', 40)

	//relaciona os boxes com as estruturas visuais
	oView:SetOwnerView('VIEW_ZZN','CATEGORIA')
	oView:SetOwnerView('VIEW_ZZI','INSTRUTORES')
	oView:SetOwnerView('VIEW_ZZM','ALUNOS')

	//cria um titulo encima de cada formulário
	oView:EnableTitleView('VIEW_ZZN', 'Categoria de CNH')
	oView:EnableTitleView('VIEW_ZZI', 'Instrutores da Categoria')
	oView:EnableTitleView('VIEW_ZZM', 'Alunos do Instrutor')
return oView
