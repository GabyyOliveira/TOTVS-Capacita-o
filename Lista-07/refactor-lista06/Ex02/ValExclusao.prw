#INCLUDE 'TOTVS.CH'

//Exercicio 2 - valida��o da exclusao tabela sc5
User Function ValExclusao()
	Local lRet := .t.

	if SubStr(SC5->C5_TPINCL,1,1) == 'A'
		FwAlertError('N�o foi possivel excluir este pedido, pois o mesmo est� com o campo C5_TIPINCL em modo autom�tico','Error!')
		lRet := .f.
	endif
	
Return lRet
