#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCCNH
    Rotina MVC para cadastro de Categorias de CNH
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 27/03/2023
/*/
User Function MVCCNH()
    Local oBrowse := FWMBrowse():New()
    Local cTitle := 'Categorias CNH'
    Local cAlias := 'ZZN'

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

	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCCNH' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCCNH' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVCCNH' OPERATION 5 ACCESS 0

return aRotina

//Modelo de Dados
Static Function ModelDef()
    //Validações do Modelo
    Local bModelPos := { |oModel| ValidaSigla(oModel)}

    Local oModel   := MPFormModel():New('MVCCNHM',/*bModelPre*/, bModelPos)
    Local oStruZZN := FWFormStruct(1, 'ZZN')
    Local aGatilho := FwStruTrigger('ZZN_CARRO', 'ZZN_NOMEVE', 'ZZV->ZZV_NOME', .T., 'ZZV', 1, 'xFilial("ZZV")+Alltrim(M->ZZN_CARRO)')

    //adicionando o gatilho de campo
    oStruZZN:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

    //Define de os submodelos serão fields ou grid
    oModel:AddFields('ZZNMASTER', , oStruZZN)

    //Preenchendo o campo código automatico
    oStruZZN:SetProperty('ZZN_COD',MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'GETSXENUM("ZZN", "ZZN_COD")'))

    //descrição do modelo
    oModel:SetDescription('Modelo de dados - Categorias de CNH')

    //descrição do submodelo
    oModel:GetModel('ZZNMASTER'):SetDescription('Cadastro Categoria CNH')

    oModel:SetPrimaryKey({'ZZN_COD'})

return oModel

//Visualização de dados
Static Function ViewDef()
    Local oModel   := FWLoadModel('MVCCNH')
    Local oView    := FWFormView():New()
    Local oStruZZN := FWFormStruct(2,'ZZN')

    //indica o modelo da view 
    oView:SetModel(oModel)

    //cria a estrutura visual de campos
    oView:AddField('VIEW_ZZN', oStruZZN, 'ZZNMASTER')

    //cria boxes horizontais 
    oView:CreateHorizontalBox('CNH', 100)

    //relaciona os boxes com as estruturas visuais 
    oView:SetOwnerView('VIEW_ZZN','CNH')

	//cria um titulo encima de cada formulário
    oView:EnableTitleView('VIEW_ZZN', 'Categorias de CNH')
return oView

Static Function ValidaSigla(oModel)
    Local lOk := .T.
    Local nOper := oModel:GetOperation()
    Local nTamanho := len(Alltrim(oModel:GetValue('ZZNMASTER', 'ZZN_SIGLA')))

    if nOper == 3
        if nTamanho != 1 .AND. nTamanho != 3 
            lOk := .f.
            help(NIL,NIL,'Respeite os limites', NIL, 'O campo Sigla precisa ter 1 ou 3 caracteres',1,0,NIL,NIL,NIL,NIL,NIL, {'preencha corretamente o campo'})
        endif 
    endif 

return lOk 
