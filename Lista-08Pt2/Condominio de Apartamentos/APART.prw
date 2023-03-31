#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function APART
    Rotina MVC para cadastro de blocos e apartamentos
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 30/03/2023
/*/
User Function APART()
    Local cAlias  := 'SZ1'
	Local cTitle  := 'Blocos de Apartamentos'
	Local oBrowse := FwMBrowse():New()

    //inicializando o browse
	oBrowse:SetAlias(cAlias)
	oBrowse:SetDescription(cTitle)
	oBrowse:DisableDetails()
	oBrowse:DisableReport()

    //ativando o browse
	oBrowse:Activate()
Return 

//definindo o menu 
Static Function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.APART' OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.APART' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.APART' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.APART' OPERATION 5 ACCESS 0
Return aRotina

// modelo de dados
Static Function ModelDef()
	Local oModel := MPFormModel():New('APARTM')
	Local oStruSZ1 := FWFormStruct(1,'SZ1')
	Local oStruSZ2 := FWFormStruct(1,'SZ2')

	//Define de os submodelos serão field ou grid
	oModel:AddFields('SZ1MASTER', , oStruSZ1)
	oModel:AddGrid('SZ2DETAILS', 'SZ1MASTER', oStruSZ2)

	//descrição do modelo
	oModel:SetDescription('Modelo de dados Blocos de Apartamentos')

	oModel:GetModel('SZ1MASTER'):SetDescription('Blocos')
	oModel:GetModel('SZ2DETAILS'):SetDescription('Apartamentos')

	//gerando código automatico
    oStruSZ1:SetProperty('Z1_COD',MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'GETSXENUM("SZ1", "Z1_COD")'))

	//relacionando as tabelas
	oModel:SetRelation('SZ2DETAILS', {{'Z2_FILIAL', 'xFilial("SZ2")'}, {'Z2_COD', 'Z1_COD'}}, SZ2->(IndexKey(1)))

	oModel:SetPrimaryKey({'Z1_COD', 'Z2_NUM'})

return oModel

//Visualização de dados
Static Function ViewDef()
	Local oModel := FwLoadModel('APART')
	Local oView := FwFormView():New()
	Local oStruSZ1 := FWFormStruct(2, 'SZ1')
	Local oStruSZ2 := FWFormStruct(2, 'SZ2')

	oView:SetModel(oModel)

	oView:AddField('VIEW_SZ1', oStruSZ1, 'SZ1MASTER')
	oView:AddGrid('VIEW_SZ2', oStruSZ2, 'SZ2DETAILS')

	oView:CreateHorizontalBox('BLOCOS', 30)
	oView:CreateHorizontalBox('APARTAMENTOS', 70)

	oView:SetOwnerView('VIEW_SZ1', 'BLOCOS')
	oView:SetOwnerView('VIEW_SZ2', 'APARTAMENTOS')

   oView:EnableTitleView('VIEW_SZ1', 'Bloco')
   oView:EnableTitleView('VIEW_SZ2', 'Apartamentos do Bloco')
return oView
