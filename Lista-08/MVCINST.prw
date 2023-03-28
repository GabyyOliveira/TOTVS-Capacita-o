#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCINST
    Rotina MVC para cadastro de Categorias de CNH
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 27/03/2023
/*/
User Function MVCINST()
	Local oMark  := FwMarkBrowse():New()
	Local cTitle := 'Cadastro do Instrutor'
	Local cAlias := 'ZZI'

	//Instanciando o Browse
	oMark:SetAlias(cAlias)
	oMark:SetDescription(cTitle)

	oMark:SetFieldMark('ZZI_MARC')

	oMark:AddButton('Excluir marcados', 'U_ExcMarcados',5, 1)

	oMark:DisableReport()

	//Ativando o browse
	oMark:Activate()
Return

//definindo o menu 
Static function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCINST' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCINST' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVCINST' OPERATION 5 ACCESS 0

return aRotina

//Modelo de Dados
Static Function ModelDef()
	//Valida��o do Modelo
	Local bModelPos := { |oModel| VldIns(oModel)}

	Local oModel   := MPFormModel():New('MVCINSTM', /**/, bModelPos)
	Local oStruZZI := FWFormStruct(1, 'ZZI')

	//Define de os submodelos ser�o fields ou grid
	oModel:AddFields('ZZIMASTER', , oStruZZI)

	//descri��o do modelo
	oModel:SetDescription('Modelo de dados - Cadastro de Instrutores')

	//descri��o do submodelo
	oModel:GetModel('ZZIMASTER'):SetDescription('Cadastro de Instrutores')

	oModel:SetPrimaryKey({'ZZI_COD'})

return oModel

//Visualiza��o de dados
Static Function ViewDef()
	Local oModel   := FWLoadModel('MVCINST')
	Local oView    := FWFormView():New()
	Local oStruZZI := FWFormStruct(2,'ZZI')

	//indica o modelo da view
	oView:SetModel(oModel)

	//cria a estrutura visual de campos
	oView:AddField('VIEW_ZZI', oStruZZI, 'ZZIMASTER')

	//cria boxes horizontais
	oView:CreateHorizontalBox('INSTRUTORES', 100)

	//relaciona os boxes com as estruturas visuais
	oView:SetOwnerView('VIEW_ZZI','INSTRUTORES')

	//cria um titulo encima de cada formul�rio
	oView:EnableTitleView('VIEW_ZZI', 'Cadastro de Instrutores')
return oView

User Function ExcMarcados()

	if MsgYesNo('Confima a exclus�o dos Instrutores marcados?')

		DbSelectArea('ZZI')

		ZZI->(DbGoTop())

		while ZZI->(!EOF())

			if oMark:IsMark()

				if ZZI_QTDAL < 1
					RecLock('ZZI', .F.)
					ZZI->(DbDelete())
					ZZI->(MSUnlock())
				else 
					Help(NIL,NIL,'Opera��o n�o permitida!',NIL,'o Instrutor n�o pode ser excluido',1,0,NIL,NIL,NIL,NIL,NIL, {'Ele tem alunos'})
				endif

			endif

			ZZI->(DbSkip())
		enddo
	endif

	oMark:Refresh(.T.)
return

Static Function VldIns(oModel)
	Local nOper := oModel:GetOperation()
	Local lOk := .T.
	Local cNivelEscolar := Alltrim(oModel:GetValue('ZZIMASTER', 'ZZI_ESCOLA'))
	Local dIdade := oModel:GetValue('ZZIMASTER', 'ZZI_NASC')
	Local dHabilita := oModel:GetValue('ZZIMASTER', 'ZZI_HABILI')
	Local cQtaAlunos := oModel:GetValue('ZZIMASTER', 'ZZI_QTDAL')


	if nOper == 3
		if cNivelEscolar == 'F'
			lOk := .F.
			help(NIL,NIL, 'N�vel de Escolaridade Invalido', NIL, 'Volte a estudar',1,0,NIL,NIL,NIL,NIL,NIL, {'Procure a escola mais proxima'})
		elseif (DateDiffYear(dIdade, Date()) < 21)
			lOk := .F.
			help(NIL,NIL, 'Idade Invalida', NIL, '� necess�rio ter mais de 21 anos para ser instrutor',1,0,NIL,NIL,NIL,NIL,NIL, {'Volte quando tiver 21 anos ou mais'})
		elseif (DateDiffYear(dHabilita, Date()) < 2)
			lOk := .f.
			help(NIL,NIL, 'Habilita��o invalida', NIL, '� necess�rio ter pelo menos 2 anos da 1 habilita��o',1,0,NIL,NIL,NIL,NIL,NIL, {'Aguarde ate ter 2 anos'})
		endif

	elseif nOper == 5
		if cQtaAlunos >= 1
			lOk := .f.
			Help(NIL,NIL,'Opera��o n�o permitida!',NIL,'o Instrutor n�o pode ser excluido',1,0,NIL,NIL,NIL,NIL,NIL, {'Ele tem alunos'})
		endif
	endif

return lOk

