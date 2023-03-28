#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCVEIC
    Rotina MVC para cadastro de Categorias de CNH
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 27/03/2023
/*/
User Function MVCVEIC()
    Local oBrowse := FWMBrowse():New()
    Local cTitle := 'Cadastro de Veiculos'
    Local cAlias := 'ZZV'

    //Instanciando o Browse
    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableReport()

    //Ativando o browse
    oBrowse:Activate()
Return 

//definindo o menu 
Static function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCVEIC' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCVEIC' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVCVEIC' OPERATION 5 ACCESS 0

return aRotina

//Modelo de Dados
Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVCVEICM')
    Local oStruZZV := FWFormStruct(1, 'ZZV')

    //Define de os submodelos serão fields ou grid
    oModel:AddFields('ZZVMASTER', , oStruZZV)

    //descrição do modelo
    oModel:SetDescription('Modelo de dados - Cadastro de Veiculos')

    //descrição do submodelo
    oModel:GetModel('ZZVMASTER'):SetDescription('Cadastro de Veiculos')

    oModel:SetPrimaryKey({'ZZV_COD'})

return oModel

//Visualização de dados
Static Function ViewDef()
    Local oModel   := FWLoadModel('MVCVEIC')
    Local oView    := FWFormView():New()
    Local oStruZZV := FWFormStruct(2,'ZZV')

    //indica o modelo da view 
    oView:SetModel(oModel)

    //cria a estrutura visual de campos
    oView:AddField('VIEW_ZZV', oStruZZV, 'ZZVMASTER')

    //cria boxes horizontais 
    oView:CreateHorizontalBox('VEICULOS', 100)

    //relaciona os boxes com as estruturas visuais 
    oView:SetOwnerView('VIEW_ZZV','VEICULOS')

	//cria um titulo encima de cada formulário
    oView:EnableTitleView('VIEW_ZZV', 'Cadastro de Veiculos')
return oView
