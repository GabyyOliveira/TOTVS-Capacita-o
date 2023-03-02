#INCLUDE 'TOTVS.CH'

User Function L5Ex15()
	Local nI, nNum , nX_Min, nJ
	Local aArray := {}

	for nI := 1 to 12
		nNum := randomize(-50,100)
		aAdd(aArray, nNum)
	next


	for nI := 1 to (len(aArray) - 1)
		nX_Min = nI
		for nJ := (nI + 1) to len(aArray)
			if aArray[nJ] < aArray[nX_Min]
				nX_Min = nJ
			endif
		next

		if nX_Min != nI
			swap(aArray, nI, nX_Min)
		endif
	next

	msgInfo(ArrToKStr(aArray, ', '))
Return

static function swap(aArray, nX, nY)
	Local nTemp := aArray[nX]

	aArray[nX] = aArray[nY]
	aArray[nY] = nTemp
return
