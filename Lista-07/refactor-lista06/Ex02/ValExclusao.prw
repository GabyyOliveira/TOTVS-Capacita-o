#INCLUDE 'TOTVS.CH'

//Exercicio 2 - validação da exclusao tabela sc5
User Function ValExclusao()
	Local lRet := .t.

	if SubStr(SC5->C5_TPINCL,1,1) == 'A'
		FwAlertError('Não foi possivel excluir este pedido, pois o mesmo está com o campo C5_TIPINCL em modo automático','Error!')
		lRet := .f.
	endif
	
Return lRet
