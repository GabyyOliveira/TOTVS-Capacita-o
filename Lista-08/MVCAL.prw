#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCAL
    Rotina MVC para cadastro de Categorias de CNH
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 27/03/2023
/*/
User Function MVCAL()
	Local oMark := FwMarkBrowse():New()
	Local cTitle := 'Cadastro de Alunos'
	Local cAlias := 'ZZM'

	//Instanciando o Browse
	oMark:SetAlias(cAlias)
	oMark:SetDescription(cTitle)
	oMark:SetFieldMark('ZZM_MARC')
	oMark:AddButton('Excluir marcados', 'U_ExcAlunos',5, 1)
	oMark:DisableReport()

	//Ativando o Mark
	oMark:Activate()
Return

//definindo o menu 
Static function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCAL' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCAL' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVCAL' OPERATION 5 ACCESS 0

return aRotina

//Modelo de Dados
Static Function ModelDef()
	//Validação do Modelo
	Local bModelPos := { |oModel| VldInstrutor(oModel)}

	Local oModel   := MPFormModel():New('MVCALM',/**/, bModelPos)
	Local oStruZZM := FWFormStruct(1, 'ZZM')
	Local aGatilho := FwStruTrigger('ZZM_INSTRU', 'ZZM_NOMEIN', 'ZZI->ZZI_NOME', .T., 'ZZI', 1, 'xFilial("ZZI")+Alltrim(M->ZZM_INSTRU)')
	//adicionando o gatilho de campo
	oStruZZM:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

	//Define de os submodelos serÃ£o fields ou grid
	oModel:AddFields('ZZMMASTER', , oStruZZM)

	//Preenchendo o campo código automatico
	oStruZZM:SetProperty('ZZM_COD',MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'GETSXENUM("ZZM", "ZZM_COD")'))

	//descriÃ§Ã£o do modelo
	oModel:SetDescription('Modelo de dados - Cadastro de Alunos')

	//descrição do submodelo
	oModel:GetModel('ZZMMASTER'):SetDescription('Cadastro de Alunos')

	oModel:SetPrimaryKey({'ZZM_COD'})

return oModel

//Visualização de dados
Static Function ViewDef()
	Local oModel   := FWLoadModel('MVCAL')
	Local oView    := FWFormView():New()
	Local oStruZZM := FWFormStruct(2,'ZZM')

	//indica o modelo da view
	oView:SetModel(oModel)

	//cria a estrutura visual de campos
	oView:AddField('VIEW_ZZM', oStruZZM, 'ZZMMASTER')

	//cria boxes horizontais
	oView:CreateHorizontalBox('ALUNOS', 100)

	//relaciona os boxes com as estruturas visuais
	oView:SetOwnerView('VIEW_ZZM','ALUNOS')

	//cria um titulo encima de cada formulário
	oView:EnableTitleView('VIEW_ZZM', 'Cadastro de Alunos')

    oView:SetFieldAction('ZZM_AULAS', { |oView| VldAula(oView)})
return oView

//Validação do Instrutor
Static Function VldInstrutor(oModel)
	Local lOk := .t.
	Local nOper := oModel:GetOperation()
	Local cNome := Alltrim(oModel:GetValue('ZZMMASTER', 'ZZM_NOME'))
	Local cInstrutor := Alltrim(oModel:GetValue('ZZMMASTER', 'ZZM_INSTRU'))
	Local cAulas := Alltrim(oModel:GetValue('ZZMMASTER', 'ZZM_AULAS'))
	Local nQtd := 0

	DbSelectArea('ZZI')

	ZZI->(DbGoTop())

	while ZZI->(!EOF())
		if Alltrim(ZZI_COD) == cInstrutor
			nQtd := ZZI_QTDAL

			if nOper == 3

				if nQtd == 5
					lOk := .f.
					help(NIL,NIL, 'Instrutor indisponivel', NIL, 'O instrutor selecionado só pode atender 5 alunos',1,0,NIL,NIL,NIL,NIL,NIL, {'Escolha outro instrutor'})
				else
					nQtd++
					RecLock('ZZI', .F.)
					ZZI->ZZI_QTDAL := nQtd
					ZZI->(MSUnlock())
				endif

			elseif nOper == 5

				if cAulas == '1'
					lOk := .f.
					help(NIL,NIL, 'Aluno(a) em aulas', NIL, 'O aluno(a) ' +cNome+' Não pode ser excluido pois esta em aula' ,1,0,NIL,NIL,NIL,NIL,NIL, {'Escolha outro aluno'})
				else
                    if nQtd <= 1
                        nQtd := 0
                    else 
					    nQtd--
                    endif 

					RecLock('ZZI', .F.)
					ZZI->ZZI_QTDAL := nQtd
					ZZI->(MSUnlock())
				endif
			
			endif

		endif
		ZZI->(DbSkip())
	enddo

return lOk

//Exclusão de alunos marcados
User Function ExcAlunos()

	if MsgYesNo('Confima a exclusão dos Alunos marcados?')

		DbSelectArea('ZZM')
		ZZM->(DbGoTop())

		while ZZM->(!EOF())

			if oMark:IsMark()
				if Alltrim(ZZM_AULAS) != '1'
					RecLock('ZZI', .F.)
					ZZM->(DbDelete())
					ZZM->(MSUnlock())
                else 
                    help(NIL,NIL, 'Aluno(a) em aulas', NIL, 'O aluno(a) ' +cNome+' Não pode ser excluido pois esta em aula' ,1,0,NIL,NIL,NIL,NIL,NIL, {'Escolha outro aluno'})
				endif

			endif

			ZZM->(DbSkip())
		enddo
	endif

	oMark:Refresh(.T.)
return

//Validação do campo Realizando Aulas 
Static Function VldAula(oView)
    Local oModel := oView:GetModel('ZZMMASTER')
    Local cInstrutor := Alltrim(oView:GetValue('ZZMMASTER', 'ZZM_INSTRU'))
    Local cAulas := Alltrim(oView:GetValue('ZZMMASTER', 'ZZM_AULAS'))

    DbSelectArea('ZZI')
    DbSetOrder(1)

    if cAulas == "1"
        if Empty(cInstrutor)
            oModel:SetValue('ZZM_AULAS', "2")
            help(NIL,NIL, 'Instrutor não selecionado', NIL, 'Instrutor em branco' ,1,0,NIL,NIL,NIL,NIL,NIL, {'Selecione corretamente o instrutor e retorne a este campo'})
            oView:Refresh()
		elseif DbSeek(xFilial("ZZI") + cInstrutor)
			if ZZI_QTDAL == 5
				oModel:SetValue('ZZM_AULAS', "2")
				help(NIL,NIL, 'Instrutor indisponivel', NIL, 'O instrutor selecionado só pode atender 5 alunos',1,0,NIL,NIL,NIL,NIL,NIL, {'Escolha outro instrutor'})
				oView:Refresh()
			endif 
        endif 
    endif 
return 
